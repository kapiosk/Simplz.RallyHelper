// Caution! Be sure you understand the caveats before publishing an application with
// offline support. See https://aka.ms/blazor-offline-considerations

self.addEventListener('message', event => {
    if (event.data && event.data.type === 'SKIP_WAITING') {
        self.skipWaiting();
    }
});

self.importScripts('./service-worker-assets.js');
self.addEventListener('install', event => event.waitUntil(onInstall(event)));
self.addEventListener('activate', event => event.waitUntil(onActivate(event)));
self.addEventListener('fetch', event => event.respondWith(onFetch(event)));

const cacheNamePrefix = 'offline-cache-';
const cacheName = `${cacheNamePrefix}${self.assetsManifest.version}`;
const offlineAssetsInclude = [ /\.dll$/, /\.pdb$/, /\.wasm/, /\.html/, /\.js$/, /\.json$/, /\.css$/, /\.woff$/, /\.png$/, /\.jpe?g$/, /\.gif$/, /\.ico$/, /\.blat$/, /\.dat$/, /\.webmanifest$/ ];
const offlineAssetsExclude = [ /^service-worker\.js$/ ];

async function onInstall(event) {
    console.info('Service worker: Install');

    // Fetch and cache all matching items from the assets manifest
    const assetsRequests = self.assetsManifest.assets
        .filter(asset => offlineAssetsInclude.some(pattern => pattern.test(asset.url)))
        .filter(asset => !offlineAssetsExclude.some(pattern => pattern.test(asset.url)))
        .map(asset => new Request(asset.url, { integrity: asset.hash, cache: 'no-cache' }));
    await caches.open(cacheName).then(cache => cache.addAll(assetsRequests));

    // Activate immediately instead of parking in "waiting" until the user
    // clicks the update banner. If the old worker is broken, the page may
    // never load and the banner is never seen - a catch-22 that strands
    // users on the broken version.
    self.skipWaiting();
}

async function onActivate(event) {
    console.info('Service worker: Activate');

    // Delete unused caches
    const cacheKeys = await caches.keys();
    await Promise.all(cacheKeys
        .filter(key => key.startsWith(cacheNamePrefix) && key !== cacheName)
        .map(key => caches.delete(key)));

    // Take control of open clients right away (pairs with skipWaiting above).
    await self.clients.claim();
}

async function onFetch(event) {
    if (event.request.method !== 'GET') {
        return fetch(event.request);
    }

    // Navigations are network-first: a normal refresh always picks up the
    // latest deployment when online, and falls back to the cached app shell
    // when offline (rally stages often have poor signal).
    if (event.request.mode === 'navigate') {
        try {
            return await fetch(event.request);
        } catch {
            const cache = await caches.open(cacheName);
            const cachedShell = await cache.match('index.html');
            if (cachedShell) return cachedShell;
            return Response.error();
        }
    }

    // Fingerprinted assets are immutable: cache-first, network as fallback.
    const cache = await caches.open(cacheName);
    const cachedResponse = await cache.match(event.request);
    return cachedResponse || fetch(event.request);
}
