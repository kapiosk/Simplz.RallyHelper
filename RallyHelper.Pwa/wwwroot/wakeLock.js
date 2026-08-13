// Screen Wake Lock helper for Rally Helper.
// Keeps the screen on while the app is visible. The OS auto-releases the lock
// when the page is hidden, so we re-acquire it whenever the page becomes
// visible again (as long as the user setting is enabled).

let sentinel = null;
let wantLock = false;

async function acquire() {
    if (!('wakeLock' in navigator)) return false;
    if (sentinel !== null) return true;
    try {
        sentinel = await navigator.wakeLock.request('screen');
        sentinel.addEventListener('release', () => { sentinel = null; });
        return true;
    } catch {
        // Denied (e.g. no user gesture yet, low battery) - retried on tap/visibility.
        sentinel = null;
        return false;
    }
}

export function isSupported() {
    return 'wakeLock' in navigator;
}

export async function enable() {
    wantLock = true;
    return await acquire();
}

export async function disable() {
    wantLock = false;
    if (sentinel !== null) {
        try { await sentinel.release(); } catch { /* already released */ }
        sentinel = null;
    }
}

export function isHeld() {
    return sentinel !== null;
}

document.addEventListener('visibilitychange', () => {
    if (wantLock && document.visibilityState === 'visible') {
        acquire();
    }
});

// Some browsers require a user gesture before granting the lock; retry on tap.
window.addEventListener('pointerdown', () => {
    if (wantLock && sentinel === null && document.visibilityState === 'visible') {
        acquire();
    }
});
