import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class CommonPushNotificationsServices {
  // REQUEST PERMSSSIONS METHOD

  //  GENERATE TOKEN
  // SEND TOKEN TO BACKEND(UPDATE IN PROFILE)
  // SEND NOTIFICATION METHOD
  // RECEIVE NOTIFICATION METHOD IN FOREGROUND ( WHEN THE APP IS OPEN)
  // RECEIVE NOTIFICATION METHOD IN BACKGROUND (WHEN THE APP IS IN BACKGROUND BUT NOT CLOSE)
  // RECEIVE NOTIFICATION METHOD IN TERMINATED (WHEN THE APP IS CLOSED AND REMOVED FROM RECENT APPS)

    Future<void> requestNotification();





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
    case AuthorizationStatus.notDetermined:
    log('push notification permission is not determined');
    case AuthorizationStatus.provisional:
    log('push notification is provisional state ');
    default:
  }


  }


}