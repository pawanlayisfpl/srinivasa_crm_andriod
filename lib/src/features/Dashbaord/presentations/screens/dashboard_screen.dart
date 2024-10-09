import 'dart:io';

import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/shared/widgets/common_drawer_widget.dart';
import 'package:srinivasa_crm_new/src/common/services/notifications/common_notifications.dart';
import 'package:srinivasa_crm_new/src/common/services/notifications/common_push_notifications_services.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/widgets/dashboard_body_widget.dart';
import 'package:srinivasa_crm_new/src/features/Location%20Tracking/presentations/native_screen.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/screens/mark_attendance_screen.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';


 import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
    static const platform = MethodChannel('com.srinivasa.crm');


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback( (time) async {
     await context.read<AlertCubit>().getAlerts();
      await checkingPermissions();
      await _handleScheduleNotificationsSetup();
      await initializePushNotificationServices();
      

     
    });
  }
  @override
  Widget build(BuildContext context) {
    
//   void showLogoutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           title: const Text('Are you sure you want to Logout?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // CANCEL button action
//               },
//               child: const Text(
//                 'CANCEL',
//                 style: TextStyle(color: AppColors.primaryColor),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                     Navigator.of(context).pop();


//                 if(Platform.isAndroid) {
//                    const platform = MethodChannel('com.srinivasa.crm');
//               await  platform.invokeMethod('stop');
//                 }
                      
               
//                 final localstorge = locator.get<KeyValueStorage>();
//                 final locationservices = locator.get<CommonLocationServices>();
//                 final postion = await locationservices.getUserCurrentPosition();
    
//                 // await Workmanager().cancelAll();
//                 PunchoutPostModel punchoutPostModel = PunchoutPostModel(latitude: postion.latitude.toString(), longitude: postion.longitude.toString());
//          await context.read<MarkAttendanceCubit>().punchOutLogic(punchoutPostModel: punchoutPostModel, isLogoutClicked: true);
//               await  localstorge.sharedPreferences.clear();
//            Fluttertoast.showToast(msg: "All Background services stopped");
//  await Navigator.pushNamedAndRemoveUntil(
//                     context, Routes.loginScreen, (route) => false);             
               
              
//               },
//               child: const Text('Yes',
//                   style: TextStyle(
//                       color: AppColors.primaryColor,
//                       fontWeight: FontWeight.bold)),
//             ),
//           ],
//         );
//       },
//     );
//   }

void showLogoutDialog(BuildContext context) {
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
              // Close the dialog immediately
              Navigator.of(context).pop();

              // Perform logout logic asynchronously
              if (Platform.isAndroid) {
                const platform = MethodChannel('com.srinivasa.crm');
                await platform.invokeMethod('stop');
              }

              final localStorage = locator.get<KeyValueStorage>();
             

              // Check if the context is still mounted before using it
              if (context.mounted) {
                await context.read<MarkAttendanceCubit>().punchOutLogic(
                 
                  isLogoutClicked: true,
                );
              }

              await localStorage.sharedPreferences.clear();
              Fluttertoast.showToast(msg: "All Background services stopped");

              // Check again if the context is still mounted before navigating
              if (context.mounted) {
                await Navigator.pushNamedAndRemoveUntil(
                  context, Routes.loginScreen, (route) => false,
                );
              }
            },
            child: const Text(
              'Yes',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
}

   
   
    return  DoubleTapToExit(
       snackBar: const SnackBar(
        content: Text('Tap again to exit !'),
      ),
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
                Navigator.push(context, SlideRightRoute(screen: const NativeScreen()));
              } else if (value == "1") {
                // await Workmanager().cancelAll();
                // Fluttertoast.showToast(msg: "Sync list clicked");
              
              } else if (value == "2") {
                // showLogoutDialog(context);
                QuickAlert.show(context: context, type: QuickAlertType.confirm, title: "Logout",text: "Are you sure?",confirmBtnText: "Yes",confirmBtnColor: Colors.black,onConfirmBtnTap: () {
                  context.read<ProfileCubit>().logout(context: context);
      
    });
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
                child: Text('Log Out'),
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
   await locator.get<CommonNotifications>().initNotifications();
   await locator.get<CommonNotifications>().requestNotificationPermission();

  Future<void> requestPermissions(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses;

  if (Platform.isIOS) {
    statuses = await [
      Permission.storage,
      // Permission.locationWhenInUse,
      // Permission.storage,
      // Add other iOS-specific permissions if needed
    ].request();
  } else {
    statuses = await [
      Permission.location,
      // Permission.storage,
      Permission.locationWhenInUse,
      Permission.ignoreBatteryOptimizations,
      // Add other Android-specific permissions if needed
    ].request();
  }
  // Check if all permissions are granted
  if (statuses.values.every((status) => status.isGranted)) {
    debugPrint("All permissions granted");
  } else {
    debugPrint("Not all permissions were granted");
    // Handle the case where permissions are not granted

    // Show a dialog to request permissions
   if(Platform.isAndroid) {
     showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: const Text('Permissions Required'),
          content: const Text('This app needs location and storage permissions to function properly. Please grant the required permissions.'),
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
}
     try {
      if(Platform.isAndroid) {
    // await requestPermissions(context);
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
  
  
  _handleScheduleNotificationsSetup() async  {

    final keyValueStorage = locator.get<KeyValueStorage>();


    // final notifications = locator.get<CommonNotifications>();
    CommonNotifications notifications = CommonNotifications(flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin());
    await keyValueStorage.clearValue(KeyValueStrings.isNotificationScheduled);
    await notifications.initNotifications();
    


    bool? isCreated =  keyValueStorage.sharedPreferences.getBool(KeyValueStrings.isNotificationScheduled);



    if(isCreated != null) {

// Helper function to get the next instance of a specific time (hours, minutes)
tz.TZDateTime nextInstanceOfTime(int hour, int minute) {
  tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledTime = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
  
  // If the scheduled time is already past today, schedule it for tomorrow
  if (scheduledTime.isBefore(now)) {
    scheduledTime = scheduledTime.add(const Duration(days: 1));
  }

  return scheduledTime;
}
   final notifications = CommonNotifications(flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin());

   
    CommonNotificationModel punchInNotificationModel = CommonNotificationModel(title: 'Reminder: Daily Punch-in', description: '''Please punch out,If already done, you can ignore this message.''');

  // Time for 9:00 AM
  final tz.TZDateTime morningTime = nextInstanceOfTime(9, 0);

      CommonNotificationModel punchOutNotifications = CommonNotificationModel(title: 'Reminder: Daily Punch-Out', description: '''Please punch out if you're done for the day. If already done, you can ignore this message.''');

  tz.initializeTimeZones();
  await notifications.showNotificationAtSpecificTime(morningTime, punchOutNotifications);
  // Time for 7:45 PM
  // final tz.TZDateTime eveningTime = _nextInstanceOfTime(19, 45);
  final tz.TZDateTime eveningTime = nextInstanceOfTime(15, 58);


  // Schedule 9:00 AM notification
  // await notifications.showNotificationAtSpecificTime(morningTime,punchInNotificationModel);
     DateTime dateTime = DateTime.now().copyWith(hour: 06, minute: 50, second: 0, millisecond: 0);
  tz.initializeTimeZones();
  await notifications.showNotificationAtSpecificTime(dateTime,punchInNotificationModel);
  keyValueStorage.sharedPreferences.setBool(KeyValueStrings.isNotificationScheduled, true);


    }else {
      return;

    }


  // await notifications.showNotification(commonNotificationModel: CommonNotificationModel(title: 'test schedule notification', descrption: 'test scheduled  description'));


  }
  
  initializePushNotificationServices() async {
    final pushNotifcationsServices = locator.get<CommonPushNotificationsServices>();
    await pushNotifcationsServices.requestNotification();
    await pushNotifcationsServices.initializePushNotifications();
  }
}