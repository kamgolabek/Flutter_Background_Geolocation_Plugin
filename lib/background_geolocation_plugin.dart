import 'dart:async';

import 'package:flutter/services.dart';

class BackgroundGeolocationPlugin {
  static const MethodChannel _channel =
      const MethodChannel('background_geolocation_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
