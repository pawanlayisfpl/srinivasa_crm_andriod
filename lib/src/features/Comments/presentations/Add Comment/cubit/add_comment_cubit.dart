// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/common/fields/string_field.dart';

import 'package:srinivasa_crm_new/src/features/Comments/data/repo/comments_repo.dart';
import 'package:srinivasa_crm_new/src/features/Comments/domain/model/post/comment_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Comments/presentations/Add%20Comment/screen/add_comment_state.dart';

import '../../../../../core/model/model.dart';

@injectable
class AddCommentCubit extends Cubit<AddCommentState> {
  final CommentsRepo  commentsRepo;
  AddCommentCubit(
    this.commentsRepo,
  ) : super(AddCommentState.initial());

  final TextEditingController commentController = TextEditingController();



  Future<void> addComment(CommentPostModel commentPostModel) async {
    emit(state.copyWith(isSubmitting: true, apiFailedModel: null, commentsResponseModel: null));
    final results = await commentsRepo.createComments(commentPostModel: commentPostModel);
    results.fold(
      (l) => emit(state.copyWith(isSubmitting: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
      (r) => emit(state.copyWith(isSubmitting: false, commentsResponseModel: r)),
    );
  }

  Future<void> updateComments(CommentPostModel commentPostModel) async {
    emit(state.copyWith(isSubmitting: true, apiFailedModel: null, commentsResponseModel: null));
    final results = await commentsRepo.updateComments(commentPostModel: commentPostModel);
    results.fold(
      (l) => emit(state.copyWith(isSubmitting: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
      (r) => emit(state.copyWith(isSubmitting: false, commentsResponseModel: r)),
    );
  }


  void onChangeCommentField(String? value) {
    emit(state.copyWith(commentField: StringField(value ?? "")));
  }


  void resetState() {
    emit(AddCommentState.initial());
    commentController.clear();
  }


  @override
  Future<void> close() {
    commentController.dispose();
    return super.close();
  }
}
