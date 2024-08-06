

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Country/country_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/District/district_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Primary%20Source/primary_source_model.dart';
import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/common/fields/string_field.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_addation_phone_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_address_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_addresslinetwo_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_city_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_contact_person_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_credit_limit_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_customer_name_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_locality_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_mandal_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_mobile_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_phone_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_pincode_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_title_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/assigned_to_model.dart';

import '../../../../../../../../shared/domain/model/City/city_model.dart';
import '../../../../../../../../shared/domain/model/Locality/locality_model.dart';
import '../../../../../../../../shared/domain/model/StateModel/state_model.dart';
import '../../../../../../../../shared/domain/model/zone_model.dart';
import '../../../../../domain/model/field/customer_create_email_field.dart';
import '../../../../../domain/model/get/customer_code_model.dart';

part 'customer_create_state.freezed.dart';

@freezed
class CustomerCreateState with _$CustomerCreateState {
const factory CustomerCreateState({
  required CustomerCreateCustomerNameField customerCreateCustomerNameField,
  required CustomerCreatePhoneField customerPhoneField,
  // REMOVE THIS FIELD
  required CustomreCreateTitleField customerTitleField,
  required CustomerCreateContactPersonField customerCreateContactPersonField,
  required CustomerCreateMobileField customerMobileField,
  required CustomerCreateEmailField customerCreateEmailField,
  required CustomerCreateAddationalPhoneField customerCreateAddationField,
    required List<PrimarySourceModel> primarySourceList,
  @Default(null) PrimarySourceModel? selectedPrimarySourceModel,
    required List<ZoneModel> zoneList,
  @Default(null) ZoneModel? selectedZoneModel,
    required List<String> customerTypeList,
  @Default(null) String? selectedCustomerType,
  required CustomerCreateCreditLimitField customerCreateCreditLimitField,
    @Default([]) List<CityModel> cityList,
  @Default(null) CityModel? selectedCityModel,



  required CustomerCreateAddressLineTwoField customerCreateAddressLineTwoField,
  required CustomerCreateMandalField customerCreateMandalField,
   @Default([]) List<AssignedToModel> assignedList,
  @Default(null) AssignedToModel? selectedAssignedModel,
    @Default(false) bool districtLoading,
  @Default([]) List<DivisionModel> divisionsList,
  @Default([]) List<DivisionModel> selectedDivisionsList,
  @Default(false) bool isDivisionLoading,
  @Default(null) DivisionModel? selectedDivisionModel,
  @Default([]) List<CountryModel> countryList,
  @Default([]) List<StateModel> stateList,
  @Default(null) StateModel? selectedStateModel,
  @Default([]) List<DistrictModel> districtList,
  @Default(null) DistrictModel? selectedDistrictModel,

  @Default([]) List<LocalityModel> localityList,
  @Default(null) LocalityModel? selectedLocalityModel,
  required CustomerCreateAddressField customerCreateAddressField,
  required CustomerCreatePincodeField customerCreatePincodeField,
  @Default(true) bool isBusinessPartner,

  required StringField faxNumberField,
  required StringField farmNameField,
  required NumberField farmCapacityField,
  @Default([]) List<CustomerCodeModel> customerCodeList,
  @Default(null) CustomerCodeModel? selectedCustomerCodeModel,  
  @Default(false) bool isCustomerCodeLoading,
  





// REMOVEE
  required CustomerCreateCityField customerCreateCityField,
  required CustomerCreateLocalityField customerCreateLocalityField,
  
  required bool isSubmitting,
  required bool isSuccess,
  @Default(null) ApiFailedModel? apiFailedModel,
  @Default(false) bool showInputError,



  
  @Default(null) CountryModel? selectedCountryModel,
  @Default([]) List<String> titlesList,
  @Default(null) String? selectedTitleValue,
 
  @Default(false) bool isLoading,
  @Default(false) bool zoneLoading,
  @Default(false) bool assingedToLaoding,
  @Default(false) bool primarySourceLoading,
  @Default(false) bool countryLoading,
  @Default(false) bool stateLoading,


  @Default(false) bool isCityLoading,
  @Default(false) bool isLocalityLoading,

  






  
}) = _CustomerCreateState;

factory CustomerCreateState.initial() => CustomerCreateState(
  customerCreateCustomerNameField: CustomerCreateCustomerNameField(''),
  customerPhoneField: CustomerCreatePhoneField(''),
  customerTitleField: CustomreCreateTitleField(''),
  customerMobileField: CustomerCreateMobileField(''),
  customerCreateEmailField: CustomerCreateEmailField(''),
  customerCreateAddationField: CustomerCreateAddationalPhoneField(''),
  customerCreateAddressLineTwoField: CustomerCreateAddressLineTwoField(''),
  customerCreateMandalField: CustomerCreateMandalField(''),
  customerCreateCityField: CustomerCreateCityField(''),
  customerCreateLocalityField: CustomerCreateLocalityField(''),
  customerCreatePincodeField: CustomerCreatePincodeField(''),
  customerCreateAddressField: CustomerCreateAddressField(''),
  customerCreateContactPersonField: CustomerCreateContactPersonField(''),
  customerCreateCreditLimitField: CustomerCreateCreditLimitField(''),
  farmCapacityField: NumberField(''),
  farmNameField: StringField(''),
  faxNumberField: StringField(''),
  
  


  apiFailedModel: null,
  isSubmitting: false,
  isSuccess: false,
  showInputError: false,
  primarySourceList: [],
  selectedPrimarySourceModel: null,
  zoneList: [],
  selectedZoneModel: null,
  customerTypeList: [],
  selectedCustomerType: null,
  districtList: [],
  selectedDistrictModel: null,
  stateList: [],
  selectedStateModel: null,
  countryList: [],
  selectedCountryModel: null,
  titlesList: [],
  selectedTitleValue: null,
  assignedList: [],
  selectedAssignedModel: null,
  isLoading: false,
  zoneLoading: false,
  assingedToLaoding: false,
  primarySourceLoading: false,
  countryLoading: false,
  stateLoading: false,
  districtLoading: false,
  divisionsList: [],
  selectedDivisionsList: [],
  isDivisionLoading: false,
  selectedDivisionModel: null,
  cityList: [],
  selectedCityModel: null,
  localityList: [],
  selectedLocalityModel: null,
  isCityLoading: false,
  isLocalityLoading: false,
   customerCodeList: []
  
  
  
);

}