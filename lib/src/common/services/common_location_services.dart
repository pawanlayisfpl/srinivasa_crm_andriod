import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../config/constants/app_strings.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
@lazySingleton
class CommonLocationServices {
  Future<dynamic> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      throw "Location services are not enabled. Please enable location services.";
      // return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        log("location denied successfully");
        throw "Location permissions are denied. Please enable location permissions.";
        //return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      log("location denied forever ");

      throw "Location permissions are denied forever. Please enable location permissions.";
      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    log("location permisson requested");

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true);
  }

  Future<List<Location>> getLocationFromLocationName(
      {required String locationName}) async {
    try {
      //! FROM TEXT ADDRESS
      List<Location> locations =
          await locationFromAddress(locationName,);
      return locations;
      //! FROM COORDINATES
      // List<Placemark> placemarks =
      //     await placemarkFromCoordinates(52.2165157, 6.9437819);

      // return locations;
    } catch (e) {
      print(e);
      throw Exception("Error in getting location from address");
    }
  }

  //! get location name from coordinates local
  //! LOCAL
  Future<List<Placemark>> getLocationFromCoordinatesFromLocal(
      {required double latitude, required double longitude}) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          latitude, longitude,
          );
      return placemarks;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Error in getting address from coordinates");
    }
  }

  //! get user current position
  Future<Position> getUserCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // throw Exception("Location services are disabled");
       locationPermission = await Geolocator.checkPermission();

    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }

    if(locationPermission == LocationPermission.deniedForever){
      var status = await Permission.location.request();
      if (status.isDenied) {
        throw Exception("Location permissions are denied forever");
      }
      status = await Permission.locationAlways.request();
      if (status.isDenied) {
        throw Exception("Location permissions are denied forever");
      }
      locationPermission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition();
    log("printing position in ${position.toString()}");
    return position;
  }

  //! get location name by using lat lng
  Future<String> getLocationNameFromGeoCodingApi(
      {required LatLng latLng}) async {
    try {
      const mapKey = AppStrings.googleApikey;
      Uri url = Uri.parse(
          "https://maps.googleapis.com/maps/api/geocode/json?latlng=${latLng.latitude},${latLng.longitude}&key=$mapKey");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // log(response.body);
        final jsonBody = jsonDecode(response.body);
        log("printing formateed address");
        log(jsonBody["results"][0]["formatted_address"]);
        return jsonBody["results"][0]["formatted_address"];
      } else {
        throw "Error in getting location name";
      }
    } catch (e) {
      throw "Server error";
    }
  }

  //! get polylines

  // Future<List<LatLng>> getPolylinePoints(
  //     {required PointLatLng origin, required PointLatLng destination}) async {
  //   List<LatLng> polylineCoordinates = [];
  //   PolylinePoints points = PolylinePoints();
  //   PolylineResult results = await points.getRouteBetweenCoordinates(
  //       AppStrings.googleApikey, origin, destination,
  //       travelMode: TravelMode.driving);
  //   if (results.points.isNotEmpty) {
  //     results.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   } else {
  //     log(results.errorMessage.toString());
  //   }
  //   return polylineCoordinates;
  // }

  //! get location from google api
  Future<String?> getUserCurrentLocationFromApi() async {
    log("Getting location from Google Api");
    try {
      String url =
          "https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyC1JkQvCmFNAuQ43Csd2mASGkMkRCaCxaY";
      final response = await http.get(Uri.parse(url));
      log(response.toString());

      if (response.statusCode == 200) {
        var jsonBody = json.decode(response.body);
        log(jsonBody.toString());
        return jsonBody.toString();
      } else {
        throw "Server Exception ${response.statusCode.toString()}";
      }
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }

  //! autocomplete services
  //  Future<AutoCompleteModel?> getAutoCompleteServices(
  //     {required String input}) async {
  //   try {
  //     String url =
  //         "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=${AppStrings.googleApikey}";
  //     final response = await Dio().get(url);

  //     if (response.statusCode == 200) {
  //       log("Auto Complete Response is Okay");
  //       AutoCompleteModel model = AutoCompleteModel.fromJson(response.data);
  //       log(model.predictions!.first.toJson().toString());
  //       return model;
  //     } else {
  //       throw "No data found on server";
  //     }
  //   } catch (e) {
  //     log("Autocomplete Services error ${e.toString()}");
  //     throw e.toString();
  //   }
  // }
}
