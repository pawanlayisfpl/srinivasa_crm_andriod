import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/customer_kyu_model.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/screens/kyc_upload_screen.dart';

import '../../common/services/notifications/common_notifications.dart';
import '../../config/locator/locator.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

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
      await locator.get<CommonNotifications>().showNotificationAtSpecificTime(scheduledTime);
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
          
              CommonNotificationModel commonNotificationModel = CommonNotificationModel(title: 'Ajay', descrption: "test description");
              await locator.get<CommonNotifications>().showNotification(commonNotificationModel: commonNotificationModel);
          
          
            }, child: const Text('Test Screen')),
            
          ),
          30.verticalSpace,
          Center(
            child: ElevatedButton(onPressed: () async {

              CommonPeriodicNotificationModel commonPeriodicNotificationModel = CommonPeriodicNotificationModel(title: 'Ajay', descrption: "test description", repeatInterval: RepeatInterval.everyMinute);
              await locator.get<CommonNotifications>().showPeriodicallyNotification(commonPeriodicNotificationModel: commonPeriodicNotificationModel);

            }, child: const Text('Perodic Notificaiton')),
          ),
           30.verticalSpace,
           Center(
            child: ElevatedButton(
              onPressed: _pickTimeAndScheduleNotification,
              child: const Text('Pick Time and Schedule Notification'),
            ),
          ),
        ],
      ),
    );
  }
}



  // bool isEmulator = false;
  // String deviceModel = "";
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
