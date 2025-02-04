import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart';

class AlertSyncDialogScreen extends StatefulWidget {
  final List<Map<String, dynamic>> locationsArray;

  const AlertSyncDialogScreen({
    super.key,
    required this.locationsArray,
  });

  @override
  _AlertSyncDialogScreenState createState() => _AlertSyncDialogScreenState();
}

class _AlertSyncDialogScreenState extends State<AlertSyncDialogScreen> {
  bool isSyncing = false;
  bool syncCompleted = false;
  String syncMessage = "Please sync your data to ensure it is updated in the database.";
  static const platform = MethodChannel('com.srinivasa.crm');

  Future<void> deleteAllLocationData() async {
    try {
      await platform.invokeMethod("deleteAllLocationData");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete all location data: $e')),
      );
    }
  }

  Future<void> syncData() async {
    setState(() {
      isSyncing = true;
      syncMessage = "Syncing data... Please wait.";
    });

    try {
      final List<Map<String, dynamic>> locationsArray = widget.locationsArray;

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? tokenValue = prefs.getString('token');

      final Uri url = Uri.parse('https://crmapitest.srinivasa.co:8446/crm_sfpl/se/locations-list');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Bearer $tokenValue',
        },
        body: jsonEncode({'locationsList': locationsArray}),
      );

      if (response.statusCode == 200) {
        if (mounted) {
          await deleteAllLocationData();
          await context.read<ProfileCubit>().logout(context: context);
        }
      } else {
        if (mounted) {
          setState(() {
            syncMessage = "Sync failed: ${response.statusCode}";
            syncCompleted = true;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          syncMessage = "Error syncing data: $e";
          syncCompleted = true;
        });
      }
    }

    // Auto-close the dialog only if the widget is still mounted
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });

    if (mounted) {
      setState(() {
        isSyncing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Sync Data"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(syncMessage),
          const SizedBox(height: 10),
          if (isSyncing) const CircularProgressIndicator(), // Show loader while syncing
        ],
      ),
      actions: syncCompleted
          ? [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              )
            ]
          : [
              TextButton(
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 300), () async {
                    if (mounted) {
                      await QuickAlert.show(
                        context: context,
                        type: QuickAlertType.confirm,
                        title: "Logout",
                        text: "Are you sure?",
                        confirmBtnText: "Yes",
                        confirmBtnColor: Colors.black,
                        onConfirmBtnTap: () async {
                          if (mounted) {
                            await context.read<ProfileCubit>().logout(context: context);
                          }
                        },
                      );
                    }
                  });
                },
                child: const Text("Later"),
              ),
              TextButton(
                onPressed: () => syncData(),
                child: const Text("Sync Now"),
              ),
            ],
    );
  }
}