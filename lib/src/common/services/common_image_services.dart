import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Image/image_model.dart';

abstract class CommonImageServices {
Future<Either<Exception, PlatformFile?>> pickSingleImage();
Future<Either<Exception, ImageModel?>> pickSingleImageBytes();
Future<Either<Exception,List<PlatformFile>>?> pickMultipleImages();
Future<Either<Exception,List<ImageModel>>> pickMultipleUint8ListImage();
Future<Either<Exception,List<ImageModel>>> pickMultipleUint8ListImageUsingImagePicker({required bool isFromCamera});
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
  

  // PICKING IMAGES FROM CAMERS
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
  allowedExtensions: [ 'pdf', 'doc', 'docx', 'xls', 'xlsx', 
    'mp4', 'avi', 'mov', 'wmv', 'flv', 
    'mkv', 'webm', 'mpeg', '3gp', 'm4v'],
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
  
  @override
  Future<Either<Exception, ImageModel?>> pickSingleImageBytes() async {
    
 try {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowCompression: true,
      allowMultiple: true,
    );

    if (result == null) {
      return Left(Exception('No file selected'));
    }
      Uint8List? fileData = result.files.first.bytes;
       try {
          fileData = await File(result.files.first.path!).readAsBytes();
           ImageModel imageModel = ImageModel(name: result.files.first.name.toString(), imageByes: fileData);



    

   

    return Right(imageModel);
        } catch (e) {
           return Left(Exception(e.toString()));
        }
       
  } catch (e) {
    return Left(Exception(e.toString()));
  }
   
  }


  
// @override
// Future<Either<Exception, List<ImageModel>>> pickMultipleUint8ListImageUsingImagePicker({required bool isFromCamera}) async {
//   try {
//     final ImagePicker picker = ImagePicker();
//     List<XFile>? images;

//     if (isFromCamera) {
//       final XFile? image = await picker.pickImage(source: ImageSource.camera);
//       if (image != null) {
//         images = [image];
//       }
//     } else {
//       images = await picker.pickMultiImage();
//     }

//     if (images == null || images.isEmpty) {
//       return Left(Exception('No file selected'));
//     }

//     List<ImageModel> files = [];
//     for (var image in images) {
//       Uint8List fileData = await image.readAsBytes();

//       ImageModel imageModel = ImageModel(imageByes: fileData, name: image.name.toString());
//       // / double sizeInMB = imageBytes.lengthInBytes / (1024 * 1024);
//       files.add(imageModel);
//     }

//     return Right(files);
//   } catch (e) {
//     return Left(Exception(e.toString()));
//   }
// }
   


@override
Future<Either<Exception, List<ImageModel>>> pickMultipleUint8ListImageUsingImagePicker({required bool isFromCamera}) async {
  try {
    final ImagePicker picker = ImagePicker();
    List<XFile>? images;

    if (isFromCamera) {
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        // Read the bytes of the original image
        Uint8List imageBytes = await image.readAsBytes();
        
        // Print original image size and extension
       // Convert bytes to KB and MB
double sizeInKB = imageBytes.lengthInBytes / 1024;
double sizeInMB = imageBytes.lengthInBytes / (1024 * 1024);

log('Original image size: ${imageBytes.lengthInBytes} bytes');
log('Image size in KB: ${sizeInKB.toStringAsFixed(2)} KB');
log('Image size in MB: ${sizeInMB.toStringAsFixed(2)} MB');
        log('Original image extension: ${image.name.split('.').last}');

        // Compress the image
        List<int>? compressedImageBytes = await FlutterImageCompress.compressWithList(imageBytes,quality: 60);

        if (compressedImageBytes.isNotEmpty) {
          Uint8List compressedImageData = Uint8List.fromList(compressedImageBytes);
          
          // Print compressed image size
          // Convert bytes to KB and MB for compressed image
double compressedSizeInKB = compressedImageData.lengthInBytes / 1024;
double compressedSizeInMB = compressedImageData.lengthInBytes / (1024 * 1024);

log('Compressed image size: ${compressedImageData.lengthInBytes} bytes');
log('Compressed image size in KB: ${compressedSizeInKB.toStringAsFixed(2)} KB');
log('Compressed image size in MB: ${compressedSizeInMB.toStringAsFixed(2)} MB');
          
          images = [XFile.fromData(compressedImageData, name: image.name)];
        } else {
          return Left(Exception('Image compression failed'));
        }
      }
    } else {
      images = await picker.pickMultiImage();
      List<XFile> compressedImages = [];
      for (var image in images) {
        // Read the bytes of the original image
        Uint8List imageBytes = await image.readAsBytes();
        
        // Print original image size and extension
        print('Original image size: ${imageBytes.lengthInBytes} bytes');
        print('Original image extension: ${image.name.split('.').last}');

        // Compress the image
        List<int>? compressedImageBytes = await FlutterImageCompress.compressWithList(imageBytes);

        if (compressedImageBytes.isNotEmpty) {
          Uint8List compressedImageData = Uint8List.fromList(compressedImageBytes);
          
          // Print compressed image size
          print('Compressed image size: ${compressedImageData.lengthInBytes} bytes');
          
          compressedImages.add(XFile.fromData(compressedImageData, name: image.name));
        } else {
          return Left(Exception('Image compression failed'));
        }
      }
      images = compressedImages;
        }

    if (images == null || images.isEmpty) {
      return Left(Exception('No file selected'));
    }

    List<ImageModel> files = [];
    for (var image in images) {
      // Read the bytes of the compressed image
      Uint8List fileData = await image.readAsBytes();
      
      ImageModel imageModel = ImageModel(imageByes: fileData, name: image.name.toString());
      files.add(imageModel);
    }

    return Right(files);
  } catch (e) {
    return Left(Exception(e.toString()));
  }
}
  }
  
  
  
  
