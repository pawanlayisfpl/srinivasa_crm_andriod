// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/kyc_remarks_field.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/post/kyc_upload_post_model.dart';

import '../../../domain/repo/kyc_repo.dart';
import 'kyc_upload_state.dart';
@injectable
class KycUploadCubit extends Cubit<KycUploadState> {
  final CommonImageServices imageServices;
  final KycRepo kycRepo;

  KycUploadCubit({
    required this.imageServices,
    required this.kycRepo,
  }) : super(KycUploadState.initial());


  final _remarksController = TextEditingController();
  TextEditingController get remarksController => _remarksController;

  final adharCardController = TextEditingController();
  final panCardController = TextEditingController();
  final gstController = TextEditingController();




  Future<void> getAdharFileFront() async {
    
    final results = await imageServices.pickSingleImageBytes();
    results.fold((l) => emit(state.copyWith(adharFileFront: null)), (r) => emit(state.copyWith(adharFileFront: r)));
  }

  Future<void> getAdharFileBack() async {
    final results = await imageServices.pickSingleImageBytes();
    results.fold((l) => emit(state.copyWith(adharFileBack: null)), (r) => emit(state.copyWith(adharFileBack: r)));
  }

  Future<void> getGSTFile() async {
    final results = await imageServices.pickSingleImageBytes();
    results.fold((l) => emit(state.copyWith(gstFile: null)), (r) => emit(state.copyWith(gstFile: r)));
  }

  Future<void> getPanFile() async {
    final results = await imageServices.pickSingleImageBytes();
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

  void removeGstFile() {
    emit(state.copyWith(gstFile: null));  
  }

  void setRemarks(String remarks) {
    emit(state.copyWith(remarksField: KycRemarksField(remarks)));
  }


  void submitKyc( {required String customerid,required VoidCallback successCallback}) async {
    emit(state.copyWith(isSubmitting: true,errorMessage: null,isSuccess: false));
    await Future.delayed(const Duration(seconds: 1));
    final adharFileFront = state.adharFileBack;
    final adharFileBack = state.adharFileBack;
    final gstFile = state.gstFile;
    final panFile = state.panFile;
    final adharNumber = adharCardController.text;
    final panNumber = panCardController.text;

    if(adharFileFront != null && adharFileBack != null  && panFile != null && adharNumber.isNotEmpty && panNumber.isNotEmpty && gstController.text.isNotEmpty && gstFile != null) {
        KycUploadPostModel kycUploadPostModel = KycUploadPostModel(customerId: customerid, aadharid: adharNumber, panCardId: panNumber, gstInNo: gstController.text,aadharFileBack: adharFileBack, remarks: remarksController.text,aadharFile: adharFileFront,panCardFile: panFile,gstInFile: gstFile);
     final results =   await kycRepo.uploadKycDetails(kycUploadPostModel: kycUploadPostModel);
  results.fold((l) => emit(state.copyWith(isSubmitting: false,errorMessage:'something went wrong')), (r) {
    emit(state.copyWith(isSubmitting: true,isLoading: false,isSuccess: true));
    gstController.clear();
    panCardController.clear();
    // adharCardController.clear();
    successCallback();
  });

      // emit(state.copyWith(isSubmitting: false, errorMessage: null, isSuccess: true,adharFileBack: null,adharFileFront: null,panFile: null));
    } else {
      emit(state.copyWith(isSubmitting: false,errorMessage: "Please fill all fields"));
    }
    }

  void reset() {
    emit(KycUploadState.initial());
  }


  

 
}
