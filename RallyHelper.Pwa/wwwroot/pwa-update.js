let updateCallback = null;
let registrationInstance = null;

export function registerForUpdate(callback) {
    updateCallback = callback;

    if (!('serviceWorker' in navigator)) return;

    navigator.serviceWorker.ready.then(registration => {
        registrationInstance = registration;

        registration.addEventListener('updatefound', () => {
            const newWorker = registration.installing;
            if (!newWorker) return;

            newWorker.addEventListener('statechange', () => {
                if (newWorker.state === 'installed' && navigator.serviceWorker.controller) {
                    notifyUpdateAvailable();
                }
            });
        });

        // If a waiting worker already exists at page load, notify immediately.
        if (registration.waiting && navigator.serviceWorker.controller) {
            notifyUpdateAvailable();
        }
    });

    // When the new worker activates, reload once.
    let refreshing = false;
    navigator.serviceWorker.addEventListener('controllerchange', () => {
        if (refreshing) return;
        refreshing = true;
        window.location.reload();
    });
}

export function skipWaiting() {
    if (!registrationInstance || !registrationInstance.waiting) return Promise.resolve();
    registrationInstance.waiting.postMessage({ type: 'SKIP_WAITING' });
    return Promise.resolve();
}

function notifyUpdateAvailable() {
    if (updateCallback) {
        updateCallback.invokeMethodAsync('OnUpdateAvailable');
    }
}

export function forceReload() {
    window.location.reload();
}