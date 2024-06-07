import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

abstract class CommonImageServices {
Future<Either<Exception, PlatformFile?>> pickSingleImage();
Future<Either<Exception,List<PlatformFile>>?> pickMultipleImages();
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
  
  
  
  
}