# background_geolocation_plugin

Background geolocation plugin for Flutter (Android only).

## Features

- Android Foreground service make sure to save geolocations when application is in the background as well as when the app is closed.
- Control Location tracking (start/stop/pause/continue)
- Getting state of the service (running/binded/how many locations stored/ are permissions granted / metadata)
- Requesting permission for GPS
- Setting and reading metadata (might be helpfull when application were closed, but service is continue to store geolocations)
- Getting all stored locations & only new ones

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## Installing

Add service declaration to your Android manifest file, just before ending tag: "```</application>```".

```(xml)
 <service
    android:name="com.kgit.background_geolocation_plugin.service.BackgroundLocationService"
    android:enabled="true"
    android:exported="false"/>
```
