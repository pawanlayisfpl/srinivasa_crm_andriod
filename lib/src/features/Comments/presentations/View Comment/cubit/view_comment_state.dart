import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/features/Comments/domain/model/get/comments_model.dart';

import '../../../../../core/model/model.dart';


part 'view_comment_state.freezed.dart';

@freezed

class ViewCommentState with _$ViewCommentState {
  const factory ViewCommentState({
    @Default(false) bool isLoading,
    @Default(null) ApiFailedModel? apiFailedModel,
    @Default([]) List<CommentsModel> commentsList,
    
  }) = _ViewCommentState;


    factory ViewCommentState.initial() => const ViewCommentState(
    isLoading: false,
    apiFailedModel: null,
    commentsList: [],
  );

}