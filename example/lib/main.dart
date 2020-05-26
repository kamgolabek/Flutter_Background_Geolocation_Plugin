import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:background_geolocation_plugin/background_geolocation_plugin.dart';
import 'package:background_geolocation_plugin/location_item.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String resultMsg = 'Unknown';
  List<LocationItem> allLocations = [];

  @override
  void initState() {
    super.initState();
  }

  void execMethod(methodName) async{
    var res = "";
    try {
      if(methodName == "startLocationTracking"){
        res = await BackgroundGeolocationPlugin.startLocationTracking();
      }
      else if(methodName == "stopLocationTracking"){
        res = await BackgroundGeolocationPlugin.stopLocationTracking();
      }
      else if(methodName == "pauseLocationTracking"){
        res = await BackgroundGeolocationPlugin.pauseLocationTracking();
      }
      else if(methodName == "continueLocationTracking"){
        res = await BackgroundGeolocationPlugin.continueLocationTracking();
      }
      else if(methodName == "getState"){
        var r = await BackgroundGeolocationPlugin.getState();
        res = r.toString();
      }
      else if(methodName == "requestPermissions"){
        res = await BackgroundGeolocationPlugin.requestPermissions();
      }
      else if(methodName == "getAllLocations"){
        List<LocationItem> items = await BackgroundGeolocationPlugin.getAllLocations();
        allLocations = items;
        res = "all stored locations size " + items.length.toString();
      }else if(methodName == "getNewLocations"){
        var time = allLocations.last.time;
        List<LocationItem> items = await BackgroundGeolocationPlugin.getAllStoredLocationsWithTimeBiggerThan(time);
        allLocations.addAll(items);
        res = "Got " + items.length.toString() + " new locations";
      }
    } on PlatformException catch (e){
        res = "Error, code: " + e.code + ", message: " + e.message + ", details: " + e.details;
    }

    setState(() {
      resultMsg =  "Result for: " + methodName + ": " + res;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(resultMsg),
                RaisedButton(onPressed: (){execMethod("startLocationTracking");}, child: Text("startLocationTracking"),),
                RaisedButton(onPressed: (){execMethod("stopLocationTracking");}, child: Text("stopLocationTracking"),),
                RaisedButton(onPressed: (){execMethod("pauseLocationTracking");}, child: Text("pauseLocationTracking"),),
                RaisedButton(onPressed: (){execMethod("continueLocationTracking");}, child: Text("continueLocationTracking"),),
                RaisedButton(onPressed: (){execMethod("getState");}, child: Text("getState"),),
                RaisedButton(onPressed: (){execMethod("requestPermissions");}, child: Text("requestPermissions"),),
                RaisedButton(onPressed: (){execMethod("getAllLocations");}, child: Text("getAllLocations"),),
                RaisedButton(onPressed: (){execMethod("getNewLocations");}, child: Text("getNewLocations"),),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
