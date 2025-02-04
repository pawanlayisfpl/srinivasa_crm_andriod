import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class OfflineLocationScreen extends StatefulWidget {
  const OfflineLocationScreen({super.key});

  @override
  _OfflineLocationScreenState createState() => _OfflineLocationScreenState();
}

class _OfflineLocationScreenState extends State<OfflineLocationScreen> {
  static const platform = MethodChannel("com.srinivasa.crm");

  List<dynamic> locationData = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchLocationData();
  }

  // Future<void> fetchLocationData() async {
  //   try {
  //     final String result = await platform.invokeMethod("location-data");
  //     final List<dynamic> data = json.decode(result);
  //     setState(() {
  //       locationData = data;
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       errorMessage = 'Failed to fetch location data: $e';
  //       isLoading = false;
  //     });
  //   }
  // }

  Future<void> fetchLocationData() async {
  try {
    final String result = await platform.invokeMethod("location-data");
    log("Raw JSON from Android: $result"); // Debugging

    final List<dynamic> data = json.decode(result);
    log("Parsed JSON Data: $data"); // Debugging

    setState(() {
      locationData = data;
      isLoading = false;
    });
  } catch (e) {
    log("Error fetching location data: $e");
    setState(() {
      errorMessage = 'Failed to fetch location data: $e';
      isLoading = false;
    });
  }
}

  void shareLocationData() {
    if (locationData.isNotEmpty) {
      final String jsonData = jsonEncode(locationData);
      Share.share(jsonData, subject: 'Offline Location Data');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No location data available to share.'),
        ),
      );
    }
  }

  Future<void> deleteSpecificLocationData(String column, String value) async {
    try {
      final int rowsDeleted = await platform.invokeMethod(
        "deleteSpecificLocationData",
        {'conditionColumn': column, 'conditionValue': value},
      );
      if (rowsDeleted > 0) {
        fetchLocationData(); // Refresh data
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$rowsDeleted rows deleted successfully.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No matching data found to delete.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete location data: $e')),
      );
    }
  }

  Future<void> deleteAllLocationData() async {
    try {
      await platform.invokeMethod("deleteAllLocationData");
      setState(() {
        locationData.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All location data deleted successfully.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete all location data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Location Data'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
            IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: fetchLocationData,
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: shareLocationData,
          ),
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              deleteAllLocationData();
            },
          ),
          // IconButton(
          //   icon: Icon(Icons.delete_outline),
          //   onPressed: () {
          //     // Example: Delete specific data (replace with actual criteria)
          //     deleteSpecificLocationData('latitude', '12.345678');
          //   },
          // ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(
                  child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                )
              : locationData.isEmpty
                  ? const Center(
                      child: Text(
                        'No location data available.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : RefreshIndicator(
                    onRefresh: () async {
                      await fetchLocationData();
                      },
                    child: ListView.builder(
                        padding: const EdgeInsets.all(12.0),
                        itemCount: locationData.length,
                        itemBuilder: (context, index) {
                          final item = locationData[index];
                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading:
                                  const Icon(Icons.location_on, color: Colors.teal),
                              title: Text(
                                'Lat: ${item['latitude']}, Long: ${item['longitude']}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Time: ${DateFormat.yMMMMd().format(DateTime.parse(item['userDateTime']))}, '
                                '${DateFormat.jms().format(DateTime.parse(item['userDateTime']))}',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                          );
                        },
                      ),
                  ),
    );
  }
}
