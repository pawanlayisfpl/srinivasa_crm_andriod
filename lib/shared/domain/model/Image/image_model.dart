// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/services.dart';

class ImageModel {
  final String name;
  final Uint8List imageByes;

  ImageModel({required this.name, required this.imageByes});
}


class FileModel {
  final String name;
  final Uint8List fileBytes;
  FileModel({
    required this.name,
    required this.fileBytes,
  });
}
