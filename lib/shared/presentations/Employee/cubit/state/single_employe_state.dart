import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/shared/domain/model/City/city_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_reporting_manager_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/StateModel/state_model.dart';
import 'package:srinivasa_crm_new/shared/shared.dart';

import '../../../../domain/model/Employe/single_employe_model.dart';
import '../../../../domain/repo/Employe/roles_model.dart';

part 'single_employe_state.freezed.dart';

@freezed
class SingleEmployeState with _$SingleEmployeState {

  const factory SingleEmployeState({
    @Default(null) SingleEmployeModel? singleEmployeModel,
    @Default(false) bool isSingleEmployeModelLoading ,
    @Default([]) List<StateModel> statesList,
    @Default(null) StateModel? selectedStateModel,
    @Default(false) bool stateLoading,
    @Default([]) List<CityModel> cityList,
    @Default(null) CityModel? selectedCityModel,
    @Default(false) bool isCityLoading,
    @Default([]) List<ZoneModel> zonesList,
    @Default([]) List<ZoneModel> selectedZones,
    @Default(false) bool isZoneLoading,
    @Default([]) List<String> gender,
    @Default(null) String? selectedGender,
    @Default(false) bool genderLoading,
    @Default([]) List<EmployeRepModel> reportingMangerList,
    @Default(null) EmployeRepModel? selectedReportingManager,
    @Default(false) bool isReportingMangaresLoading,
    @Default([]) List<DivisionModel> divisionList,
    @Default(null) DivisionModel? selectedDivisionModel,
    @Default(false) bool isDivisionsLoading,
    @Default(false) bool isRolesLoading,
    @Default([]) List<RolesModel> selectedRoles, 
    @Default([]) List<RolesModel> rolesList, 

    
  }) = _SingleEmployeState;



  factory SingleEmployeState.initial() => const SingleEmployeState(
    singleEmployeModel:  null,
    isSingleEmployeModelLoading:false,
    statesList: [],
    selectedStateModel: null,
    stateLoading: false,
    cityList: [],
    selectedCityModel: null,
    isCityLoading: false,
    zonesList: [],
    selectedZones: [],
    isZoneLoading: false,
    gender: [],
    selectedGender: null,
    genderLoading: false,
    reportingMangerList: [],
    selectedReportingManager: null,
    isReportingMangaresLoading: false,
    divisionList: [],
    selectedDivisionModel: null,
    isDivisionsLoading: false,
    isRolesLoading: false,
    selectedRoles: [],
    rolesList: []
  ); 




}