import 'dart:io';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
@lazySingleton

// To save the file in the device
class CommonFileStorageServcies {
  static Future<String> getExternalDocumentPath() async {
    // To check whether permission is given for this app or not.
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // If not we will ask for permission first
      await Permission.storage.request();
    }
    Directory directory = Directory("");
    if (Platform.isAndroid) {
      // Redirects it to download folder in android
      directory = Directory("/storage/emulated/0/Download");
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    final exPath = directory.path;
    print("Saved Path: $exPath");
    await Directory(exPath).create(recursive: true);
    return exPath;
  }

  static Future<String> get _localPath async {
    // final directory = await getApplicationDocumentsDirectory();
    // return directory.path;
    // To get the external path from device of download folder
    final String directory = await getExternalDocumentPath();
    return directory;
  }

  static Future<File> writeCounter(String bytes, String name) async {
    final path = await _localPath;
    // Create a file for the path of
    // device and file name with extension
    File file = File('$path/$name');

    print("Save file");

    // Write the data in the file you have created
    return file.writeAsString(bytes);
  }

  //! write int to file
  static Future<File> writeInt(
      List<int> bytes, String name, String extension) async {
    final path = await _localPath;
    // Create a file for the path of
    // device and file name with extension
    File file = File('$path/$name.$extension');

    debugPrint("Save file");

    // Write the data in the file you have created
    return file.writeAsBytes(bytes, mode: FileMode.writeOnly);
  }
}
