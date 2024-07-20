
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/kyc_remarks_field.dart';

import 'kyc_upload_state.dart';
@injectable
class KycUploadCubit extends Cubit<KycUploadState> {
  final CommonImageServices imageServices;

  KycUploadCubit({required this.imageServices}) : super(KycUploadState.initial());


  final _remarksController = TextEditingController();
  TextEditingController get remarksController => _remarksController;


  Future<void> getAdharFileFront() async {
    
    final results = await imageServices.pickSingleImage();
    results.fold((l) => emit(state.copyWith(adharFileFront: null)), (r) => emit(state.copyWith(adharFileFront: r)));
  }

  Future<void> getAdharFileBack() async {
    final results = await imageServices.pickSingleImage();
    results.fold((l) => emit(state.copyWith(adharFileBack: null)), (r) => emit(state.copyWith(adharFileBack: r)));
  }

  Future<void> getPanFile() async {
    final results = await imageServices.pickSingleImage();
    results.fold((l) => emit(state.copyWith(panFile: null)), (r) => emit(state.copyWith(panFile: r)));
  }

  void removeAdharFileFront() {
    emit(state.copyWith(adharFileFront: null));
  }

  void removeAdharFileBack() {
    emit(state.copyWith(adharFileBack: null));
  }

  void removePanFile() {
    emit(state.copyWith(panFile: null));
  }

  void setRemarks(String remarks) {
    emit(state.copyWith(remarksField: KycRemarksField(remarks)));
  }


  void submitKyc( ) async {
    emit(state.copyWith(isSubmitting: true,errorMessage: null,isSuccess: false));
    await Future.delayed(const Duration(seconds: 1));
    final adharFileFront = state.adharFileBack;
    final adharFileBack = state.adharFileBack;
    final panFile = state.panFile;
    // final remarks = state.remarksField.value.getOrElse(() => '');

    if(adharFileFront != null && adharFileBack != null  && panFile != null) {

      emit(state.copyWith(isSubmitting: false, errorMessage: null, isSuccess: true,adharFileBack: null,adharFileFront: null,panFile: null));
    } else {
      emit(state.copyWith(isSubmitting: false,errorMessage: "Please fill all fields"));
    }
  }

  void reset() {
    emit(KycUploadState.initial());
  }


  

 
}