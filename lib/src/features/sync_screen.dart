import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srinivasa_crm_new/src/features/offline_location_database_helper.dart';

class SyncDataScreen extends StatefulWidget {
  const SyncDataScreen({super.key});

  @override
  _SyncDataScreenState createState() => _SyncDataScreenState();
}

class _SyncDataScreenState extends State<SyncDataScreen> {
  static const platform = MethodChannel("com.srinivasa.crm");
  int pendingRecords = 0;
  bool isLoading = true;
  bool isSyncing = false; // Add a syncing state
  String errorMessage = '';
    List<Map<String, dynamic>> _locations = [];


  @override
  void initState() {
    super.initState();
    fetchLocationData();
    _fetchLocations();
  }
    Future<void> _fetchLocations() async {
      
    final locations = await OfflineLocationDatabaseHelper.instance.fetchAllLocations();
    setState(() {
      pendingRecords = locations.length;
      _locations = locations;
      isLoading = false;
    });
  }

  Future<void> fetchLocationData() async {
    try {
      final String result = await platform.invokeMethod("location-data");
      // log("Raw JSON from Android: $result");

      final List<dynamic> data = json.decode(result);
      log("Parsed JSON Data: $data");

      setState(() {
        pendingRecords = data.length;
        isLoading = false;
      });
    } catch (e) {
      log("Error fetching location data: $e");
      setState(() {
        errorMessage = 'Failed to fetch location data';
        isLoading = false;
      });
    }
  }

  Future<void> syncData() async {
    setState(() {
      isSyncing = true;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? tokenValue = prefs.getString('token');
    final String? userIdValue = prefs.getString('userId');

    if (tokenValue == null || tokenValue.isEmpty) {
      log("Token is missing or invalid.");
      setState(() {
        isSyncing = false;
      });
      return;
    }

  
    try {
      final String result = await platform.invokeMethod("location-data");
      // log("Raw JSON from Android: $result");

      final List<dynamic> data = json.decode(result);
      // log("Parsed JSON Data: $data");

      final List<Map<String, dynamic>> locationsArray = [];
      final List<Map<String, dynamic>> iosLocationArray = [];
      for (var location in data) {
        locationsArray.add({
          'latitude': location['latitude'],
          'longitude': location['longitude'],
          'userDateTime': location['userDateTime'],
          'batteryStatus': location['batteryStatus'],
        });
      }

      for(var iosLocaitn in _locations) {
        iosLocationArray.add({
           'latitude': iosLocaitn['latitude'],
          'longitude': iosLocaitn['longitude'],
          'userDateTime': iosLocaitn['userDateTime'],
          'batteryStatus': iosLocaitn['batteryStatus'],
        }
          


        );
      }

      final Uri url = Uri.parse('https://crmapitest.srinivasa.co:8446/crm_sfpl/se/locations-list');

      try {
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'Authorization': 'Bearer $tokenValue',
          },
          body: jsonEncode({'locationsList': Platform.isIOS ? iosLocationArray : locationsArray}),
        );

        if (response.statusCode == 200) {
          log("API Response: ${response.body}");
          if(Platform.isAndroid) {
          await deleteAllLocationData();
            
          }else {
            await deleteAllIosLocations();
            await _fetchLocations();
          }
       
        } else {
          log("API Error: ${response.statusCode}, ${response.body}");
        }
      } catch (error) {
        log("API Error: $error");
      }
    } catch (e) {
      log("Error decoding JSON: $e");
    }

    setState(() {
      isSyncing = false;
    });
  }

  Future<void> deleteAllIosLocations() async {
 await OfflineLocationDatabaseHelper.instance.deleteAllLocations();
 Fluttertoast.showToast(msg: 'All location updated to server successfully',backgroundColor: Colors.green,textColor: Colors.white)
;
  }

  Future<void> deleteAllLocationData() async {
    try {
      await platform.invokeMethod("deleteAllLocationData");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All location data uploaded successfully.')),
      );
      fetchLocationData();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete all location data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sync Data'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryColor, secondaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                isLoading = true;
              });

              if(Platform.isAndroid) {
              await fetchLocationData();


              }else {
                await _fetchLocations();
              }
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body:isSyncing == true  ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
        const Text("please wait data is syncing......"),
        const SizedBox(height: 15,),
        CircularProgressIndicator(color: Theme.of(context).primaryColor,),
      ],),) :  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
              child: Lottie.asset(
                'assets/lottie/sync.json',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.sync, size: 90, color: primaryColor),
              ),
            ),
            const SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator(color: primaryColor)
                : Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const[
                         BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(
                          pendingRecords > 0
                              ? Icons.warning_rounded
                              : Icons.check_circle,
                          size: 60,
                          color: pendingRecords > 0 ? Colors.orange : Colors.green,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          pendingRecords > 0
                              ? '$pendingRecords Records Pending'
                              : 'All records are synced!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: pendingRecords > 0 ? Colors.orange : Colors.green,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          pendingRecords > 0
                              ? 'Please sync your data to ensure it is updated in the database.'
                              : 'No pending records. Everything is up to date!',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
            const SizedBox(height: 30),
            isSyncing
                ? CircularProgressIndicator(color: primaryColor)
                : SyncButton(pendingRecords: pendingRecords, syncData: syncData, primaryColor: primaryColor),
          ],
        ),
      ),
    );
  }
}

class SyncButton extends StatelessWidget {
  final int pendingRecords;
  final Function syncData;
  final Color primaryColor;

  const SyncButton({super.key, 
    required this.pendingRecords,
    required this.syncData,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pendingRecords > 0
          ? () async {

             SchedulerBinding.instance.addPostFrameCallback((_) async {
              await syncData();

    
  });
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(
        pendingRecords > 0 ? 'Sync Now' : 'All Data Synced',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
