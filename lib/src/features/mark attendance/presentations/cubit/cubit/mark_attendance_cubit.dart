// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:battery_plus/battery_plus.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/constants/key_value_strings.dart';
import 'package:srinivasa_crm_new/src/config/locator/locator.dart';
import 'package:srinivasa_crm_new/src/core/battery/common_battery.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../../../common/services/notifications/common_notifications.dart';
import '../../../domain/domain.dart';
import 'mark_attendance_state.dart';

@injectable
class MarkAttendanceCubit extends Cubit<MarkAttendanceState> {
  final PunchInUseCase punchInUseCase;
  final PunchOutUsecase punchOutUseCase;
  final LastPunchInOutUseCase getLastPunchInOutDetailsUseCase;
  final CommonLocationServices commonLocationServices;
   final CommonNotifications commonNotifications;

  MarkAttendanceCubit(
    this.punchInUseCase,
    this.punchOutUseCase,
    this.getLastPunchInOutDetailsUseCase,
    this.commonLocationServices,
    this.commonNotifications
    
  ) : super( MarkAttendanceState.initial());

  // GET LAST PUNCH IN-OUT DATA
  Future<void> getLastPunchInOutData() async {
    emit(MarkAttendanceState.initial());
    emit(state.copyWith(loading: true));
    // await Future.delayed(const Duration(seconds: 1));
   try {
  final results = await getLastPunchInOutDetailsUseCase.execute();
  await results.fold((l) async {
    // handle failure
    emit(state.copyWith(loading: false,apiFailModel: ApiFailedModel.fromNetworkExceptions(l)));
  }, (r) async {
    emit(state.copyWith(loading: false,loaded: true,lastPunchInResponseModel: r));
    debugPrint(state.lastPunchInResponseModel!.toJson().toString());


    // handle success
  });
} catch (e) {
  debugPrint(e.toString());
  // handle exception
  emit(state.copyWith(loading: false,));
}
  }
     

  // PUNCH LOGIC
  Future<void> punchInLogic() async {
    emit(state.copyWith(isSubmitting: true,punchInFailure: false,punchInSuccess: false,punchOutSuccess: false,punchOutFailure: false,loading: false,loaded: false,));
     final postion = await commonLocationServices.getUserCurrentPosition();

    int batterylevl = await locator.get<CommonBattery>().getBatteryLevel();
    

    PunchInPostModel postModel = PunchInPostModel(
      latitude: postion.latitude.toString(),
      longitude: postion.longitude.toString(),
      createdAt: DateTime.now().toString(),
      batteryStatus: batterylevl.toString(),

      
    );
    final result = await punchInUseCase.execute(punchInPostModel: postModel);
   result.fold((l) {
    emit(state.copyWith(isSubmitting: false, punchInFailure: true, apiFailModel: ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l),  message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l))));
   }, (r)  async{
    // emit(state.copyWith(isSubmitting: false, punchInSuccess: true, loading: ));
    emit(state.copyWith(punchInSuccess: true,punchOutSuccess: false,punchInFailure: false,punchOutFailure: false,loading: false,loaded: false,));
    await getLastPunchInOutData();
   });
  } 


   // PUNCHOUT LOGIC
  Future<void> punchOutLogic({bool? isLogoutClicked}) async {
    emit(state.copyWith(isSubmitting: true,punchInFailure: false,punchInSuccess: false,punchOutSuccess: false,loading: false,loaded: false));

    final postion = await commonLocationServices.getUserCurrentPosition();
        int batterylevl = await locator.get<CommonBattery>().getBatteryLevel();

    PunchoutPostModel postModel = PunchoutPostModel(
      createdAt: DateTime.now().toString(),
      latitude: postion.latitude.toString(),
      longitude: postion.longitude.toString(),
      batteryStatus: batterylevl.toString(),  
    );
   

    final result = await punchOutUseCase.execute(punchoutPostModel: postModel);
   result.fold((l) {

    emit(state.copyWith( punchOutFailure: true, apiFailModel: ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l),  message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l))));
   }, (r) async {

    emit(state.copyWith(isSubmitting: false, punchOutSuccess: true, apiFailModel: null,loading: false,loaded: false,));
    final keyValueStorage = locator.get<KeyValueStorage>();
    final dioclinet = locator.get<DioClient>();
     int batteryValue = 0;


    var battery = Battery();
        final postion = await commonLocationServices.getUserCurrentPosition();

    batteryValue = await battery.batteryLevel;
      String userDateTime = DateTime.now().toIso8601String();
    final response = await dioclinet.post(Endpoints.locationUrl,
   
    data:  {
    "latitude": postion.latitude.toString(),
    "longitude": postion.longitude.toString(),
    "userDateTime": userDateTime,
    "batteryStatus" : batteryValue.toString(),
  },headers: {});


  if(response.statusCode == 200 || response.statusCode == 201) {
    keyValueStorage.sharedPreferences.remove(KeyValueStrings.isLoggedIn);

    // await FirebaseMessaging.instance.unsubscribeFromTopic('news');


  }else {

  }
    // TODO: COMMENTING THIS FOR TESTING
    // keyValueStorage.sharedPreferences.clear();
        //   if(isLogoutClicked != null && isLogoutClicked == true) {
        // return;
        // }
      //  await getLastPunchInOutData();
   });
  } 
}
