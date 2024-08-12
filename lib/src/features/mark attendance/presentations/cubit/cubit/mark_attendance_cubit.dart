// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/data/repo/work_manager_services.dart';
import 'package:srinivasa_crm_new/src/config/locator/locator.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../domain/domain.dart';
import 'mark_attendance_state.dart';

@injectable
class MarkAttendanceCubit extends Cubit<MarkAttendanceState> {
  final PunchInUseCase punchInUseCase;
  final PunchOutUsecase punchOutUseCase;
  final LastPunchInOutUseCase getLastPunchInOutDetailsUseCase;

  MarkAttendanceCubit(
    this.punchInUseCase,
    this.punchOutUseCase,
    this.getLastPunchInOutDetailsUseCase,
  ) : super( MarkAttendanceState.initial());

  // GET LAST PUNCH IN-OUT DATA
  Future<void> getLastPunchInOutData() async {
    emit(MarkAttendanceState.initial());
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(seconds: 1));
   try {
  final results = await getLastPunchInOutDetailsUseCase.execute();
  await results.fold((l) async {
    // handle failure
  }, (r) async {
    emit(state.copyWith(loading: false,loaded: true,lastPunchInResponseModel: r));
    log(state.lastPunchInResponseModel!.toJson().toString());


    // handle success
  });
} catch (e) {
  log(e.toString());
  // handle exception
  emit(state.copyWith(loading: false,));
}
  }
     

  // PUNCH LOGIC
  Future<void> punchInLogic({required PunchInPostModel punchInPostModel}) async {
    emit(state.copyWith(isSubmitting: true,punchInFailure: false,punchInSuccess: false,punchOutSuccess: false,punchOutFailure: false,loading: false,loaded: false,));
    await Future.delayed(const Duration(seconds: 1));
    final result = await punchInUseCase.execute(punchInPostModel: punchInPostModel);
   result.fold((l) {
    emit(state.copyWith(isSubmitting: false, punchInFailure: true, apiFailModel: ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l),  message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l))));
   }, (r)  async{
    // emit(state.copyWith(isSubmitting: false, punchInSuccess: true, loading: ));
    emit(state.copyWith(punchInSuccess: true,punchOutSuccess: false,punchInFailure: false,punchOutFailure: false,loading: false,loaded: false,));
    await getLastPunchInOutData();
   });
  } 


   // PUNCHOUT LOGIC
  Future<void> punchOutLogic({required PunchoutPostModel punchoutPostModel,bool? isLogoutClicked}) async {
    emit(state.copyWith(isSubmitting: true,punchInFailure: false,punchInSuccess: false,punchOutSuccess: false,loading: false,loaded: false));
    await Future.delayed(const Duration(seconds: 1));
    final result = await punchOutUseCase.execute(punchoutPostModel: punchoutPostModel);
   result.fold((l) {

    emit(state.copyWith( punchOutFailure: true, apiFailModel: ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l),  message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l))));
   }, (r) async {

    emit(state.copyWith(isSubmitting: false, punchOutSuccess: true, apiFailModel: null,loading: false,loaded: false,));
    final keyValueStorage = locator.get<KeyValueStorage>();
    keyValueStorage.sharedPreferences.clear();
          if(isLogoutClicked != null && isLogoutClicked == true) {
        return;
        }
      //  await getLastPunchInOutData();
   });
  } 
}
