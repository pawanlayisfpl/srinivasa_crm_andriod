import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:srinivasa_crm_new/src/common/widgets/widgets.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/features/Permisions/Notifications/presentations/notifications_permission_screen.dart';

import '../../../login/presentation/screens/login_screen.dart';

class LocationPermissionsPage extends StatefulWidget {
  @override
  _LocationPermissionsPageState createState() => _LocationPermissionsPageState();
}

class _LocationPermissionsPageState extends State<LocationPermissionsPage> {
  bool allPermissionsGranted = false;

  @override
  void initState() {
    super.initState();
    _checkAllPermissionsGrantedOnInit();
  }

  // Future<void> _checkAllPermissionsGrantedOnInit() async {
  //   bool locationGranted = await Permission.location.isGranted;
  //   bool backgroundGranted = await Permission.locationAlways.isGranted;

  //   if (locationGranted && backgroundGranted) {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => NotificationPermissionsPage()),
  //     );
  //   }
  // }
   // Check if all permissions are granted on init
 Future<void> _checkAllPermissionsGrantedOnInit() async {
  bool locationGranted = await Permission.location.isGranted;
  bool backgroundGranted = await Permission.locationAlways.isGranted;
  bool notificationGranted = await Permission.notification.isGranted;
  bool batteryGranted = await Permission.ignoreBatteryOptimizations.isGranted;

  // If all permissions are granted, navigate directly to LoginScreen
  if (locationGranted && backgroundGranted && notificationGranted && batteryGranted) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  } 
  // If only location permission is granted, navigate to NotificationPermissionsPage
  else if (locationGranted && backgroundGranted && !notificationGranted) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => NotificationPermissionsPage()),
    );
  } 
  // If location permission is not granted, request location permissions
  else {
    // _requestLocationPermissions();
  }
}

  Future<void> _requestLocationPermissions() async {
    if (await Permission.location.isGranted) {
      await _requestBackgroundLocationPermission();
    } else {
      PermissionStatus locationStatus = await Permission.location.request();

      if (locationStatus.isGranted) {
        await _requestBackgroundLocationPermission();
      } else if (locationStatus.isDenied) {
        _showPermissionDialog('Location permission is required for app functionality.', Permission.location);
      } else if (locationStatus.isPermanentlyDenied) {
        _showSettingsDialog();
      }
    }
  }

  Future<void> _requestBackgroundLocationPermission() async {
    if (await Permission.locationAlways.isGranted) {
      setState(() {
        allPermissionsGranted = true;
      });
     ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('All location permissions are already granted!'),
    behavior: SnackBarBehavior.floating, // Makes the SnackBar floating
    margin: EdgeInsets.fromLTRB(20, 40, 20, 0), // Adjust the margin to position it at the top
    backgroundColor: Colors.green, // Sets the background color to green
  ),
);
    await  Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NotificationPermissionsPage()),
      );
    } else {
      PermissionStatus backgroundStatus = await Permission.locationAlways.request();

      if (backgroundStatus.isGranted) {
        setState(() {
          allPermissionsGranted = true;
        });
      ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('All location permissions are  granted!'),
    behavior: SnackBarBehavior.floating, // Makes the SnackBar floating
    margin: EdgeInsets.fromLTRB(20, 40, 20, 0), // Adjust the margin to position it at the top
    backgroundColor: Colors.green, // Sets the background color to green
  ),
);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NotificationPermissionsPage()),
        );
      } else if (backgroundStatus.isDenied) {
        _showPermissionDialog('Background location permission is required for app functionality.', Permission.locationAlways);
      } else if (backgroundStatus.isPermanentlyDenied) {
        _showSettingsDialog();
      }
    }
  }

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
                Navigator.of(context).pop();
                PermissionStatus status = await permission.request();
                if (status.isGranted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Permission granted!')),
                  );
                  _checkAllPermissionsGranted();
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
                Navigator.of(context).pop();
              },
              child: Text('Deny'),
            ),
          ],
        );
      },
    );
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Permission Permanently Denied'),
          content: Text('You have permanently denied the permission. Please enable it from the app settings.'),
          actions: [
            TextButton(
              onPressed: () {
                openAppSettings();
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

  Future<void> _checkAllPermissionsGranted() async {
    bool locationGranted = await Permission.location.isGranted;
    bool backgroundGranted = await Permission.locationAlways.isGranted;

    if (locationGranted && backgroundGranted) {
      setState(() {
        allPermissionsGranted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.location_on_outlined),
            SizedBox(width: 8),
            Text('Location Permissions', style: TextStyle(fontSize: 22)),
          ],
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                'Grant Location Permissions',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'This app requires location access to provide location-based features both in the foreground and background. Please grant the necessary permissions.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 10),

              // Explanation section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPermissionPoint(
                        'Access current location coordinates',
                        FontAwesomeIcons.mapMarkerAlt,
                      ),
                      _buildPermissionPoint(
                        'Enable background tracking for route accuracy',
                        FontAwesomeIcons.route,
                      ),
                      _buildPermissionPoint(
                        'Verify customer attendance with location',
                        FontAwesomeIcons.checkCircle,
                      ),
                      _buildPermissionPoint(
                        'Monitor employee locations efficiently',
                        FontAwesomeIcons.userTie,
                      ),
                      _buildPermissionPoint(
                        'Provide personalized services based on location',
                        FontAwesomeIcons.cogs,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () => _showLocationPermissionDialog(context),
                icon: Icon(Icons.location_on_outlined, size: 28),
                label: Text('Grant Location Permissions', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 20),
              if (allPermissionsGranted)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NotificationPermissionsPage()),
                    );
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
      ),
    );
  }

  Widget _buildPermissionPoint(String description, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          FaIcon(icon, color: AppColors.primaryColor, size: 24),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
void _showLocationPermissionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Location Permission Required'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/png/locationalways.png', height: MediaQuery.of(context).size.height * 0.25), // Adjust the height as needed
            SizedBox(height: 10),
            Text(
              'Please Allow all the time from the settings.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          CommonButton(callback: () {
               Navigator.of(context).pop(); // Close the dialog
              _requestLocationPermissions(); 
          }, title: "Allow Permission"),
        
          CommonButton(
            callback: () {
              Navigator.of(context).pop(); // Just close the dialog
            },
            title: "Cancel",
          ),
        ],
      );
    },
  );
}

}
