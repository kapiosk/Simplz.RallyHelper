export function watch(instance) {
    if (!navigator.geolocation) {
        instance.invokeMethodAsync('OnError', 0);
        return -1;
    }
    const options = {
        enableHighAccuracy: true,
        maximumAge: 1000,
        timeout: 15000
    };
    return navigator.geolocation.watchPosition(
        (position) => {
            instance.invokeMethodAsync('OnPositionUpdate', {
                timestamp: position.timestamp,
                accuracy: position.coords.accuracy,
                latitude: position.coords.latitude,
                longitude: position.coords.longitude,
                altitude: position.coords.altitude,
                speed: position.coords.speed
            });
        },
        (error) => {
            instance.invokeMethodAsync('OnError', error.code);
        },
        options
    );
}

export function clearWatch(id) {
    if (id > 0 && navigator.geolocation) {
        navigator.geolocation.clearWatch(id);
    }
}