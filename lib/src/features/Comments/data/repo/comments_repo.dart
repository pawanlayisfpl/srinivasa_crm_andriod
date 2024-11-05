import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/network/dio_client.dart';
import 'package:srinivasa_crm_new/src/core/storage/key_value_storage.dart';
import 'package:srinivasa_crm_new/src/features/Comments/domain/model/get/comments_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Comments/domain/model/post/comment_post_model.dart';

import '../../../../core/core.dart';
import '../../../../core/model/model.dart';

abstract class CommentsRepo {
  Future<Either<NetworkExceptions,CommentsResponseModel>> createComments({required CommentPostModel commentPostModel});
  Future<Either<NetworkExceptions,CommentsResponseModel>> updateComments({required CommentPostModel commentPostModel});
}



@Injectable(as: CommentsRepo)
class CommentsRepoImpl implements CommentsRepo {
  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final InternetChecker internetChecker;

  CommentsRepoImpl({required this.dioClient, required this.keyValueStorage, required this.internetChecker});
  
  @override
  Future<Either<NetworkExceptions, CommentsResponseModel>> createComments({required CommentPostModel commentPostModel}) async {
    
    final status = await internetChecker.hasInternet();
    if (!status) {
      return const Left(NetworkExceptions.noInternetConnection());
    }

    try {
      final response = await dioClient.post("http://95.216.201.117:8081/crm_sfpl/user/tickets/${commentPostModel.id}/comments", data: commentPostModel.toJson());
      if(response.statusCode == 200) {

        CommentsResponseModel commentsResponseModel = CommentsResponseModel.fromJson(response.data);
        return right(commentsResponseModel);

      }else {
        return left(NetworkExceptions.getDioException(response.data));
      }
      
    } on DioException catch (e) {
      return left(NetworkExceptions.getDioException(e));
      
    }

  }
  
  @override
  Future<Either<NetworkExceptions, CommentsResponseModel>> updateComments({required CommentPostModel commentPostModel}) async {
   final status = await internetChecker.hasInternet();
    if (!status) {
      return const Left(NetworkExceptions.noInternetConnection());
    }

    try {
      final response = await dioClient.put("http://95.216.201.117:8081/crm_sfpl/user/comment/${commentPostModel.id}", data: commentPostModel.toJson(),headers: {});
      if(response.statusCode == 200) {

        CommentsResponseModel commentsResponseModel = CommentsResponseModel.fromJson(response.data);
        return right(commentsResponseModel);

      }else {
        return left(NetworkExceptions.getDioException(response.data));
      }
      
    } on DioException catch (e) {
      return left(NetworkExceptions.getDioException(e));
      
    }
  }
}