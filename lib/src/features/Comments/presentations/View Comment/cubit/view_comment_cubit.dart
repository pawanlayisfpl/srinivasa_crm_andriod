import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/features/Comments/data/repo/comments_repo.dart';
import 'package:srinivasa_crm_new/src/features/Comments/presentations/View%20Comment/cubit/view_comment_state.dart';

import '../../../../../core/model/model.dart';

@injectable
class ViewCommentsCubit extends Cubit<ViewCommentState> {
  final CommentsRepo commentsRepo;
  ViewCommentsCubit(this.commentsRepo) : super(ViewCommentState.initial());

  
  Future<void> getAllCommentsByTicketId(String id) async {

    emit(state.copyWith(isLoading:  true));
    await Future.delayed(const Duration(seconds: 2));
    final results = await commentsRepo.getAllCommentsByTicketId(id: id);
    results.fold(
      (l) => emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
      (r) => emit(state.copyWith(isLoading: false, commentsList: r)),
    );
  }

  void resetState() {
    emit(ViewCommentState.initial());
  }
}