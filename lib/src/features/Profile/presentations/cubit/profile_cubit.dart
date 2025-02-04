// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/constants/key_value_strings.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_state.dart';
import 'package:srinivasa_crm_new/src/features/login/presentation/screens/login_screen.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart';

import '../../domain/repo/profile_repo.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  final CommonLocationServices commonLocationServices;
  final KeyValueStorage keyValueStorage;
  ProfileCubit({
    required this.profileRepo,
    required this.commonLocationServices,
    required this.keyValueStorage,
  }) : super(const ProfileState.initial());

  Future<void> getLocalProfile() async {
    emit(const ProfileState.loading());
    final result = await profileRepo.getLocalUserProfile();
    result.fold((l) {
      emit(ProfileState.error(message: l));
    }, (r) {
      if (r != null) {
        emit(ProfileState.loadedLocal(profileResponseModel: r));
        debugPrint('PRINTING LOCAL PROFILE MODLEL');
        debugPrint(r.toJson().toString());
      } else {
        emit(const ProfileState.error(message: 'No data found'));
      }
    });
  }
  


  Future<void> logout({required BuildContext context}) async {

    
    Navigator.pop(context);
    QuickAlert.show(
        context: context,
        type: QuickAlertType.loading,
        barrierDismissible: true,
        
        animType: QuickAlertAnimType.scale,
        text: 'Logging you out, please wait',
        disableBackBtn: true);
    if (Platform.isAndroid) {
      const platform = MethodChannel('com.srinivasa.crm');
      await platform.invokeMethod('stop');
    }else {

    }

    await context.read<MarkAttendanceCubit>().punchOutLogic(isLogoutClicked: true);
    // TODO: COMMENTED OUT FOR TESTING
    // await keyValueStorage.sharedPreferences.clear();
    await keyValueStorage.clearValue(KeyValueStrings.isLoggedIn);
     Navigator.pop(context);
     await   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c) => const LoginScreen()), (r) => false);

  //  if(context.mounted) {
  //   if(Navigator.canPop(context)) {
  //     Navigator.pop(context);
  //   }

  //  }

    
  }
}
