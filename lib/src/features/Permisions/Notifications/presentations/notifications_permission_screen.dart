import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../mark attendance/presentations/screens/mark_attendance_screen.dart';

class NotificationPermissionsPage extends StatefulWidget {
  @override
  _NotificationPermissionsPageState createState() =>
      _NotificationPermissionsPageState();
}

class _NotificationPermissionsPageState
    extends State<NotificationPermissionsPage> {
  bool notificationsGranted = false; // State to track notification permission
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  // Initialize the notification plugin
  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Method to request notification permission
  Future<void> _requestNotificationPermission() async {
    // Use permission_handler to check if notification permission is granted
    PermissionStatus status = await Permission.notification.request();

    if (status.isGranted) {
      setState(() {
        notificationsGranted = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Push notification permission granted!')),
      );
    } else if (status.isDenied) {
      _showPermissionDialog(
          'Push notification permission is required to receive important alerts.',
          Permission.notification);
    } else if (status.isPermanentlyDenied) {
      _showSettingsDialog();
    }
  }

  // Method to show dialog explaining why permission is needed
  void _showPermissionDialog(String message, Permission permission) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Permission Required'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close dialog
                PermissionStatus status = await permission.request(); // Re-request permission

                if (status.isGranted) {
                  setState(() {
                    notificationsGranted = true; // Update state if permission granted
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Permission granted!')),
                  );
                } else if (status.isDenied) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Permission denied again.')),
                  );
                } else if (status.isPermanentlyDenied) {
                  _showSettingsDialog();
                }
              },
              child: Text('Allow'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog without doing anything
              },
              child: Text('Deny'),
            ),
          ],
        );
      },
    );
  }

  // Method to show dialog redirecting user to app settings if permission is permanently denied
  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Permission Permanently Denied'),
          content: Text(
              'You have permanently denied the permission. Please enable it from the app settings.'),
          actions: [
            TextButton(
              onPressed: () {
                openAppSettings(); // Redirect to app settings
                Navigator.of(context).pop();
              },
              child: Text('Open Settings'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Push Notifications Permission')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Request Push Notifications Permissions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'This app requires access to send you notifications for important updates and alerts. Please grant the necessary permissions.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _requestNotificationPermission,
              child: Text('Grant Notifications Permission'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            if (notificationsGranted) // Conditionally show Next button
              ElevatedButton(
                onPressed: () {
                  // Navigate to the next page
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  MarkAttendanceScreen(isCheckedInScreen: true,)));
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Dummy Next Page
class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Page')),
      body: Center(child: Text('This is the next page!')),
    );
  }
}
