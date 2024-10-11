// // ignore_for_file: public_member_api_docs, sort_constructors_first, unused_element
// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:injectable/injectable.dart';
// import 'package:srinivasa_crm_new/src/common/services/notifications/common_notification_channel.dart';
// import 'package:srinivasa_crm_new/src/config/constants/constants.dart';
// import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/screens/dashboard_screen.dart';

// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class CommonNotificationModel {
//   final String title;
//   final String descrption;
//   CommonNotificationModel({
//     required this.title,
//     required this.descrption,
//   });
// }

// class CommonPeriodicNotificationModel {
//   final String title;
//   final String descrption;
//   final RepeatInterval repeatInterval;
//   CommonPeriodicNotificationModel({
//     required this.title,
//     required this.descrption,
//     required this.repeatInterval,
//   });
// }


// abstract class CommonNotifications {
//   Future<void> requestNotificationPermission();
//   Future<void> initNotifications();
//   Future<void> showNotification({required CommonNotificationModel commonNotificationModel});
//   Future showPeriodicallyNotification({required CommonPeriodicNotificationModel commonPeriodicNotificationModel });
//   Future<void> cancelPeriodicallyNotification(int id);
//     Future<void> showNotificationAtSpecificTime(DateTime scheduledTime,CommonNotificationModel commonNotificationModel);

// }

// @Injectable(as : CommonNotifications)
// class CommonNotificationsImpl extends CommonNotifications {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   CommonNotificationsImpl({required this.flutterLocalNotificationsPlugin});


//    static const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );

//     DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
//       attachments: [],
//       interruptionLevel: InterruptionLevel.active,
//       presentAlert: true,
//       presentBanner: true,
//       presentSound: true,
//       presentList: true,
//       categoryIdentifier: 'category',
//       threadIdentifier: 'thread',
//     );

//      String groupKey = 'com.android.example.WORK_EMAIL';
//  String groupChannelId = 'grouped channel id';
//  String groupChannelName = 'grouped channel name';


//   @override
//   Future<void> requestNotificationPermission() async {

//     if(Platform.isIOS) {
//       final result = await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );

//     }


//     if(Platform.isAndroid) {
//       await flutterLocalNotificationsPlugin
//   .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//   ?.createNotificationChannel(CommonNotificationChannel.channel);

//     }
//     // Implementation for requesting notification permission
    
//     // Handle the result if needed
    

    
//   }

//   @override
//   Future<void> showNotification({required CommonNotificationModel commonNotificationModel}) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//       icon: '@mipmap/ic_launcher'
//     );

//     DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
//       attachments: [],
//       interruptionLevel: InterruptionLevel.active,
//       presentAlert: true,
//       presentBanner: true,
//       presentSound: true,
//       presentList: true,
//       categoryIdentifier: 'category',
//       threadIdentifier: 'thread',
//     );

  
//      NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics,iOS: darwinNotificationDetails);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       commonNotificationModel.title,
//       commonNotificationModel.descrption,
//       platformChannelSpecifics,
//       payload: 'item x',
//     );
//   }
  
//   @override
//   Future<void> initNotifications() async {
//     tz.initializeTimeZones();
//     // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
// const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
// final DarwinInitializationSettings initializationSettingsDarwin =
//     DarwinInitializationSettings(
//         // onDidReceiveLocalNotification: onDidReceiveLocalNotification
//         onDidReceiveLocalNotification: (id,title,body,payload) {}
//         );

// final InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: initializationSettingsDarwin,
//     );
// flutterLocalNotificationsPlugin.initialize(initializationSettings,
//     onDidReceiveNotificationResponse: (details) {});


// void onDidReceiveLocalNotification(
//     int id, String? title, String? body, String? payload) async {
//   // display a dialog with the notification details, tap ok to go to another page
//   showDialog(
//     context: AppKeys.globalNavigatorKey.currentContext!,
//     builder: (BuildContext context) => CupertinoAlertDialog(
//       title: Text(title??''),
//       content: Text(body??''),
//       actions: [
//         CupertinoDialogAction(
//           isDefaultAction: true,
//           child: const Text('Ok'),
//           onPressed: () async {
//             Navigator.of(context, rootNavigator: true).pop();
//             await Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const DashboardScreen(),
//               ),
//             );
//           },
//         )
//       ],
//     ),
//   );
// }
//   }
  
//   @override
//   Future showPeriodicallyNotification({required CommonPeriodicNotificationModel commonPeriodicNotificationModel}) async {
// final List<PendingNotificationRequest> pendingNotificationRequests =
//     await flutterLocalNotificationsPlugin.pendingNotificationRequests();

//     final List<ActiveNotification> activeNotifications =
//     await flutterLocalNotificationsPlugin.getActiveNotifications();

//     if(Platform.isAndroid) {

//     }
//   }


  
//   @override
//   Future<void> cancelPeriodicallyNotification(int id) async {
//     await flutterLocalNotificationsPlugin.cancel(id);
//   }
  


//   // @override
//   // Future<void> showNotificationAtSpecificTime(DateTime scheduledTime) async {
//   //   tz.initializeTimeZones();

//   //   await flutterLocalNotificationsPlugin.zonedSchedule(
//   //     DateTime.now().millisecond,
//   //     'Scheduled Title',
//   //     'Scheduled Body',
//   //     tz.TZDateTime.from(scheduledTime, tz.local),
//   //     const NotificationDetails(
//   //       android: AndroidNotificationDetails(
//   //         'your channel id',
//   //         'your channel name',
//   //         channelDescription: 'your channel description',
//   //       ),
//   //     ),
//   //     androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//   //     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
//   //   );
//   // }

//     @override
//   Future<void> showNotificationAtSpecificTime(DateTime scheduledTime,CommonNotificationModel commonNotificationModel) async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       DateTime.now().millisecondsSinceEpoch.remainder(100000), // Unique notification ID
//       commonNotificationModel.title,
//       commonNotificationModel.descrption,
//       tz.TZDateTime.from(scheduledTime, tz.local),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'high_importance_channel',
//           'your channel name',
//           channelDescription: 'your channel description',
//           icon: '@mipmap/ic_launcher'
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }

  

  
// }

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/common/services/notifications/common_notification_channel.dart';
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/screens/dashboard_screen.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../../config/constants/app_keys.dart';

class CommonNotificationModel {
  final String title;
  final String description; // Fixed typo from 'descrption' to 'description'
  CommonNotificationModel({
    required this.title,
    required this.description,
  });
}

class CommonPeriodicNotificationModel {
  final String title;
  final String description; // Fixed typo from 'descrption' to 'description'
  final RepeatInterval repeatInterval;
  CommonPeriodicNotificationModel({
    required this.title,
    required this.description,
    required this.repeatInterval,
  });
}

@injectable
class CommonNotifications {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  CommonNotifications({required this.flutterLocalNotificationsPlugin});

  static const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
    icon: '@mipmap/ic_launcher',
  );

  final DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
    attachments: [],
    interruptionLevel: InterruptionLevel.active,
    presentAlert: true,
    presentBanner: true,
    presentSound: true,
    presentList: true,
    categoryIdentifier: 'category',
    threadIdentifier: 'thread',
  );

  @override
  Future<void> requestNotificationPermission() async {
    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(CommonNotificationChannel.channel);
    }
  }

  Future<void> showNotification({required CommonNotificationModel commonNotificationModel}) async {
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      commonNotificationModel.title,
      commonNotificationModel.description,
      platformChannelSpecifics,
   
         
    );
  }

  Future<void> initNotifications() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher',);
    final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) {});

    void onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
      showDialog(
        context: AppKeys.globalNavigatorKey.currentContext!,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title ?? ''),
          content: Text(body ?? ''),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Ok'),
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                );
              },
            )
          ],
        ),
      );
    }
  }

  Future<void> showNotificationAtSpecificTime(DateTime scheduledTime, CommonNotificationModel commonNotificationModel) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      DateTime.now().millisecondsSinceEpoch.remainder(100000), // Unique notification ID
      commonNotificationModel.title,
      commonNotificationModel.description,
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'your channel name',
          channelDescription: 'your channel description',
          icon: '@mipmap/ic_launcher',
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> showPeriodicallyNotification({required CommonPeriodicNotificationModel commonPeriodicNotificationModel}) async {
    // Implementation for periodic notifications
  }

  Future<void> cancelPeriodicallyNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
