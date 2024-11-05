
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Comments/domain/model/get/comments_response_model.dart';

import '../../../../../common/fields/string_field.dart';
// import 'package:srinivasa_crm_new/src/features/Comments/domain/model/post/comment_post_model.dart';


part '../cubit/add_comment_state.freezed.dart';

@freezed
class AddCommentState with _$AddCommentState {
  const factory AddCommentState({
    @Default(false) bool isSubmitting,
    @Default(null) CommentsResponseModel? commentsResponseModel,
    @Default(null) ApiFailedModel? apiFailedModel,
    required StringField commentField
  }) = _$_AddCommentState;

  factory AddCommentState.initial() =>  AddCommentState(
    commentsResponseModel: null,
    isSubmitting: false,
    commentField: StringField(""),
    apiFailedModel: null,);
}