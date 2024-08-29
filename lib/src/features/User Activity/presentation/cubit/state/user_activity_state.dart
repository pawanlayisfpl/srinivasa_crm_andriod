
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/data/model/get/user_activity_model.dart';

part 'user_activity_state.freezed.dart';

@freezed
class UserActivityState with _$UserActivityState {

  factory UserActivityState({
    @Default(false) bool isLoading,
    @Default(null) ApiFailedModel? apiFailedModel,
    @Default(null) UserActivityModel? userActivityModel,

  }
  ) = _UserActivityState;

  factory UserActivityState.initial() => UserActivityState(
    isLoading: false,
    apiFailedModel: null,
    userActivityModel: null,
  );

}