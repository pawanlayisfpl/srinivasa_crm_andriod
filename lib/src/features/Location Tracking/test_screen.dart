import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/customer_kyu_model.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/screens/kyc_upload_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
      body:  Center(
        child: ElevatedButton(onPressed: () async {


  bool isEmulator = false;
  String deviceModel = "";
  String deviceName = "";
  String deviceId = "";
  String deviceVersion = "";
  bool isLowRamDevice = false;
  bool isAndroid = false;



  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  if(Platform.isAndroid) {
    isAndroid = true;
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    isEmulator = !androidInfo.isPhysicalDevice;
    deviceModel = androidInfo.model;
    deviceName = androidInfo.brand;
    deviceId = androidInfo.id;
    deviceVersion = androidInfo.version.release;
    isLowRamDevice = androidInfo.isLowRamDevice;


  }

  if(Platform.isIOS) {
    IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;

  isAndroid = false;
  isEmulator = !iosDeviceInfo.isPhysicalDevice;
  deviceModel = iosDeviceInfo.model;
  deviceName = iosDeviceInfo.name;
  deviceId = iosDeviceInfo.identifierForVendor.toString();
  deviceVersion = iosDeviceInfo.systemVersion;
  }

  log("isAndroid\n$isAndroid");
  log("isEmulator\n$isEmulator");
  log("deviceModel\n$deviceModel");
  log("deviceName\n$deviceName");
  log("deviceId\n$deviceId");
  log("deviceVersion\n$deviceVersion");
  log("isLowRamDevice\n$isLowRamDevice");


        }, child: const Text('Test Screen')),
      ),
    );
  }
}