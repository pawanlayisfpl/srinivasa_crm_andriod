// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/single_employe_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/zone_model.dart';

import 'package:srinivasa_crm_new/shared/domain/repo/Divisions/divison_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Employe/employe_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Zone/zone_repo.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/cubit/state/single_employe_state.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';

import '../../../../src/config/config.dart';
import '../../../domain/repo/Employe/roles_model.dart';

@injectable
class EmployeUpdateCubit extends Cubit<SingleEmployeState> {
  final EmployeRepo employeRepo;
  final DivisionRepo divisionRepo;
  final ZoneRepo zoneRepo;
  
  EmployeUpdateCubit(
    this.employeRepo,
    this.divisionRepo,
    this.zoneRepo,
  ) : super(SingleEmployeState.initial());



  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();


  void onChangePinCode(String? val) {
    pincodeController.text = val ?? "";
  }

  void onChangeContactNumber(String? val) {
    contactNumberController.text = val ?? "";
  }

  void onChangeEmail(String? val) {
    emailController.text = val ?? "";
  }


  void onChangeUserName(String? val) {
    userNameController.text = val ?? "";
  }

  Future<void> getAllGenders() async {
    emit(state.copyWith(genderLoading: true,selectedGender: null,gender: []));
    await Future.delayed(const Duration(microseconds: 800));
    emit(state.copyWith(genderLoading: false,gender: [
      "Male",
      "Female"
    ]));  
  }


  void setGender(String? value) {
    emit(state.copyWith(selectedGender: value ?? ""));
  }


  void resetGender() {
    emit(state.copyWith(selectedGender: ""));
  }



  clearAllController() async {
    pincodeController.clear();
    contactNumberController.clear();
    emailController.clear();
    userNameController.clear();
  }

  disposeAllControllers() async {
    pincodeController.dispose();
    contactNumberController.dispose();
    emailController.dispose();
    userNameController.dispose();
  }
 

  Future<void> getAllInitialValues() async {
    await Future.wait([
      getAllZones(),
      getAllRoles(),
      getAllGenders(),

    ]);

    SingleEmployeModel? singleEmployeModel = state.singleEmployeModel;

    if(singleEmployeModel != null) {

      pincodeController.text = singleEmployeModel.pincode ?? "";
      contactNumberController.text = singleEmployeModel.contactNo ?? "";
      emailController.text  = singleEmployeModel.email ?? "";
      userNameController.text = singleEmployeModel.username ?? "";


      if(singleEmployeModel.zones != null) {
          setSelectedZones(singleEmployeModel.zones!.map((e) => ZoneModel(
        zoneId: e.id,
        zoneName: e.zoneName,
      )).toList());
      }


      if(singleEmployeModel.authorities != null) {
        setSelectedRoles(singleEmployeModel.authorities!.map((e) => RolesModel(
          authority: e.authority,
          roleId: e.roleId
        )).toList());
      }

        }

  }


  Future<void> getAllZones() async {
    emit(state.copyWith(isZoneLoading: false,zonesList: [],selectedZones: []));
    final results = await zoneRepo.getAllZones();

    results.fold((l) {
      // ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);
      emit(state.copyWith(zonesList: [],isZoneLoading: false,selectedZones: []));
      Fluttertoast.showToast(msg: 'zones api failed',backgroundColor: Colors.red,textColor: Colors.white);

    }, (r) {
      emit(state.copyWith(zonesList: r,selectedZones: [],isZoneLoading: false));

    });
  }

  void setSelectedZones(List<ZoneModel> selectedZones) async {
    emit(state.copyWith(selectedZones: selectedZones));
  }

  void resetSelectedZones() {
    emit(state.copyWith(selectedZones: []));
  }


  Future<void> getAllRoles() async {
    emit(state.copyWith(isRolesLoading: true,rolesList: [],selectedRoles: []));
    final results = await employeRepo.getAllRoles();

    results.fold((l) {
          emit(state.copyWith(isRolesLoading: false,rolesList: [],selectedRoles: []));


    }, (r) {

          emit(state.copyWith(isRolesLoading: false,rolesList: r,selectedRoles: []));

    });
  }


  void setSelectedRoles(List<RolesModel> rolesList) {
    emit(state.copyWith(selectedRoles: rolesList));
  }

  void resetRoles() {
    emit(state.copyWith(selectedRoles: []));
  }





  Future<void> getEmployesDetails(BuildContext context,String id) async {
    emit(state.copyWith(isSingleEmployeModelLoading: true));
    String? employeId =  locator.get<KeyValueStorage>().sharedPreferences.getString(KeyValueStrings.userId);
    log('Printing employee id ${employeId ?? "No Id found"}');
    if(employeId == null) {
      if(context.mounted) {
        QuickAlert.show(context: context, type: QuickAlertType.error,title: "Error",text: "No id found");
      }
      
    }else {
       final results = await employeRepo.getEmployeById(employeId: id.isNotEmpty ? id : 450342.toString() );
        results.fold((l) { 
          emit(state.copyWith(isSingleEmployeModelLoading: false));
          ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);
          if(context.mounted) {
            QuickAlert.show(context: context, type: QuickAlertType.error,title: apiFailedModel.message,text: apiFailedModel.errorMessage);
          }
        }, (r) {
          emit(state.copyWith(isSingleEmployeModelLoading: false,singleEmployeModel: r));
        });
    }
    // final results = await employeRepo.getEmployeById(employeId: employeId)
  }


  


  @override
  Future<void> close() {
    clearAllController();
    disposeAllControllers();
    return super.close();
  }
}
