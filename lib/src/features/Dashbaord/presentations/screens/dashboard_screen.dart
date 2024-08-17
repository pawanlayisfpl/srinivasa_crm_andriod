import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:srinivasa_crm_new/shared/widgets/common_drawer_widget.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/widgets/dashboard_body_widget.dart';
import 'package:srinivasa_crm_new/src/features/Location%20Tracking/presentations/native_screen.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/screens/mark_attendance_screen.dart';
import 'package:workmanager/workmanager.dart';

import '../../../../../shared/data/repo/work_manager_services.dart';
import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../../mark attendance/domain/domain.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
    static const platform = MethodChannel('com.example.srinivasa_crm_new');


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback( (time) async {
      context.read<AlertCubit>().getAlerts();
      await checkingPermissions();

     
    });
  }
  @override
  Widget build(BuildContext context) {
    
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Are you sure you want to Logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // CANCEL button action
              },
              child: const Text(
                'CANCEL',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
            ElevatedButton(
              onPressed: () async {

                if(Platform.isAndroid) {
                   const platform = MethodChannel('com.example.srinivasa_crm_new');
                platform.invokeMethod('stop');
                }
                      
                // Handle LOGOUT button action
                // You can add your logout logic here
                final localstorge = locator.get<KeyValueStorage>();
                final locationservices = locator.get<CommonLocationServices>();
                final postion = await locationservices.getUserCurrentPosition();
    
                // await Workmanager().cancelAll();
                PunchoutPostModel punchoutPostModel = PunchoutPostModel(latitude: postion.latitude.toString(), longitude: postion.longitude.toString());
          if(context.mounted) {
                await context.read<MarkAttendanceCubit>().punchOutLogic(punchoutPostModel: punchoutPostModel, isLogoutClicked: true);

          }              
                Fluttertoast.showToast(msg: "All Background services stopped");
              await  localstorge.sharedPreferences.clear();

              if(context.mounted) {
                Navigator.of(context).pop(); // Close the dialog

              }
                if(context.mounted) {
                   Navigator.pushNamedAndRemoveUntil(
                    context, Routes.loginScreen, (route) => false);
                }
              },
              child: const Text('Yes',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
    return PopScope(
      onPopInvoked: (bool? val) async{
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text("Do you want to exit?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("NO")),
                    TextButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: const Text("YES"))
                  ],
                ));
      },
      child: Scaffold(
        drawer: const CommonDrawerWidget(),
        appBar: AppBar(
      
          title: const CustomAppBarTitleWidget(title: "Dashboard",),
          actions: [
             PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) async {
              if (value == "0") {
                Fluttertoast.showToast(msg: "App Permission clicked");
                Navigator.push(context, SlideRightRoute(screen: NativeScreen()));
              } else if (value == "1") {
                // await Workmanager().cancelAll();
                // Fluttertoast.showToast(msg: "Sync list clicked");
              
              } else if (value == "2") {
                _showLogoutDialog(context);
              }
            },
            itemBuilder: (BuildContext context) => [
              // const PopupMenuItem<String>(
              //   value: '0',
              //   child: Text('App Permission'),
              // ),
              // const PopupMenuDivider(),
              // const PopupMenuItem<String>(
              //   value: '1',
              //   child: Text('Sync List'),
              // ),
              // const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: '2',
                child: Text('Signout'),
              ),
            ],
            icon: const Icon(Icons.more_vert),
          ),
          ],
        ),

        body: const DashboardBodyWidget(),
      ),
      
    );
    
  }
  
  checkingPermissions() async  {
  //   Future<void> requestPermissions() async {
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.location,
  //     Permission.storage,

  //     Permission.locationWhenInUse,
  //     Permission.ignoreBatteryOptimizations,

  //     // Add other permissions required by your app
  //   ].request();

  //   // Check if all permissions are granted
  //   if (statuses.values.every((status) => status.isGranted)) {
  //     log("All permissions granted");
  //   } else {
  //     log("Not all permissions were granted");
  //     // Handle the case where permissions are not granted
  //     // here add the code to ask for persmission for storage and location

  //   }
  // }
  Future<void> requestPermissions(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses;

  if (Platform.isIOS) {
    statuses = await [
      Permission.location,
      // Permission.locationWhenInUse,
      // Permission.storage,
      // Add other iOS-specific permissions if needed
    ].request();
  } else {
    statuses = await [
      Permission.location,
      Permission.storage,
      Permission.locationWhenInUse,
      Permission.ignoreBatteryOptimizations,
      // Add other Android-specific permissions if needed
    ].request();
  }
  // Check if all permissions are granted
  if (statuses.values.every((status) => status.isGranted)) {
    log("All permissions granted");
  } else {
    log("Not all permissions were granted");
    // Handle the case where permissions are not granted
    Fluttertoast.showToast(msg: 'Platform is iOS');

    // Show a dialog to request permissions
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: Text('Permissions Required'),
          content: Text('This app needs location and storage permissions to function properly. Please grant the required permissions.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Grant Permissions'),
              onPressed: () async {
                Navigator.of(context).pop();
                await openAppSettings();
              },
            ),
          ],
        );
      },
    );
  }
}
     try {
      if(Platform.isAndroid) {
    await requestPermissions(context);
       // Request permissions before starting the service
      await platform.invokeMethod('start');
      }else if(Platform.isIOS) {
        await requestPermissions(context);

      }
      
      else {
//         // / Periodic task registration
// Workmanager().registerPeriodicTask(
//     fetchBackground, 
//    fetchBackground, 
//     // When no frequency is provided the default 15 minutes is set.
//     // Minimum frequency is 15 min. Android will automatically change your frequency to 15 min if you have configured a lower frequency.
//     frequency: Duration(hours: 1),
// );
      }
  
      print('Service started');
    } on PlatformException catch (e) {
      print('Failed to start service: ${e.message}');
    }
  
    
  }
}