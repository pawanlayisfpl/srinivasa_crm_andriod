import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/features/Profile/domain/model/profile_model.dart';


part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.loadedLocal({required ProfileModel profileResponseModel}) = Loaded;
  const factory ProfileState.error({required String message}) = Error;
  const factory ProfileState.logout() = Logout;
}