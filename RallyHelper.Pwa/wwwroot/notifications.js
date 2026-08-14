// Notification helper for Rally Helper.
// Notifications are posted through the service worker registration, which is
// the only path that works while the page is hidden - and the only path that
// works at all on iOS home-screen PWAs (the `new Notification()` constructor
// is unsupported there).

export function isSupported() {
    return ('serviceWorker' in navigator)
        && ('Notification' in window)
        && ('showNotification' in ServiceWorkerRegistration.prototype);
}

export function getPermission() {
    if (!isSupported()) return 'unsupported';
    return Notification.permission; // 'default' | 'granted' | 'denied'
}

// Must be called from a user gesture.
export async function requestPermission() {
    if (!isSupported()) return 'unsupported';
    try {
        return await Notification.requestPermission();
    } catch {
        return 'denied';
    }
}

// Shows a notification, but only while the app is in the background - when the
// app is visible the table row highlight already communicates the change.
export async function showIfHidden(title, body) {
    if (!isSupported() || Notification.permission !== 'granted') return false;
    if (document.visibilityState !== 'hidden') return false;

    try {
        const registration = await navigator.serviceWorker.ready;
        await registration.showNotification(title, {
            body: body,
            tag: 'rally-stage-target', // replace the previous one instead of stacking
            renotify: true,            // still alert (sound/vibration) on replacement
            icon: 'icon-192.png',
            badge: 'icon-192.png',
            vibrate: [150, 75, 150]
        });
        return true;
    } catch {
        return false;
    }
}
