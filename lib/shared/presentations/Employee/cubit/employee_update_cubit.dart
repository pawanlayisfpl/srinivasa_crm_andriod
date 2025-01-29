// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/shared/domain/model/City/city_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_reporting_manager_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/single_employe_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/update_emloye_post_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/zone_model.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Address/address_repo.dart';

import 'package:srinivasa_crm_new/shared/domain/repo/Divisions/divison_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Employe/employe_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Zone/zone_repo.dart';
import 'package:srinivasa_crm_new/shared/presentations/AllEmploye/cubit/all_employe_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/cubit/state/single_employe_state.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';

import '../../../../src/config/config.dart';
import '../../../domain/model/StateModel/state_model.dart';
import '../../../domain/repo/Employe/roles_model.dart';

@injectable
class EmployeUpdateCubit extends Cubit<SingleEmployeState> {
  final EmployeRepo employeRepo;
  final DivisionRepo divisionRepo;
  final ZoneRepo zoneRepo;
  final AddressRepo addressRepo;
  
  EmployeUpdateCubit(
    this.employeRepo,
    this.divisionRepo,
    this.zoneRepo,
    this.addressRepo,
  ) : super(SingleEmployeState.initial());



  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();


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


  void onChangeState(String? val) {
    stateController.text = val ?? "";
  }
  void onChangeCity(String? val) {
    cityController.text = val ?? "";
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
    stateController.clear();
    cityController.clear();
  }

  disposeAllControllers() async {
    pincodeController.dispose();
    contactNumberController.dispose();
    emailController.dispose();
    userNameController.dispose();
    stateController.dispose();
    cityController.dispose();
  }
 

  Future<void> getAllInitialValues() async {
    await Future.wait([
      getAllZones(),
      getAllRoles(),
      getAllGenders(),
    getAllDivisions(),
      


    ]

    
    
    
    );

    


    SingleEmployeModel? singleEmployeModel = state.singleEmployeModel;

    if(singleEmployeModel != null) {

      pincodeController.text = singleEmployeModel.pincode ?? "";
      contactNumberController.text = singleEmployeModel.contactNo ?? "";
      emailController.text  = singleEmployeModel.email ?? "";
      userNameController.text = singleEmployeModel.username ?? "";


      if(singleEmployeModel.zones != null) {
        List<ZoneModel> zoneList = singleEmployeModel.zones!.map((e) => ZoneModel(
          zoneId: e.id,
          zoneName: e.zoneName
        )).toList();
          setSelectedZones(zoneList);
      }


      if(singleEmployeModel.authorities != null) {
        setSelectedRoles(singleEmployeModel.authorities!.map((e) => RolesModel(
          authority: e.authority,
          roleId: e.roleId
        )).toList());
      }


      if(singleEmployeModel.state != null) {
        onChangeState(singleEmployeModel.state);
      }

        }

         if(singleEmployeModel?.city != null) {
        onChangeCity(singleEmployeModel?.city);
      }

      if(singleEmployeModel?.gender != null) {
        setGender(singleEmployeModel?.gender);
      }
        

  }


  Future<void> getAllZones() async {
    emit(state.copyWith(isZoneLoading: false,zonesList: [],selectedZones: []));
    await Future.delayed(const Duration(milliseconds: 800));
    final results = await zoneRepo.getAllZones();

    results.fold((l) {
      // ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);
      emit(state.copyWith(zonesList: [],isZoneLoading: false,selectedZones: []));
      Fluttertoast.showToast(msg: 'zones api failed',backgroundColor: Colors.red,textColor: Colors.white);

    }, (r) {
      emit(state.copyWith(zonesList: r,selectedZones: [],isZoneLoading: false));

    });
  }

  Future<void> setSelectedZones(List<ZoneModel> selectedZones) async {
    emit(state.copyWith(selectedZones: selectedZones,reportingMangerList: [],isReportingMangaresLoading: true));

    if(state.selectedZones.isNotEmpty) {
      for(int i=0;i<state.selectedZones.length;i++) {
        final results  =   await employeRepo.getEmployeReportingMange(state.selectedZones[i].zoneId!.toString());
        results.fold((l) {}, (r) {
          emit(state.copyWith(reportingMangerList: List.from(r!.body!,)));
        });
      }
      emit(state.copyWith(isReportingMangaresLoading: false));
    }
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

  Future<void> getAllDivisions() async {
    emit(state.copyWith(isDivisionsLoading: true,divisionList: [],selectedDivisionModel: null));
    final results = await divisionRepo.getDivisions();

    results.fold((l) {
          emit(state.copyWith(isDivisionsLoading: false,divisionList: [],selectedDivisionModel: null));

    }, (r) async {
          emit(state.copyWith(isDivisionsLoading: false,divisionList: r,selectedDivisionModel: DivisionModel(divisionId: 4, divisionName: "Layers")));

          // await Future.delayed(const Duration(milliseconds: 800,),() {
          // });
          

    });
  }

  void setSelectedDivisionModel(DivisionModel? divisionModel) {
    emit(state.copyWith(selectedDivisionModel: divisionModel));
    
  }

  void setEmployeRepModel(EmployeRepModel? model) {
    emit(state.copyWith(selectedReportingManager: model));
  }

  void resetEmployeModel() {
    emit(state.copyWith(selectedReportingManager: null));
  }

  void resetDivisionModel() {
    emit(state.copyWith(selectedDivisionModel:   null));
  }


  Future<void> updateEmployeLogic(BuildContext context,String empid) async {
    if(context.mounted) {
      QuickAlert.show(context: context, type: QuickAlertType.loading,title: "Updating..");

UpdateEmployeePostModel updateEmployeePostModel = UpdateEmployeePostModel(
  userId: empid.toString(),
  username: userNameController.text.isNotEmpty
      ? userNameController.text
      : state.singleEmployeModel?.username ?? "",
  contactNo: contactNumberController.text.isNotEmpty
      ? contactNumberController.text.trim()
      : state.singleEmployeModel?.contactNo ?? "",
  gender: state.selectedGender != null ? state.selectedGender! : state.singleEmployeModel!.gender!,
  state: stateController.text.isNotEmpty
      ? stateController.text
      : state.singleEmployeModel?.state ?? "",
  city: cityController.text.isNotEmpty
      ? cityController.text
      : state.singleEmployeModel?.city ?? "",
  pincode: pincodeController.text.isNotEmpty
      ? pincodeController.text.trim()
      : state.singleEmployeModel?.pincode ?? "",
  roleIds: state.selectedRoles.isNotEmpty ? state.selectedRoles.map((e) => e.roleId!).toList() : state.singleEmployeModel!.authorities!.map((e) => e.roleId!).toList(),
  divisionId: state.selectedDivisionModel != null
      ? state.selectedDivisionModel?.divisionId ??
          int.parse(state.singleEmployeModel!.divisionId.toString())
      : int.parse(state.singleEmployeModel!.divisionId.toString()),
  zoneIds: state.selectedZones.isNotEmpty ? state.selectedZones.map((e) => e.zoneId!).toList() : [],
  reportingTo: state.selectedReportingManager != null
      ? state.selectedReportingManager?.id ?? -1
      : state.singleEmployeModel?.reportingTo ?? -1,
  joiningDate: state.singleEmployeModel?.joiningDate ?? "",
);


  await Future.delayed(const Duration(seconds: 2));
  if(context.mounted) {
    log(updateEmployeePostModel.toMap().toString());
    final results = await employeRepo.updateEmploye(updateEmployePostModel: updateEmployeePostModel);
    results.fold((l) {
      if(Navigator.canPop(context)) {
        Navigator.pop(context);
      Fluttertoast.showToast(msg: ApiFailedModel.fromNetworkExceptions(l).errorMessage,backgroundColor: Colors.red,textColor: Colors.white);
        if(context.mounted) {}
      }
    }, (r) {
      if(Navigator.canPop(context)) {
        Navigator.pop(context);

        if(context.mounted) {
          QuickAlert.show(context: context, type: QuickAlertType.success,title: "Employee Updated",onConfirmBtnTap: () async {
            context.read<AllEmployeCubit>().getEmployesData();
            if(Navigator.canPop(context)) {
              Navigator.pop(context);
              if(context.mounted) {
                Navigator.canPop(context) ? Navigator.pop(context) : null;
              }
            }
          });
        }
      }
    });
  }


    }
  }




  


  @override
  Future<void> close() {
    clearAllController();
    disposeAllControllers();
    return super.close();
  }
}
