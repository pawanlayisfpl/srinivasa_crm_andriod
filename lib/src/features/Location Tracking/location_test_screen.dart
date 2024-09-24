
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../common/services/notifications/common_notifications.dart';
import '../../config/locator/locator.dart';


JsonEncoder encoder = const JsonEncoder.withIndent('     ');

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

   late bool _isMoving;
  late bool _enabled;
  late String _motionActivity;
  late String _odometer;
  late String _content;

  @override
  void initState() {
    super.initState();
    _isMoving = false;
    _enabled = false;
    _content = '';
    _motionActivity = 'UNKNOWN';
    _odometer = '0';

    // 1.  Listen to events (See docs for all 12 available events).
        // Fired whenever a location is recorded

    bg.BackgroundGeolocation.onLocation(_onLocation);

    // Fired whenever the plugin changes motion-state (stationary->moving and vice-versa)
    bg.BackgroundGeolocation.onMotionChange(_onMotionChange);
    bg.BackgroundGeolocation.onActivityChange(_onActivityChange);
    // Fired whenever the state of location-services changes.  Always fired at boot
    bg.BackgroundGeolocation.onProviderChange(_onProviderChange);
    bg.BackgroundGeolocation.onConnectivityChange(_onConnectivityChange);

    // 2.  Configure the plugin
    bg.BackgroundGeolocation.ready(bg.Config(
            desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
            distanceFilter: 0.05,
            // distanceFilter: 10.0,
            stopOnTerminate: false,
            startOnBoot: true,
            debug: true,
            logLevel: bg.Config.LOG_LEVEL_VERBOSE,
            reset: true))
        .then((bg.State state) {
      setState(() {
        _enabled = state.enabled;
        _isMoving = state.isMoving == true;
      });
    });
  }

  void _onClickEnable(enabled) {
    if (enabled) {
      bg.BackgroundGeolocation.start().then((bg.State state) {
        log('[start] success $state');
        setState(() {
          _enabled = state.enabled;
          _isMoving = state.isMoving == true;
        });
      });
    } else {
      bg.BackgroundGeolocation.stop().then((bg.State state) {
        log('[stop] success: $state');
        // Reset odometer.
        bg.BackgroundGeolocation.setOdometer(0.0);

        setState(() {
          _odometer = '0.0';
          _enabled = state.enabled;
          _isMoving = state.isMoving == true;
        });
      });
    }
  }
// Manually toggle the tracking state: moving vs stationary
void _onClickChangePace() {
  // Update the state to reflect the new tracking state
  setState(() {
    _isMoving = !_isMoving; // Toggle the _isMoving boolean
  });

  // Log the new state
  log('[onClickChangePace] -> $_isMoving');

  // Change the pace of the BackgroundGeolocation plugin
  bg.BackgroundGeolocation.changePace(_isMoving).then((bool isMoving) {
    // Log success message with the new state
    log('[changePace] success $isMoving');
  }).catchError((e) {
    // Log error message if there is an issue changing the pace
    log('[changePace] ERROR: ${e.code}');
  });
}

  // Manually fetch the current position.
  void _onClickGetCurrentPosition() {
    bg.BackgroundGeolocation.getCurrentPosition(
            persist: false, // <-- do not persist this location
            desiredAccuracy: 0, // <-- desire best possible accuracy
            timeout: 30000, // <-- wait 30s before giving up.
            // timeout: 5000, // <-- wait 30s before giving up.
            samples: 3 // <-- sample 3 location before selecting best.
            )
        .then((bg.Location location) {
      log('[getCurrentPosition] - $location');
      Fluttertoast.showToast(msg: "${location.coords.latitude.toString()} ${location.coords.longitude.toString()  }");
    }).catchError((error) {
      log('[getCurrentPosition] ERROR: $error');
    });
  }

  ////
  // Event handlers
  //

  void _onLocation(bg.Location location) {
    log('[location] - $location');

    final String odometerKM = (location.odometer / 1000.0).toStringAsFixed(1);

    setState(() {
      _content = encoder.convert(location.toMap());
      _odometer = odometerKM;
    });
  }

  void _onMotionChange(bg.Location location) {
    log('[motionchange] - $location');

  }

  void _onActivityChange(bg.ActivityChangeEvent event) {
    log('[activitychange] - $event');
    setState(() {
      _motionActivity = event.activity;
    });
  }

  void _onProviderChange(bg.ProviderChangeEvent event) {
    log('$event');

    setState(() {
      _content = encoder.convert(event.toMap());
    });
  }

  void _onConnectivityChange(bg.ConnectivityChangeEvent event) {
    log('$event');
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        

          // ROW 
          // LOCATION TRACKING BUTTON
           Container(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.gps_fixed),
                onPressed: _onClickGetCurrentPosition,
              ),
              Text('$_motionActivity · $_odometer km'),
              MaterialButton(
                  minWidth: 50.0,
                  color: _isMoving ? Colors.red : Colors.green,
                  onPressed: _onClickChangePace,
                  child: Icon(_isMoving ? Icons.pause : Icons.play_arrow,
                      color: Colors.white))
            ],
          ),
        ),
      
        ],
      ),
    );
  }
  
  Future<void> backgroundFetchFunction() async  {
    // Execute a task about every 15 minutes:
    log('Background fetch function called');

BackgroundFetch.configure(BackgroundFetchConfig(
  minimumFetchInterval: 15
), (String taskId) async { // <-- This is your periodic-task callback 
  
  var location = await bg.BackgroundGeolocation.getCurrentPosition(
    samples: 3,
    extras: {   // <-- your own arbitrary meta-data
      "event": "getCurrentPosition"
    }
  );
  log('[getCurrentPosition] $location');
  BackgroundFetch.finish(taskId);   // <-- signal that your task is complete
});

  }
}


