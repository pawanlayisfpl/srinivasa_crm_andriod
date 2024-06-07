import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';


@lazySingleton
class CommonPermissionService {
  final List<Permission> permissions = [
    Permission.location,
    Permission.storage,
    Permission.ignoreBatteryOptimizations,
  ];

  Future<bool> arePermissionsGranted() async {
    bool areAllPermissionsGranted = true;

    for (var permission in permissions) {
      var status = await permission.status;
      if (!status.isGranted) {
        areAllPermissionsGranted = false;
        break;
      }
    }

    return areAllPermissionsGranted;
  }

  Future<bool> requestPermissions() async {
    bool areAllPermissionsGranted = true;

    var statuses = await permissions.request();
    statuses.forEach((permission, status) {
      if (!status.isGranted) {
        areAllPermissionsGranted = false;
        if (status.isPermanentlyDenied) {
          openAppSettings();
        }
      }
    });

    return areAllPermissionsGranted;
  }
}