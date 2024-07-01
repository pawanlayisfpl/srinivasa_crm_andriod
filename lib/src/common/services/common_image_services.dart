import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Image/image_model.dart';

abstract class CommonImageServices {
Future<Either<Exception, PlatformFile?>> pickSingleImage();
Future<Either<Exception,List<PlatformFile>>?> pickMultipleImages();
Future<Either<Exception,List<ImageModel>>> pickMultipleUint8ListImage();
Future<Either<Exception,List<FileModel>>> pickeMultipleUint8Files();
Future<Either<Exception,PlatformFile>> pickSingleFile({required FileType fileType});
Future<Either<Exception,List<PlatformFile>>?> pickMultipleFiles({required FileType fileType , List<String>? allowedExtensions});


}

@Injectable(as: CommonImageServices)
class CommomImageServicesImpl implements CommonImageServices {
  @override
  Future<Either<Exception, PlatformFile>> pickSingleImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowCompression: true,
        allowMultiple: false,
      );
      return result != null ? Right(result.files.first) : Left(Exception('No file selected'));
      } catch (e) {
      return Left(Exception(e));
    }
  }
  
  @override
  Future<Either<Exception, List<PlatformFile>>?> pickMultipleImages() async {
    try {
      final result = FilePicker.platform.pickFiles(
        type: FileType.image,
        allowCompression: true,
        allowMultiple: true,
      );
      return result.then((value) => value != null ? Right(value.files) : Left(Exception('No file selected')));  
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<Either<Exception, PlatformFile>> pickSingleFile({required FileType fileType}) {
   try {
      final result = FilePicker.platform.pickFiles(
        type: fileType,
        allowCompression: true,
        allowMultiple: false,
      );
      return result.then((value) => value != null ? Right(value.files.first) : Left(Exception('No file selected')));
  
     
   } catch (e) {
    rethrow;
     
   }
  }
  
  @override
  Future<Either<Exception, List<PlatformFile>>?> pickMultipleFiles({required FileType fileType, List<String>? allowedExtensions}) {
    try {
      final result = FilePicker.platform.pickFiles(
        type: FileType.any,
        allowCompression: true,
        allowMultiple: true,
        dialogTitle: 'Select files',
      
      );
      return result.then((value) => value != null ? Right(value.files) : Left(Exception('No file selected')));
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<Either<Exception, List<ImageModel>>> pickMultipleUint8ListImage() async {
   try {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowCompression: true,
      allowMultiple: true,
    );

    if (result == null) {
      return Left(Exception('No file selected'));
    }

    List<ImageModel> files = [];
    for (var file in result.files) {
      Uint8List? fileData = file.bytes;
      if (fileData == null && file.path != null) {
        // On iOS, file.bytes is null, so read the file into memory using the path
        try {
          fileData = await File(file.path!).readAsBytes();
        } catch (e) {
          // Handle the exception of reading the file, maybe continue to the next file
          continue;
        }
      }
      if (fileData != null) {
        ImageModel imageModel = ImageModel(name: file.name.toString(), imageByes: fileData);
        files.add(imageModel);
      }
    }

    return Right(files);
  } catch (e) {
    return Left(Exception(e.toString()));
  }
    
  }
  
  @override
  Future<Either<Exception, List<FileModel>>> pickeMultipleUint8Files()  async {
   try {
   final result = await FilePicker.platform.pickFiles(
  type: FileType.custom,
  allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx'],
  allowCompression: true,
  allowMultiple: true,

);

    if (result == null) {
      return Left(Exception('No file selected'));
    }

    List<FileModel> files = [];
    for (var file in result.files) {
      Uint8List? fileData = file.bytes;
      if (fileData == null && file.path != null) {
        // On iOS, file.bytes is null, so read the file into memory using the path
        try {
          fileData = await File(file.path!).readAsBytes();
        } catch (e) {
          // Handle the exception of reading the file, maybe continue to the next file
          continue;
        }
      }
      if (fileData != null) {
        FileModel fileModel = FileModel(name: file.name, fileBytes: fileData);
        files.add(fileModel);
      }
    }

    return Right(files);
  } catch (e) {
    return Left(Exception(e.toString()));
  }
  }
  
  
  
  
}