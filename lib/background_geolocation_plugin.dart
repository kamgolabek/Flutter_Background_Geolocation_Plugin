import 'dart:async';

import 'package:flutter/services.dart';

import 'location_item.dart';

class BackgroundGeolocationPlugin {
  static const MethodChannel _channel = const MethodChannel('background_geolocation_plugin');

  static Future<String>  startLocationTracking() async {
    final String res = await _channel.invokeMethod('startLocationTracking');
    return res;
  }

  static Future<String>  stopLocationTracking() async {
    final String res = await _channel.invokeMethod('stopLocationTracking');
    return res;
  }

  static Future<String>  pauseLocationTracking() async {
    final String res = await _channel.invokeMethod('pauseLocationTracking');
    return res;
  }

  static Future<String>  continueLocationTracking() async {
    final String res = await _channel.invokeMethod('continueLocationTracking');
    return res;
  }

  static Future<Map<String,dynamic>>  getState() async {
    Map<dynamic, dynamic> state = await _channel.invokeMethod('getState');
    return Map<String, dynamic>.from(state);
  }

  static Future<String>  requestPermissions() async {
    String res = await _channel.invokeMethod('requestPermissions');
    return res;
  }

  static Future<List<LocationItem>> getAllLocations() async {
    try {
      List<dynamic> result = await _channel.invokeMethod('getAllLocations');
      return result
        .cast<Map<dynamic,dynamic>>()
        .map((item) => LocationItem(item.cast<String, dynamic>()))
        .toList();
    } on PlatformException catch (e) {
      print("error: " + e.message);
      return null;
    }
  }

  static Future<List<LocationItem>> getAllStoredLocationsWithTimeBiggerThan(int time) async {
    try {
      List<dynamic> result = await _channel.invokeMethod('getAllLocationsWithTimeBiggerThan',{"time":time});
      return result
        .cast<Map<dynamic,dynamic>>()
        .map((item) => LocationItem(item.cast<String, dynamic>()))
        .toList();
    } on PlatformException catch (e) {
      print("error: " + e.message);
      return null;
    }
  }

  
}
