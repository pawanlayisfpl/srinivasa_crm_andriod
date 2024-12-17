import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For icons
import 'package:srinivasa_crm_new/src/common/widgets/widgets.dart';
import 'package:srinivasa_crm_new/src/features/login/presentation/screens/login_screen.dart';

import '../../../../config/constants/app_colors.dart';
// Dashboard screen import

class BatteryOptimizationPermissionsPage extends StatefulWidget {
  const BatteryOptimizationPermissionsPage({super.key});

  @override
  _BatteryOptimizationPermissionsPageState createState() =>
      _BatteryOptimizationPermissionsPageState();
}

class _BatteryOptimizationPermissionsPageState
    extends State<BatteryOptimizationPermissionsPage> {
  bool batteryOptimizationGranted = false;

  @override
  void initState() {
    super.initState();
    _checkBatteryOptimizationPermissions(); // Check if battery optimization is already granted
  }

  // Method to check if battery optimization permissions are already granted
  Future<void> _checkBatteryOptimizationPermissions() async {
    PermissionStatus status = await Permission.ignoreBatteryOptimizations.status;

    if (status.isGranted) {
      // If battery optimization permission is granted, navigate to LoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  // Request Battery Optimization Permission
  Future<void> _requestBatteryOptimizationPermission() async {
    PermissionStatus status = await Permission.ignoreBatteryOptimizations.request();

    if (status.isGranted) {
      setState(() {
        batteryOptimizationGranted = true;
      });
      _showSnackBar('Battery optimization permission granted!');
    } else if (status.isDenied) {
      _showPermissionDialog(
          'Battery optimization permission is required to ensure the app runs in the background without interruption.',
          Permission.ignoreBatteryOptimizations);
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
          title: const Text('Permission Required'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                PermissionStatus status = await permission.request();

                if (status.isGranted) {
                  setState(() {
                    batteryOptimizationGranted = true;
                  });
                  _showSnackBar('Permission granted!');
                } else if (status.isDenied) {
                  _showSnackBar('Permission denied again.');
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
          content: const Text(
              'You have permanently denied the permission. Please enable it from the app settings.'),
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

  // Method to show SnackBar at the top
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 150), // Adjust the margin for top placement
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.battery_alert),
            SizedBox(width: 8),
            Text('Battery Optimization Permission'),
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
              SizedBox(height: screenHeight * 0.03),
              Text(
                'Allow Battery Optimization',
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'To improve performance and prevent interruptions, please exclude the app from battery optimizations.',
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
                        'Ensure the app runs smoothly in the background.',
                        FontAwesomeIcons.batteryFull,
                        screenWidth,
                      ),
                      _buildPermissionPoint(
                        'Prevent background task interruptions.',
                        FontAwesomeIcons.sync,
                        screenWidth,
                      ),
                      _buildPermissionPoint(
                        'Receive timely notifications and updates.',
                        FontAwesomeIcons.clock,
                        screenWidth,
                      ),
                      _buildPermissionPoint(
                        'Avoid missing important data syncs.',
                        FontAwesomeIcons.database,
                        screenWidth,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.04),
              ElevatedButton.icon(
                onPressed: _requestBatteryOptimizationPermission,
                icon: Icon(Icons.battery_saver, size: screenWidth * 0.06,color: Colors.white,),
                label: Text(
                  'Grant Battery Optimization Permission',
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1, vertical: screenHeight * 0.02),
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              if (batteryOptimizationGranted)
                CommonButton(
                  callback: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  title: "Next",
                ),
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
}
