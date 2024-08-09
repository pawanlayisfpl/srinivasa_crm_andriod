import 'dart:convert';
import 'dart:developer';
import 'dart:isolate';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:workmanager/workmanager.dart';
import 'package:http/http.dart' as http;


const fetchBackground = "background";
const tracking = 'tracking';
const oneshot = "one-shot";
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
  //     case tracking:
  // log('save function is also getting calleed');
  // CommonLocationServices locationServicess = CommonLocationServices();
  // await locationServicess.determinePosition();
  // Position postition = await locationServicess.getUserCurrentPosition();
  // log(postition.toString());
  // WorkLocationModel workLocationModel = WorkLocationModel(
  //     latitude: postition.latitude,
  //     longitude: postition.longitude,
  //     datetime: DateTime.now());
  // try {
   
  //   Fluttertoast.showToast(msg: 'Location saved successfully');
  // } catch (e) {
  //   log('Failed to save location: $e');
  // }

  // // // New code using isolates
  // // ReceivePort receivePort = ReceivePort();
  // // Isolate.spawn(_trackingIsolate, receivePort.sendPort);
  // break;

      case fetchBackground:
        log("BACKGROUND TASK IS WORKED ON ${DateTime.now().toString()}");

        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        log(position.toString());
            Fluttertoast.showToast(msg: "Location updated successfully");

    

        try {
          

          // //! POST REQUEST
          final postUrl = Uri.parse("https://reqres.in/api/users");
          final postResponse = await http.post(postUrl,
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode({"name": "morpheus", "job": "leader"}));

          if (postResponse.statusCode == 201) {
            // //! SAVE TO LOCAL STORAGE FEATURE
            log("Background POST REQUEST IS SUCCESS");
          } else {
            log("Background task POST request is failed");
          }
        } catch (e) {
          log("Error during API request: $e");
        }

        break;

      case oneshot:
        log("one shot task is working in background after 30 seconds delay");
    }

    return Future.value(true);
  });
}

void saveDataToLocalStorage(String data) async {
  // Example: Save data to local storage (use the appropriate package)
  log("Saving data to local storage: $data");
  // Implement your local storage saving logic here

  final pref = await SharedPreferences.getInstance();
  pref.setString("first", data.toString());
  log(data);
}

// void _trackingIsolate(SendPort sendPort) async {
//   log('save function is also getting calleed');
//   LocationServicess locationServicess = LocationServicess();
//   LocationDatabase locationDatabase = LocationDatabase();
//   await locationDatabase.initDatabase();
//   await locationServicess.determinePosition();
//   Position postition = await locationServicess.getUserCurrentPosition();
//   log(postition.toString());
//   WorkLocationModel workLocationModel = WorkLocationModel(
//       latitude: postition.latitude,
//       longitude: postition.longitude,
//       datetime: DateTime.now());
//   try {
//     await locationDatabase.saveLocationToDatabase(
//         workLocationModel.latitude, workLocationModel.longitude);
//     Fluttertoast.showToast(msg: 'Location saved successfully');
//   } catch (e) {
//     log('Failed to save location: $e');
//   }
// }












//! for creating workmanager tasks
  //  Workmanager().registerPeriodicTask(
  //                     "periodic-task-identifier",
  //                     "background",
  //                     tag: "background",
  //                     // When no frequency is provided the default 15 minutes is set.
  //                     // Minimum frequency is 15 min. Android will automatically change your frequency to 15 min if you have configured a lower frequency.
  //                     frequency: const Duration(minutes: 15),
  //                     constraints: Constraints(
  //                         networkType: NetworkType.connected,
  //                         requiresBatteryNotLow: true,
  //                         requiresCharging: true,
  //                         requiresDeviceIdle: false,
  //                         requiresStorageNotLow: true),
  //                   );


class SqliteLocationModel {
  final double latitue;
  final double longitude;
  final DateTime dateTime;

  SqliteLocationModel({required this.latitue, required this.longitude, required this.dateTime});
}
  var location = [
    SqliteLocationModel(latitue: 0.0, longitude: 0.0, dateTime: DateTime.parse(DateTime.now().toString()))
    
  ];




  class WorkLocationModel {
  final double? latitude;
  final double? longitude;
  final DateTime? datetime;

  WorkLocationModel({
    this.latitude,
    this.longitude,
    this.datetime,
  });

  factory WorkLocationModel.fromJson(Map<String, dynamic> json) {
    return WorkLocationModel(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      datetime: json['datetime'] != null ? DateTime.parse(json['datetime']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'datetime': datetime?.toIso8601String(),
    };
  }
}