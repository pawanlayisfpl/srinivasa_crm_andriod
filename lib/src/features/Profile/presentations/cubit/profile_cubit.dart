// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_state.dart';

import '../../domain/repo/profile_repo.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit({
    required this.profileRepo,
  }) : super(const  ProfileState.initial());


  Future<void> getLocalProfile() async {
    emit(const ProfileState.loading());
    final result = await profileRepo.getLocalUserProfile();
    result.fold((l) {
      emit(ProfileState.error(message: l));
    }, (r) {
      if (r != null) {
        emit(ProfileState.loadedLocal(profileResponseModel: r));
        log('PRINTING LOCAL PROFILE MODLEL');
        log(r.toJson().toString());
      } else {
        emit(const ProfileState.error(message: 'No data found'));
      }
    });
  }

}
