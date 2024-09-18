import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

class NativeScreen extends StatelessWidget {
  static const platform = MethodChannel('com.example.srinivasa_crm_new');

  const NativeScreen({super.key});

  // void startService() async {
   
  //   try {
  //     await platform.invokeMethod('start');
  //     print('Service started');
  //   } on PlatformException catch (e) {
  //     print('Failed to start service: ${e.message}');
  //   }
  // }

  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,

      Permission.locationWhenInUse,
      Permission.ignoreBatteryOptimizations,

      // Add other permissions required by your app
    ].request();

    // Check if all permissions are granted
    if (statuses.values.every((status) => status.isGranted)) {
      print("All permissions granted");
    } else {
      print("Not all permissions were granted");
      // Handle the case where permissions are not granted
    }
  }

  void startService() async {
    try {
      await requestPermissions();
       // Request permissions before starting the service
      await platform.invokeMethod('start');
      print('Service started');
    } on PlatformException catch (e) {
      print('Failed to start service: ${e.message}');
    }
  }

  void askLocation() async {
    try{
      await platform.invokeMapMethod('location');
    }on PlatformException catch (e) {
      print('failed to get location from native side ${e.message}');
    }
  }
  void
  latLngApi() async {
    try{
      await platform.invokeMapMethod('api');
    }on PlatformException catch (e) {
      print('failed to get location from native side ${e.message}');
    }
  }

  void stopService() async {
    try {
      await platform.invokeMethod('stop');
      print('Service stopped');
    } on PlatformException catch (e) {
      print('Failed to stop service: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: startService,
              child: const Text('Start Service'),
            ),
            ElevatedButton(
              onPressed: stopService,
              child: const Text('Stop Service'),
            ),
            20.verticalSpace,
            ElevatedButton(
              onPressed: askLocation,
              child: const Text('Get Location'),
            ),
            20.verticalSpace,
            ElevatedButton(
              onPressed: latLngApi,
              child: const Text('Call Lat and Lng api'),
            ),

          ],
        ),
      ),
    );
  }
}
