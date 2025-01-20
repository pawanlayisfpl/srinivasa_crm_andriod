import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/shared/domain/model/District/district_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Locality/locality_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/StateModel/state_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/customer_full_response_model.dart';

import '../../../../../../../shared/domain/model/City/city_model.dart';
import '../../../../../../../shared/domain/model/Country/country_model.dart';
import '../../../../../../../shared/domain/model/Employe/employe_reporting_manager_model.dart';
import '../../../../../../../shared/domain/model/Primary Source/primary_source_model.dart';
import '../../../../../../../shared/domain/model/zone_model.dart';

part 'update_customer_state.freezed.dart';

@freezed
class UpdateCustomerState with _$UpdateCustomerState {
  const factory UpdateCustomerState({
    @Default(false) bool isSubmitting,
    @Default(false) bool isLoading,
    @Default(false) bool isStateLoading,
    @Default(false) bool isCountryLoading,
    @Default(false) bool isCityLoading,
    @Default(false) bool isDistrictLoading,

    @Default(null) CustomerFullDetailsResponseModel? customerFullDetailsresposneModel,
    @Default(-1) int farmId,
    @Default('') String customerId,
    @Default('') String farmName,
    @Default('') String customerName,
    @Default('') String customerPhone,
    @Default('') String title,
    @Default('') String email,
    @Default(false) bool customerType,
    @Default('') String addressLine2,
    @Default(0.0) double creditLimit,
    @Default(1) int primarySourceId,
    @Default('') String zoneId,
    @Default('') String kycStatus,
    @Default(false) bool isPrimarySourceLoading,
    @Default([]) List<PrimarySourceModel> primarySoruceList,
    @Default(null) PrimarySourceModel? selectedPrimarySourceModel,
    @Default([]) List<ZoneModel> zonesList,
    @Default(null) ZoneModel? selectedZoneModel,
    @Default([]) List<EmployeeModel> employeList,
    @Default(null) EmployeeModel? selectedEmployeModel,
    @Default([]) List<EmployeRepModel> repMangerList,
    @Default(null) EmployeRepModel? selectedRepModel,
    @Default(false) bool isEmployeRepLoading,

    
    


  @Default([]) List<String> titleList,
  @Default(null) String? selectedTitleValue,
  @Default([]) List<CountryModel> countriesList,
  @Default(null) CountryModel? countryModel,
  
  @Default([]) List<StateModel> statesList,
  @Default(null) StateModel? selectedStateModel,
  @Default([]) List<DistrictModel> districtList,
  @Default(null) DistrictModel? selectedDistrictModel,
  @Default([]) List<CityModel> citiesList,
  @Default([]) List<DivisionModel> divisionList,
  @Default([]) List<DivisionModel> selectedDivisionList,
  @Default(null) CityModel? selectedCityModel,
  @Default(false) bool isLocalictyLoading,
  @Default([]) List<LocalityModel> localitiesList,
  @Default(null) LocalityModel? selectedLocalityModel,
  @Default(false) bool isZoneLoading,
  @Default(false) bool isEmployeLoading,

    @Default(-1) int countryId,
    @Default('') String stateId,
    @Default('') String districtId,
    @Default(-1) int cityId,
    @Default(-1) int localityId,
    @Default('') String mandal,
    @Default('') String postalCode,
    @Default('') String address,
    @Default('') String contactPerson,
    @Default('') String faxNo,
    @Default('') String mobile,
    @Default('') String alternateContact,
    @Default(false) bool isIndividual,
    @Default(false) bool isOrganization,
    @Default([]) List<int> divisionId,
    @Default(0.0) double farmCapacity,
    @Default(-1) int assignTo,
  }) = _UpdateCustomerState;

  factory UpdateCustomerState.initial() => const UpdateCustomerState(
    isCityLoading:  false,isCountryLoading: false,isStateLoading: false,isDistrictLoading: false,
    customerFullDetailsresposneModel: null,
    citiesList: [],selectedCityModel: null,districtList:  [], selectedDivisionList: [],selectedDistrictModel: null,countriesList: [],

    countryModel: null,divisionList: [],
     isPrimarySourceLoading: false,
     selectedPrimarySourceModel:  null,
     primarySoruceList: [],
     isEmployeLoading: false,
     isEmployeRepLoading: false,
     isZoneLoading: false,
     repMangerList: [],
     selectedRepModel: null,
     
    
    selectedStateModel: null,
    selectedTitleValue: null,
    statesList: [],
    titleList: [],
  isLocalictyLoading: false,
  localitiesList: [],
  selectedLocalityModel: null,
    isSubmitting: false,
    isLoading: false,
        farmId: -1,
        customerId: '',
        farmName: '',
        customerName: '',
        customerPhone: '',
        title: '',
        email: '',
        customerType: false,
        addressLine2: '',
        creditLimit: 0.0,
        primarySourceId: 1,
        zoneId: '',
        kycStatus: '',
        countryId: -1,
        stateId: '',
        districtId: '',
        cityId: -1,
        localityId: -1,
        mandal: '',
        postalCode: '',
        address: '',
        contactPerson: '',
        faxNo: '',
        mobile: '',
        alternateContact: '',
        isIndividual: false,
        isOrganization: false,
        divisionId: [],
        farmCapacity: 0.0,
        assignTo: -1,
         employeList: [],
         selectedZoneModel: null,
         zonesList: [],
         selectedEmployeModel: null,
          
      );
}
