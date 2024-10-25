import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/services/notifications/common_push_notifications_services.dart';

import '../../common/services/notifications/common_notifications.dart';
import '../../config/locator/locator.dart';


import 'package:timezone/data/latest_all.dart' as tz;

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
       final pushNotifcationsServices = locator.get<CommonPushNotificationsServices>();
    await pushNotifcationsServices.initializePushNotifications();
    });
  }

    Future<void> _pickTimeAndScheduleNotification() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      
      final now = DateTime.now();
      final scheduledTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      log(scheduledTime.toString());
      tz.initializeTimeZones();
      CommonNotificationModel commonNotificationModel = CommonNotificationModel(title: 'Schedule Notification', description: "Schedule notification testing");
      await locator.get<CommonNotifications>().showNotificationAtSpecificTime(scheduledTime,commonNotificationModel);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(onPressed: () async {
          
              CommonNotificationModel commonNotificationModel = CommonNotificationModel(title: 'Ajay', description: "test description");
              await locator.get<CommonNotifications>().showNotification(commonNotificationModel: commonNotificationModel);
          
          
            }, child: const Text('Test Screen')),
            
          ),
          30.verticalSpace,
          Center(
            child: ElevatedButton(onPressed: () async {

              CommonPeriodicNotificationModel commonPeriodicNotificationModel = CommonPeriodicNotificationModel(title: 'Ajay', description: "test description", repeatInterval: RepeatInterval.everyMinute);
              await locator.get<CommonNotifications>().showPeriodicallyNotification(commonPeriodicNotificationModel: commonPeriodicNotificationModel);

            }, child: const Text('Perodic Notificaiton')),
          ),
              30.verticalSpace,
           Center(
            child: ElevatedButton(
              onPressed: () async => await _generateToken(),
              child: const Text('Generate TOken'),
            ),
          ),
           30.verticalSpace,
           Center(
            child: ElevatedButton(
              onPressed: _pickTimeAndScheduleNotification,
              child: const Text('Pick Time and Schedule Notification'),
            ),
          ),
          30.verticalSpace,
          CommonButton(callback: () => _checkPushNotificationPermissions(), title: "Check Permissions"),
          30.verticalSpace,
          
        ],
      ),
    );
  }
  
  _checkPushNotificationPermissions() async {
    // final pushNotification = locator.get<CommonPushNotificationsServices>();
    // await pushNotification.generateToken();
  final notifications = CommonNotifications(flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin());
     DateTime dateTime = DateTime.now().copyWith(hour: 17, minute: 46, second: 0, millisecond: 0);

         CommonNotificationModel punchInNotificationModel = CommonNotificationModel(title: 'Reminder: Daily Punch-in', description: '''Please punch out if you're done for the day. If already done, you can ignore this message.''');

  tz.initializeTimeZones();
  await notifications.showNotificationAtSpecificTime(dateTime,punchInNotificationModel);
  }
  
  _generateToken() async {
    final pushNotification = locator.get<CommonPushNotificationsServices>();
    await pushNotification.generateToken();
    await FirebaseMessaging.instance.subscribeToTopic('news');
  await FirebaseMessaging.instance.subscribeToTopic('general');
  Fluttertoast.showToast(msg: 'Subscribed to topics successfully');
  print('Subscribed to topics: news, general');

  }
}



  // bool isEmulator = false;
  // String deviceModel = "";main.dart
  // String deviceName = "";
  // String deviceId = "";
  // String deviceVersion = "";
  // bool isLowRamDevice = false;
  // bool isAndroid = false;



  // DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  // if(Platform.isAndroid) {
  //   isAndroid = true;
  //   AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
  //   isEmulator = !androidInfo.isPhysicalDevice;
  //   deviceModel = androidInfo.model;
  //   deviceName = androidInfo.brand;
  //   deviceId = androidInfo.id;
  //   deviceVersion = androidInfo.version.release;
  //   isLowRamDevice = androidInfo.isLowRamDevice;


  // }

  // if(Platform.isIOS) {
  //   IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;

  // isAndroid = false;
  // isEmulator = !iosDeviceInfo.isPhysicalDevice;
  // deviceModel = iosDeviceInfo.model;
  // deviceName = iosDeviceInfo.name;
  // deviceId = iosDeviceInfo.identifierForVendor.toString();
  // deviceVersion = iosDeviceInfo.systemVersion;
  // }

  // log("isAndroid\n$isAndroid");
  // log("isEmulator\n$isEmulator");
  // log("deviceModel\n$deviceModel");
  // log("deviceName\n$deviceName");
  // log("deviceId\n$deviceId");
  // log("deviceVersion\n$deviceVersion");
  // log("isLowRamDevice\n$isLowRamDevice");
