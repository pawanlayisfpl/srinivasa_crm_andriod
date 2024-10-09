import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../StoragePermissions/presentations/storage_permission_screen.dart';

class LocationPermissionsPage extends StatefulWidget {
  @override
  _LocationPermissionsPageState createState() => _LocationPermissionsPageState();
}

class _LocationPermissionsPageState extends State<LocationPermissionsPage> {
  bool allPermissionsGranted = false; // State to track if all permissions are granted

  Future<void> _requestLocationPermissions() async {
    // Request FINE_LOCATION (foreground location) permission
    PermissionStatus locationStatus = await Permission.location.request();

    if (locationStatus.isGranted) {
      // Proceed with background location permission request if needed
      await _requestBackgroundLocationPermission();
    } else if (locationStatus.isDenied) {
      // Permission denied, show explanation and re-request permission
      _showPermissionDialog('Location permission is required for app functionality.', Permission.location);
    } else if (locationStatus.isPermanentlyDenied) {
      // Permission permanently denied, show dialog to redirect user to settings
      _showSettingsDialog();
    }
  }

  Future<void> _requestBackgroundLocationPermission() async {
    PermissionStatus backgroundStatus = await Permission.locationAlways.request();

    if (backgroundStatus.isGranted) {
      // All permissions are granted, update the state
      setState(() {
        allPermissionsGranted = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('All location permissions granted!')),
      );
    } else if (backgroundStatus.isDenied) {
      // Permission denied, show explanation and re-request background permission
      _showPermissionDialog('Background location permission is required for app functionality.', Permission.locationAlways);
    } else if (backgroundStatus.isPermanentlyDenied) {
      // Permission permanently denied, show dialog to redirect user to settings
      _showSettingsDialog();
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
                Navigator.of(context).pop(); // Close dialog
                PermissionStatus status = await permission.request(); // Re-request permission

                // Check status after re-requesting
                if (status.isGranted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Permission granted!')),
                  );
                  // Check if all permissions are now granted
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
                Navigator.of(context).pop(); // Close dialog without doing anything
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
                openAppSettings(); // Redirect to app settings
                Navigator.of(context).pop();
              },
              child: Text('Open Settings'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),)
    
          ],
        );
      },
    );

  }

  // Method to check if all permissions are granted
  Future<void> _checkAllPermissionsGranted() async {
    bool locationGranted = await Permission.location.isGranted;
    bool backgroundGranted = await Permission.locationAlways.isGranted;

    if (locationGranted && backgroundGranted) {
      setState(() {
        allPermissionsGranted = true; // Update state to show Next button
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Permissions')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Request Location Permissions',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'This app requires access to your location in the foreground and background to provide location-based features. Please grant the necessary permissions.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 40),
          
              // Added reasons for location permissions
              Text(
                'Why Location Permissions Are Needed:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
                children: [
                  Text('• Location permission is necessary for accessing latitude and longitude of current locations.', style: TextStyle(fontSize: 16)),
                  Text('• Location always permission is required for tracking your device location, ensuring accurate routes and maximum customer coverage.', style: TextStyle(fontSize: 16)),
                  Text('• Location permission helps in verifying customer attendance by accurately tracking their locations.', style: TextStyle(fontSize: 16)),
                  Text('• Location access allows for efficient monitoring of employee locations, enhancing operational efficiency.', style: TextStyle(fontSize: 16)),
                  Text('• With location data, we can provide personalized services to customers based on their geographical information.', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: _requestLocationPermissions,
                child: Text('Grant Location Permissions'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              if (allPermissionsGranted) // Conditionally show "Next" button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StoragePermissionsPage()));
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
