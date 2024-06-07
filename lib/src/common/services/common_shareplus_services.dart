import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

@lazySingleton
class CommonSharePlusServices {
  Future<void> shareText(
      {required String text, required String subject}) async {
    switch (Platform.operatingSystem) {
      case 'android':
        await Share.share(text, subject: subject);
        break;
      case 'ios':
        await Share.share(text, subject: subject);
        break;
      default:
        await Share.share(text, subject: subject);
        break;
    }

    Future<void> shareFileSingle(
        {required XFile filePath,
        required String text,
        required String subject}) async {
      switch (Platform.operatingSystem) {
        case 'android':
          await Share.shareXFiles([filePath], text: text, subject: subject);
          break;
        case 'ios':
          await Share.shareXFiles([filePath], text: text, subject: subject);
          break;
        default:
          await Share.shareXFiles([filePath], text: text, subject: subject);
          break;
      }
    }
  }

  Future<void> shareFilesMultipls(
      {required List<XFile> filePaths,
      required String text,
      required String subject}) async {
    switch (Platform.operatingSystem) {
      case 'android':
        await Share.shareXFiles(filePaths, text: text, subject: subject);
        break;
      case 'ios':
        await Share.shareXFiles(filePaths, text: text, subject: subject);
        break;
      default:
        await Share.shareXFiles(filePaths, text: text, subject: subject);
        break;
    }
  }
}
