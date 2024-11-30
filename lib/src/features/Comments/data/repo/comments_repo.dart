import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/features/Comments/domain/model/get/comments_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Comments/domain/model/post/comment_post_model.dart';

import '../../../../core/core.dart';
import '../../../../core/model/model.dart';
import '../../domain/model/get/comments_model.dart';

abstract class CommentsRepo {
  Future<Either<NetworkExceptions,CommentsResponseModel>> createComments({required CommentPostModel commentPostModel});
  Future<Either<NetworkExceptions,CommentsResponseModel>> updateComments({required CommentPostModel commentPostModel});
  Future<Either<NetworkExceptions,List<CommentsModel>>> getAllCommentsByTicketId({required String id});
  Future<Either<NetworkExceptions,CommentsResponseModel>> deleteComments({required String id});
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
      final response = await dioClient.post("${Endpoints.createComment}${commentPostModel.id}/comments", data: commentPostModel.toJson(),headers: {});
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
      final response = await dioClient.put(Endpoints.updateComment+commentPostModel.id, data: commentPostModel.toJson(),headers: {});
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
  Future<Either<NetworkExceptions, CommentsResponseModel>> deleteComments({required String id}) async {
    final status = await internetChecker.hasInternet();

    if(status) {
      final response = await dioClient.delete(Endpoints.deleteComment+id,headers: {});

      if(response.status == 200) {
        CommentsResponseModel commentsResponseModel = CommentsResponseModel.fromJson(response.data);
        return right(commentsResponseModel);

      }else {
        return left(NetworkExceptions.getDioException(response.data));
      }
     }else {
      // ignore: prefer_const_constructors
      return left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, List<CommentsModel>>> getAllCommentsByTicketId({required String id}) async {
    final status = await internetChecker.hasInternet();

    if(status) {
      try {
          final response = await dioClient.get("${Endpoints.getAllCommentsByTicketId}$id/comments",headers: {});

      if(response.statusCode == 200) {
        List<CommentsModel> commentsModel = (response.data["data"] as List).map((e) => CommentsModel.fromJson(e)).toList();
        return right(commentsModel);

      }else {
        return left(NetworkExceptions.getDioException(response.data));
      }
      }on DioException catch (e) {
        return left(NetworkExceptions.getDioException(e));
        
      }
     }else {
      return left(const NetworkExceptions.noInternetConnection());
    }
   
  }
}