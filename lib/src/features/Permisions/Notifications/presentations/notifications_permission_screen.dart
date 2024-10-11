// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:srinivasa_crm_new/src/common/snackbar/common_snackbar.dart';
import 'package:srinivasa_crm_new/src/common/widgets/widgets.dart';
import 'package:srinivasa_crm_new/src/config/locator/locator.dart';
import 'package:srinivasa_crm_new/src/features/Permisions/BatteryPermissions/presentations/battery_permission_page.dart';
import '../../../../common/services/notifications/common_notifications.dart';
import '../../../../common/services/notifications/common_push_notifications_services.dart';
import '../../../../config/constants/app_colors.dart';

class NotificationPermissionsPage extends StatefulWidget {
  const NotificationPermissionsPage({super.key});

  @override
  _NotificationPermissionsPageState createState() => _NotificationPermissionsPageState();
}

class _NotificationPermissionsPageState extends State<NotificationPermissionsPage> {
  bool notificationsGranted = false;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    // _initializeNotifications();
    // _initializePushNotifications();
    // _checkPermissions(); 
    WidgetsBinding.instance.addPostFrameCallback((t) async {
await _initializeNotifications();
await _initializePushNotifications();
await _checkPermissions();


    });
  }

  // Initialize the notification plugin
  Future<void> _initializeNotifications() async {
    final localNotifications = locator.get<CommonNotifications>();
    await localNotifications.requestNotificationPermission();
    await localNotifications.initNotifications();
    

   
  }

  // Method to request notification permission
  Future<void> _requestNotificationPermission() async {
    PermissionStatus status = await Permission.notification.request();

    if (status.isGranted) {
      setState(() {
        notificationsGranted = true;
      });
      CommonSnackbar.show(context, 'Push notification permission granted!');
    } else if (status.isDenied) {
      _showPermissionDialog('Push notification permission is required to receive important alerts.', Permission.notification);
    } else if (status.isPermanentlyDenied) {
      _showSettingsDialog();
    }
  }

  // Method to check if permissions are already granted
  Future<void> _checkPermissions() async {
    PermissionStatus status = await Permission.notification.status;

    if (status.isGranted) {
      // If notification permissions are granted, navigate to Battery Optimization Permissions
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BatteryOptimizationPermissionsPage()),
      );
    }
  }

  // Method to show dialog explaining why permission is needed
  void _showPermissionDialog(String message, Permission permission) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Permission Required'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                PermissionStatus status = await permission.request();

                if (status.isGranted) {
                  setState(() {
                    notificationsGranted = true;
                  });
                  CommonSnackbar.show(context, 'Permission granted!');
                } else if (status.isDenied) {
                  CommonSnackbar.show(context, 'Permission denied again.',color: Colors.red);

                } else if (status.isPermanentlyDenied) {
                  _showSettingsDialog();
                }
              },
              child: const Text('Allow'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Deny'),
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
          title: const Text('Permission Permanently Denied'),
          content: const Text('You have permanently denied the permission. Please enable it from the app settings.'),
          actions: [
            TextButton(
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
              child: const Text('Open Settings'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Method to show a custom SnackBar at the top of the screen

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.notifications_active_outlined),
            SizedBox(width: 8),
            Text('Push Notifications Permission'),
          ],
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Text(
                'Enable Notifications',
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'This app requires access to send you notifications for important updates and alerts. Please grant the necessary permissions.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.grey[700]),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Explanation section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPermissionPoint(
                        'Receive important alerts and updates.',
                        FontAwesomeIcons.bell,
                        screenWidth,
                      ),
                      _buildPermissionPoint(
                        'Stay informed about your tasks.',
                        FontAwesomeIcons.tasks,
                        screenWidth,
                      ),
                      _buildPermissionPoint(
                        'Get real-time notifications for attendance or order status.',
                        FontAwesomeIcons.clock,
                        screenWidth,
                      ),
                      _buildPermissionPoint(
                        'Never miss important notifications.',
                        FontAwesomeIcons.exclamationCircle,
                        screenWidth,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.04),
              CommonButton(callback: _requestNotificationPermission, title: "Grant Notification Permission"),
              
              SizedBox(height: screenHeight * 0.02),
              if (notificationsGranted)
               CommonButton(callback: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BatteryOptimizationPermissionsPage()),
                    );
               }, title: "Next"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPermissionPoint(String description, IconData icon, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          FaIcon(icon, color: AppColors.primaryColor, size: screenWidth * 0.06),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Text(
              description,
              style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
  
  Future<void> _initializePushNotifications() async {
     final pushNotifcationsServices = locator.get<CommonPushNotificationsServices>();
    await pushNotifcationsServices.requestNotification();
    await pushNotifcationsServices.initializePushNotifications();
  }
}
