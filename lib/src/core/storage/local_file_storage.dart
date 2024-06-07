// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart' as syspaths;

// mixin LocalFileStorageMixin {
//   Future<File?> getExistingFile(String folderName, String fileName) async {
//     try {
//       final appDir = await syspaths.getApplicationDocumentsDirectory();
//       final directory = Directory(path.join(appDir.path, folderName));

//       await directory.create();

//       final newPath = path.join(directory.path, "$fileName${"_"}$folderName.jpg");

//       final file = File(newPath);
//       final isExists = file.existsSync();

//       return isExists  ? file : null;
//     } on Exception catch (e, st) {
//       $logger.error('not able to fetch existing file', e, st);

//       return null;
//     }
//   }

//   Future<File?> saveFile(String folderName, String fileName, String data) async {
//     if (data.doesNotHaveValue) {
//       return null;
//     }

//     final appDir = await syspaths.getApplicationDocumentsDirectory();
//     final directory = Directory(path.join(appDir.path, folderName));
//     await directory.create();

//     final newPath = path.join(directory.path, "$fileName${"_"}$folderName.jpg");

//     final file = File(newPath);

//     if (!file.existsSync()) {
//       file.createSync();
//     }

//     if (file.existsSync()) {
//       final Uint8List bytes = base64.decode(data);
//       await file.writeAsBytes(bytes);

//       if (await file.length() > 0) {
//         return file;
//       }

//       return null;
//     }

//     return null;
//   }
// }
