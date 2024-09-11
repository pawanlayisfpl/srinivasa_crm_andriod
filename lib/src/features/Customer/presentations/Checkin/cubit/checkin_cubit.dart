// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';

import 'package:srinivasa_crm_new/shared/domain/repo/Employe/employe_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Purpose/purpose_repo.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/joint_employe_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_state.dart';

import '../../../../../../shared/domain/model/Image/image_model.dart';
import '../../../../../../shared/domain/model/Purpose/purpose_model.dart';
import '../../../../../core/model/model.dart';
import '../../../domain/model/post/checkin_post_model.dart';
import '../../../domain/model/post/checkout_post_model.dart';
import '../../All Customers/cubit/all_customer_cubit.dart';

@injectable
class CheckinCubit extends Cubit<CheckinState> {
  final CustomerRepo customerRepo;
  final EmployeRepo employeRepo;
  final PurposeRepo purposeRepo;
  final CommonImageServices commonImageServices;

  CheckinCubit({
    required this.customerRepo,
    required this.employeRepo,
    required this.purposeRepo,
    required this.commonImageServices,
  }) : super( CheckinState.initial() );


  void setSelectedEmployeList(List<JoinEmployeModel> values) {
    emit(state.copyWith(selectedEmployeList: values,isFailed: false));
  }


  void clearEmployeLists() {
    emit(state.copyWith(selectedEmployeList: [],isFailed: false));
  } 



  // CHECKIN

  Future<void> checkInLogic({required CheckinPostModel checkInPostModel,required VoidCallback successCallback})async {
    emit(state.copyWith(isLoading: true,apiFailedModel: null,checkInResponseModel: null,checkoutResponseModel: null,isFailed: false,isCheckIn: false));
    final result = await customerRepo.checkIn(checkinPostModel: checkInPostModel);
    result.fold(
      (l) {
        ApiFailedModel apiFailedModel = ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l), message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l));
           emit(state.copyWith(isLoading: false,apiFailedModel: apiFailedModel,checkInResponseModel: null,checkoutResponseModel: null,isFailed: true,isCheckIn: false));

      },
      (r) async {
        emit(state.copyWith(isLoading: false,apiFailedModel: null,checkInResponseModel: r,isCheckIn: true));
        lastCheckinCheckoutLogic(customerId: checkInPostModel.customerid.toString(),farmId: checkInPostModel.farmId.toString());
        successCallback();
      },
    );
  }

  // CHECKOUt
  Future<void> checkoutLogic({required CheckoutPostModel checkOutPostModel,required BuildContext context}) async {

    emit(state.copyWith(isLoading: true,apiFailedModel: null,checkInResponseModel: null,checkoutResponseModel: null,isCheckOut: false));
    QuickAlert.show(context: context, type: QuickAlertType.loading, title: 'Checking Out', text: 'Please wait...',disableBackBtn: true,barrierDismissible: false);
    final result = await customerRepo.checkOut(checkoutPostModel: checkOutPostModel);
    result.fold(
      (l) {
        Navigator.pop(context);
        ApiFailedModel apiFailedModel = ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l), message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l));
        emit(state.copyWith(isLoading:  false,apiFailedModel: apiFailedModel,checkInResponseModel: null,checkoutResponseModel: null,isFailed: true,isCheckIn: false));
      },
      (r) async {
         Navigator.pop(context);
        emit(CheckinState.initial());
        resetCheckoutState();
        
        emit(state.copyWith(checkoutResponseModel: r,isCheckOut: true,));
         await context.read<AllCustomerCubit>().getAllCustomer();
      },
    );
  }

  // LAST CHECKIN CHECKOUT RESPONSE
  Future<void> lastCheckinCheckoutLogic({required String customerId,required String farmId}) async {
    emit(state.copyWith(isLoading: true,apiFailedModel: null,checkInResponseModel: null,checkoutResponseModel: null,isFailed: false,lastCheckinOutResponseModel: null,isCheckIn: false,isCheckOut: false));
    final result = await customerRepo.getLastCheckInCheckoutDetails(customerId: customerId, farmId: farmId);
    result.fold(
      (l) {
        ApiFailedModel apiFailedModel = ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l), message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l));
        emit(state.copyWith(isLoading: false,apiFailedModel: apiFailedModel,checkInResponseModel: null,checkoutResponseModel: null,isFailed: true));
      },
      (r) => emit(state.copyWith(isLoading: false,apiFailedModel: null,lastCheckinOutResponseModel: r,)),
    );
  }


  // GET EMPLOYEES LIST
  Future<void> getEmployeListLogic() async {
    emit(state.copyWith(isLoading: true,apiFailedModel: null,checkInResponseModel: null,checkoutResponseModel: null,employeList: [],selectedEmployeList: [],isFailed: false));
      final results = await customerRepo.getJointEmployeList();
      results.fold((l) => emit(state.copyWith(isLoading:  false,employeList: [],apiFailedModel: ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l), message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l)))), (r) => emit(state.copyWith(isLoading: false,employeList: r)));
      
  }

  // GET PURPOSE LIST

  Future<void> getAllPurposeLists() async {
    emit(state.copyWith(isLoading: true,apiFailedModel: null,checkInResponseModel: null,checkoutResponseModel: null,purposeList: [],isFailed: false));
    final results = await purposeRepo.getAllPurpose();
    results.fold((l) => emit(state.copyWith(isLoading: false,purposeList: [])), (r) => emit(state.copyWith(isLoading: false,purposeList: r)));
  }


  // SET SELECTED PURPOSE LIST
  void setSelectedPurposeList(List<PurposeModel> values) {
    emit(state.copyWith(selectedPurposeList: values,isFailed: false));
  }

  // CLEAR SELECTED PURPOSE LIST
  void clearPurposeLists() {
    emit(state.copyWith(selectedPurposeList: [],isFailed: false));
  }

  // SET SELECTED PURPOSE
  void setSelectedPurpose(PurposeModel value) {
    emit(state.copyWith(selectedPurpose: value,isFailed: false));
  }

  // CLEAR SELECTED PURPOSE
  void clearSelectedPurpose() {
    emit(state.copyWith(selectedPurpose: null,isFailed: false));
  }

  Future<void> pickFromCameraLogic() async {
    final results = await commonImageServices.pickMultipleUint8ListImageUsingImagePicker(isFromCamera: true);
    results.fold((l) => {
      
    }, (r) {
      final List<ImageModel>  existingImge = List.from(state.imageLists);
      existingImge.addAll(r);

      emit(state.copyWith(imageLists: existingImge.reversed.toList()));
    });
  }

  // PICK ALL IMAGES
  Future<void> pickAllImages() async {
    final result = await commonImageServices.pickMultipleUint8ListImage();
        // final result = await commonImageServices.pickMultipleUint8ListImageUsingImagePicker(isFromCamera: true);


        result.fold((l) => emit(state.copyWith()), (r) {
           final List<ImageModel>  existingImge = List.from(state.imageLists);
      existingImge.addAll(r);
          emit(state.copyWith(imageLists: existingImge.reversed.toList()));
        });


  }

  void clearImageLists() {
    emit(state.copyWith(imageLists: []));
  }

 void removeImage({required ImageModel image}) {
  // Create a modifiable copy of the list
  List<ImageModel> list = List<ImageModel>.from(state.imageLists);
  list.remove(image);
  emit(state.copyWith(imageLists: list));
}


// PICK ALL FILES

  // PICK ALL IMAGES
  Future<void> pickAllFiles() async {
    final result = await commonImageServices.pickeMultipleUint8Files();

        result.fold((l) => emit(state.copyWith(filesList: [])), (r) => emit(state.copyWith(filesList: r)));


  }

  void clearFilesLists() {
    emit(state.copyWith(filesList: []));
  }

 void removeFile({required FileModel file}) {
  // Create a modifiable copy of the list
  List<FileModel> list = List<FileModel>.from(state.filesList);
  list.remove(file);
  emit(state.copyWith(filesList: list));
}

//  REST STATE
void resetState() {
  // emit(CheckinState.initial());
}

void resetCheckoutState() {
  emit(state.copyWith(filesList: [],imageLists: [],selectedPurposeList: [],selectedPurpose: null));
}
}
