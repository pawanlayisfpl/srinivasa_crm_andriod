import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Notifications/presentations/notifications_permission_screen.dart';

class StoragePermissionsPage extends StatefulWidget {
  @override
  _StoragePermissionsPageState createState() => _StoragePermissionsPageState();
}

class _StoragePermissionsPageState extends State<StoragePermissionsPage> {
  bool storagePermissionsGranted = false; // Track storage permissions

  // Method to request storage permissions depending on Android version
 Future<void> _requestStoragePermissions() async {
  Map<Permission, PermissionStatus> statuses;

  // Check Android version
  if (await Permission.storage.isGranted) {
    // For Android 13 or below, use storage permission
    setState(() {
      storagePermissionsGranted = true;
    });
  } else if (await Permission.photos.isGranted && await Permission.videos.isGranted && await Permission.audio.isGranted) {
    // All permissions for Android 14+ are already granted
    setState(() {
      storagePermissionsGranted = true;
    });
  } else {
    // For Android 14+, request media-specific permissions
    statuses = await [
      Permission.photos,  // For images
      Permission.videos,  // For videos
      Permission.audio,   // For audio
    ].request();

    // Check if permissions are granted
    if (statuses[Permission.photos]?.isGranted == true &&
        statuses[Permission.videos]?.isGranted == true &&
        statuses[Permission.audio]?.isGranted == true) {
      setState(() {
        storagePermissionsGranted = true; // Update state when all permissions are granted
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All storage-related permissions granted!')),
      );
    } else {
      // Handle denied or permanently denied permissions
      if (statuses[Permission.photos]?.isDenied == true ||
          statuses[Permission.videos]?.isDenied == true ||
          statuses[Permission.audio]?.isDenied == true) {
        _showPermissionDialog(
          'Storage permission is required to access photos, videos, or audio files on your device.',
          Permission.photos); // Or handle specific permission
      } else if (statuses[Permission.photos]?.isPermanentlyDenied == true ||
          statuses[Permission.videos]?.isPermanentlyDenied == true ||
          statuses[Permission.audio]?.isPermanentlyDenied == true) {
        _showSettingsDialog();
      }
    }
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
                PermissionStatus status = await permission.request(); // Re-request permission

                if (status.isGranted) {
                  setState(() {
                    storagePermissionsGranted = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Permission granted!')),
                  );
                } else if (status.isDenied) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Permission denied again.')),
                  );
                } else if (status.isPermanentlyDenied) {
                  _showSettingsDialog();
                }
              },
              child: const Text('Allow'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Storage Permissions')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Request Storage Permissions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This app requires access to your device storage to read and write files. Please grant the necessary permissions.',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _requestStoragePermissions,
              child: const Text('Grant Storage Permissions'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            if (storagePermissionsGranted) // Show next button if permissions are granted
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationPermissionsPage()));
                },
                child: const Text('Next'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
