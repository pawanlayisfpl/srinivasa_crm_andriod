import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/common/services/notifications/common_notifications.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/screens/dashboard_screen.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/screens/mark_attendance_screen.dart';

abstract class CommonPushNotificationsServices {
  // REQUEST PERMSSSIONS METHOD

  //  GENERATE TOKEN
  // SEND TOKEN TO BACKEND(UPDATE IN PROFILE)
  // SEND NOTIFICATION METHOD
  // RECEIVE NOTIFICATION METHOD IN FOREGROUND ( WHEN THE APP IS OPEN)
  // RECEIVE NOTIFICATION METHOD IN BACKGROUND (WHEN THE APP IS IN BACKGROUND BUT NOT CLOSE)
  // RECEIVE NOTIFICATION METHOD IN TERMINATED (WHEN THE APP IS CLOSED AND REMOVED FROM RECENT APPS)

    Future<void> requestNotification();
    Future<String?> generateToken();
    Future<void> saveTokenToDatabase();
    Future<void> initializePushNotifications();






}



@Injectable(as: CommonPushNotificationsServices)
class CommonPushNotificationsServicesImpl implements CommonPushNotificationsServices {

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  
  @override
  Future<void> requestNotification() async {
   NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

debugPrint('User granted permission: ${settings.authorizationStatus}');
// 4 TYPES OF AUTHORIZATION STATUS

// authorized: The user granted permission.
// denied: The user denied permission.
// notDetermined: The user has not yet chosen whether to grant permission.
// provisional: The user granted provisional permission


  switch(settings.authorizationStatus) {
    case AuthorizationStatus.authorized :
    log('push notification permission is granted');
    break;
    case AuthorizationStatus.denied:
    log('push notification permission is denied');
   
    await messaging.requestPermission();
    case AuthorizationStatus.notDetermined:
    log('push notification permission is not determined');
    case AuthorizationStatus.provisional:
    log('push notification is provisional state ');
    NotificationSettings settings = await messaging.requestPermission(
  provisional: true,
);
    default:
     await messaging.requestPermission();
  }


  }
  
  @override
  Future<String?> generateToken() async {
   await FirebaseMessaging.instance.subscribeToTopic('news').then((_) {
  debugPrint('Subscribed to your_topic_name');
}).catchError((error) {
  debugPrint('Failed to subscribe: $error');
});
  
       String? token = await FirebaseMessaging.instance.getToken();
       print(token.toString());
  return token;
  }
  
  @override
  Future<void> saveTokenToDatabase()  async{
    // TODO: implement saveTokenToDatabase
        FirebaseMessaging.instance.onTokenRefresh.listen(null);

    throw UnimplementedError();

  }
  
  @override
  Future<void> initializePushNotifications()  async {

    // HANDLING NOTIFICATIONS PAYLOAD


    Future<void> handleMessage(RemoteMessage? remoteMessage)  async{

      if(remoteMessage == null) return;
  print('notification data  received ${remoteMessage.data['screen'] }');


      switch(remoteMessage.data['screen']) {
        case  "dashboard" : 
               await AppKeys.globalNavigatorKey.currentState!.push(ScaleRoute(screen: const DashboardScreen()));
                break;
                case 'punchin' :
                              await  AppKeys.globalNavigatorKey.currentState!.push(ScaleRoute(screen: const MarkAttendanceScreen()));
                                break;



                default: 
                await  AppKeys.globalNavigatorKey.currentState!.push(ScaleRoute(screen: const DashboardScreen()));

      }

     

      


    }


    // FirebaseMessaging.instance.requestPermission();
        FirebaseMessaging.onMessage.listen((RemoteMessage message)  async {
      debugPrint('Got a message whilst in the foreground!');
      debugPrint('Message data: ${message.data}');

      if (message.notification != null) {
        debugPrint('Message also contained a notification: ${message.notification}');

     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

   int generateDateTimeId() {
  return DateTime.now().millisecondsSinceEpoch % 2147483647; // Ensures the ID fits within 32-bit signed integer range
}
await flutterLocalNotificationsPlugin.show(
  generateDateTimeId(), // Use the adjusted ID
  message.notification!.title.toString(),
message.notification!.title.toString(),
  const NotificationDetails(
    android: AndroidNotificationDetails(
       'high_importance_channel',
          'your channel name',
          channelDescription: 'your channel description',
          icon: '@mipmap/ic_launcher',

    ),
  ),
);

      }
    });


    Future<void> backgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');

  await handleMessage(message);


  
  
}
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onMessage.listen((message) async {




      final localNotification = locator.get<CommonNotifications>();
      CommonNotificationModel commonNotificationModel = CommonNotificationModel(title: message.notification!.title.toString(), description: message.notification!.body.toString());
      await localNotification.showNotification(commonNotificationModel: commonNotificationModel);
    });
 await generateToken();


    
  }

  


}