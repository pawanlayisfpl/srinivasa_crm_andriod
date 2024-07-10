// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import 'package:srinivasa_crm_new/shared/domain/model/Country/country_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/District/district_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Primary%20Source/primary_source_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/StateModel/state_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/zone_model.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Address/address_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Primary%20Source/primary_source_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Zone/zone_repo.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_address_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_addresslinetwo_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_city_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_credit_limit_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_customer_name_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_email_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_locality_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_mandal_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_pincode_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/assigned_to_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';

import '../../../../../../../shared/domain/model/Employe/employe_model.dart';
import '../../../../../../../shared/shared.dart';
import '../../../../domain/model/field/customer_create_addation_phone_field.dart';
import '../../../../domain/model/field/customer_create_contact_person_field.dart';
import '../../../../domain/model/field/customer_create_mobile_field.dart';
import '../../../../domain/model/field/customer_create_phone_field.dart';
import 'state/customer_create_state.dart';

@injectable
class CustomerCreateCubit extends Cubit<CustomerCreateState> {
  final PrimarySourceRepo primarySourceRepo;
  final AddressRepo addressRepo;
  final ZoneRepo zoneRepo;
  final CustomerRepo customerRepo;

  CustomerCreateCubit({
    required this.primarySourceRepo,
    required this.addressRepo,
    required this.zoneRepo,
    required this.customerRepo,
  }) : super(CustomerCreateState.initial());

  // CONTROLLERS
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController contactPersonController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addationalPhoneController = TextEditingController();
  final TextEditingController creditLimitController = TextEditingController();
  final TextEditingController addressLineTwoController = TextEditingController();
  final TextEditingController mandalController = TextEditingController();
  final TextEditingController localityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController( );
  final TextEditingController cityController = TextEditingController( );


  void clearAllController() {
    customerNameController.clear();
    phoneController.clear();
    emailController.clear();
    addationalPhoneController.clear();
    creditLimitController.clear();
    addressLineTwoController.clear();
    localityController.clear();
    addressController.clear();
    pincodeController.clear();
    mandalController.clear();
    contactPersonController.clear();
    mobileController.clear();
    cityController.clear();
  }

  // CHANGE NAME FIELD
  void changeCustomerName({required String customerName}) {
    emit(state.copyWith(customerCreateCustomerNameField: CustomerCreateCustomerNameField(customerName)));
  }
  // CHANGE CONTACT PERSON FIELD
  void changeContactPerson({required String contactPerson}) {
    emit(state.copyWith(customerCreateContactPersonField: CustomerCreateContactPersonField(contactPerson)));
  }
  // CHANGE PHONE FIELD
  void changePhone({required String phone}) {
    emit(state.copyWith(customerPhoneField: CustomerCreatePhoneField(phone)));
  }

  // CHANGE MANDAL FIELD
  void changeMandlField({required String value}) {
    emit(state.copyWith(customerCreateMandalField: CustomerCreateMandalField(value)));
  }

  // CHANGE CREDIT LIMIT
  void changeCreditLimit({required String value}) {
    emit(state.copyWith(customerCreateCreditLimitField: CustomerCreateCreditLimitField(value)));
  }

  void getTitleLists() {
    emit(state.copyWith(titlesList: ['Mr', 'Mrs', ]));
  }

  // SET TITLE value
  void setTitleValue({required String titleValue}) {
    emit(state.copyWith(selectedTitleValue: titleValue));
  }

  // CHANGE MOBILE FIELD
  void changeMobile({required String mobile}) {
    emit(state.copyWith(customerMobileField: CustomerCreateMobileField(mobile)));
  }

  // CHANGE EMAIL FIELD
  void changeEmail({required String email}) {
    emit(state.copyWith(customerCreateEmailField: CustomerCreateEmailField(email)));
  }

  // CHANGE ADDITIONAL PHONE FIELD
  void changeAddationalPhone({required String addationalPhone}) {
    emit(state.copyWith(customerCreateAddationField: CustomerCreateAddationalPhoneField(addationalPhone)));
  }

  // CHANGE ADDRESS LINE TWO FIELD
  void changeAddressLineTwo({required String addressLineTwo}) {
    emit(state.copyWith(customerCreateAddressLineTwoField: CustomerCreateAddressLineTwoField(addressLineTwo)));
  }

  // CHANGE MANDAL FIELD
  void changeMandal({required String mandal}) {
    emit(state.copyWith(customerCreateMandalField: CustomerCreateMandalField(mandal)));
  }


  // GET PRIMARY SOURCE LIST
  Future<void> getPrimarySourceLists() async {
    emit(state.copyWith(isLoading: true));
    final results = await primarySourceRepo.getPrimarySources();
    results.fold((l) {
      emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
    }, (r) {
      emit(state.copyWith(primarySourceList: r, isLoading: false));
    });
  }
  

  // SET PRIMARY SOURCE VALUE
  void setPrimarySourceValue({required PrimarySourceModel primarySourceModel}) {
    emit(state.copyWith(selectedPrimarySourceModel: primarySourceModel));
  }

  // GET ZONE LIST
  Future<void> getZoneLists() async {
    // emit(state.copyWith());
    // final results = await addressRepo.getZones();
    // results.fold((l) {
    //   emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
    // }, (r) {
    //   emit(state.copyWith(zoneList: r, isLoading: false));
    // });
  }


  // SET ZONE VALUE
  void setZoneValue({required ZoneModel zoneModel}) async {
    emit(state.copyWith(selectedZoneModel: zoneModel));
    await Future.delayed(const Duration(milliseconds: 200));
    await getAssignedSRByZoneId(zoneModel: zoneModel);
  }

  // GET CUSTOMER TYPE LIST
  void getCustomerTypeLists() {
    emit(state.copyWith(customerTypeList: ['New', 'Existing']));
  }

  // SET CUSTOMER TYPE VALUE
  void setCustomerTypeValue({required String customerType}) {
    emit(state.copyWith(selectedCustomerType: customerType));
  }

  // GET DIVISION LIST
  Future<void> getDivisionLists({required String stateId}) async {
    emit(state.copyWith(isLoading: true));
    final results = await addressRepo.getDistrictByState(stateId: stateId);
    results.fold((l) {
      emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
    }, (r) {
      emit(state.copyWith(districtList: r, isLoading: false));
    });
  }

  // SET DIVISION VALUE

  void setDivisionValue({required DistrictModel districtModel}) {
    emit(state.copyWith(selectedDistrictModel: districtModel));
  }


  // GET STATE LIST
  Future<void> getStateLists({required String countryId}) async {
    emit(state.copyWith(isLoading: true));
    final results = await addressRepo.getStateByCountry(countryId: countryId);
    results.fold((l) {
      emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
    }, (r) {
      List<StateModel> sortedStateList = List.from(r);
      sortedStateList.sort((a, b) => a.stateName.toLowerCase().compareTo(b.stateName.toLowerCase()));
      emit(state.copyWith(stateList: sortedStateList, isLoading: false));
    });
  }

  // SET STATE VALUE
  void setStateValue({required StateModel stateModel}) async {
    emit(state.copyWith(selectedStateModel: stateModel));
    await Future.delayed(const Duration(milliseconds: 800));
    await getDistrictByState(stateId: stateModel.stateId.toString());
  }

  void setAssignedValue({required AssignedToModel assignedModel}) {
    emit(state.copyWith(selectedAssignedModel: assignedModel));
  }
  Future<void> getAssignedSRByZoneId({required ZoneModel zoneModel}) async {
    emit(state.copyWith(isLoading: true));
    final results = await customerRepo.getAssignedList(zoneModel: zoneModel);
    results.fold((l) {
      emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
    }, (r) {
      List<AssignedToModel> sortedAssignedList = List.from(r);
      sortedAssignedList.sort((a, b) => a.userName!.toLowerCase().compareTo(b.userName!.toLowerCase()));
      emit(state.copyWith(assignedList: sortedAssignedList, isLoading: false));
    });
  }


  // GET COUNTRY LIST
  Future<void> getCountryLists() async {
    emit(state.copyWith(isLoading: true));
    final results = await addressRepo.getCountries();
    results.fold((l) {
      emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
    }, (r) {
      emit(state.copyWith(countryList: r, isLoading: false));
    });
  }

  // SET COUNTRY VALUE
  void setCountryValue({required CountryModel countryModel}) async {
    emit(state.copyWith(selectedCountryModel: countryModel));
    await Future.delayed(const Duration(milliseconds: 800));
    if(state.selectedCountryModel != null && state.selectedCountryModel!.countryId.toString() == '79') {
    await getStateLists(countryId: countryModel.countryId.toString()); 
      
    }else {

    }

  }



  

  // CHANGE CITY FIELD
  void changeCity({required String city}) {
    emit(state.copyWith(customerCreateCityField: CustomerCreateCityField(city)));
  }

  // CHANGE LOCALITY FIELD
  void changeLocality({required String locality}) {
    emit(state.copyWith(customerCreateLocalityField: CustomerCreateLocalityField(locality)));
  }


  // CHANGE PINCODE FIELD
  void changePincode({required String pincode}) {
    emit(state.copyWith(customerCreatePincodeField: CustomerCreatePincodeField(pincode)));
  }

  // CHANGE ADDRESS FIELD
  void changeAddress({required String address}) {
    emit(state.copyWith(customerCreateAddressField: CustomerCreateAddressField(address)));
  }

  //CLEAR ALL COUNTRIES
  void clearCountiresModel() {
    emit(state.copyWith(selectedCountryModel: null,selectedStateModel: null,stateList: [],districtList: [],selectedDistrictModel: null,));
  }

    //CLEAR ALL PRIMAY SOURCE
  void clearPrimarySourceModel() {
    emit(state.copyWith(selectedPrimarySourceModel: null));
  }

  // CLEAR TITLE VALUE
  void clearTitleValue() {
    emit(state.copyWith(selectedTitleValue: null));
  }


  // CLEAR STATE VALUE
  void clearStateValue() {
    emit(state.copyWith(selectedStateModel: null,districtList: [],selectedDistrictModel: null));
  }

// CLEAR DIVISION VALUE
  void clearDivisionValue() {
    emit(state.copyWith(selectedDistrictModel: null));
  }

  // CLEAR ASSIGNE VALUE
  void clearAssigneValue() {
    emit(state.copyWith(selectedAssignedModel: null));
  }

  // CLEAR ZONE VALUE
  void clearZoneValue() {
    emit(state.copyWith(selectedZoneModel: null,assignedList: [],selectedAssignedModel: null));
  }

  void clearAssignedModel () {
    emit(state.copyWith(selectedAssignedModel: null));
  }



  void formSubmit() {
    emit(state.copyWith(isSubmitting: true));
    final customerName = state.customerCreateCustomerNameField.value.getOrElse(() => "");
    final phone = state.customerPhoneField.value.getOrElse(() => '');
    final mobile = state.customerMobileField.value.getOrElse(() => '');
    final email = state.customerCreateEmailField.value.getOrElse(() => '');
    final contactPerson = state.customerCreateContactPersonField.value.getOrElse(() => "");
    // OPTIONAL
    final addationalPhone = state.customerCreateAddationField.value.getOrElse(() => '');
    final addressLineTwo = state.customerCreateAddressLineTwoField.value.getOrElse(() => '');
    final creditLimit = state.customerCreateCreditLimitField.value.getOrElse(() => "");
    // ------------------ OPTIONAL FIELDS ENDS HERE ----------
    final country = state.selectedCountryModel;
    final stateModel = state.selectedStateModel;
    final distirctModel = state.selectedDistrictModel;
    final mandal = state.customerCreateMandalField.value.getOrElse(() => '');
    final city = state.customerCreateCityField.value.getOrElse(() => '');
    final locality = state.customerCreateLocalityField.value.getOrElse(() => '');
    final pincode = state.customerCreatePincodeField.value.getOrElse(() => '');
    final address = state.customerCreateAddressField.value.getOrElse(() => '');
    final title = state.selectedTitleValue;
    final primarySource = state.selectedPrimarySourceModel;
    final zone = state.selectedZoneModel;
    final customerType = state.selectedCustomerType;
    final assginedTo = state.selectedAssignedModel;





   


    if(title != null &&  customerName.isNotEmpty  && phone.isNotEmpty && contactPerson.isNotEmpty && mobile.isNotEmpty && email.isNotEmpty && customerType != null &&  zone != null && assginedTo != null && country != null && stateModel != null && distirctModel != null && mandal.isNotEmpty && city.isNotEmpty && locality.isNotEmpty && address.isNotEmpty && pincode.isNotEmpty ) {
      emit(state.copyWith(isSubmitting: false,showInputError: false));
      Fluttertoast.showToast(msg: 'Form submitted successfully', backgroundColor: AppColors.greenColor, textColor: Colors.white, gravity: ToastGravity.BOTTOM);
    } else {
      emit(state.copyWith(isSubmitting: false,showInputError: true));
            Fluttertoast.showToast(msg: 'Form submission faield', backgroundColor: AppColors.redColor, textColor: Colors.white, gravity: ToastGravity.BOTTOM);

    }


    
  }  




  // GET ALL PRIMARY SOURCES LISTS
  Future<void> getPrimarySourceList() async {
    emit(state.copyWith(primarySourceList: [],selectedPrimarySourceModel: null,primarySourceLoading: true));
    final results = await primarySourceRepo.getPrimarySources();
    results.fold((l) => emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),primarySourceLoading: false)), (r) {
      emit(state.copyWith(primarySourceList: r,primarySourceLoading: false));
    });
  }

 

//  GET ALL COUNTIRES LIST
  Future<void> getAllCountires() async {
    emit(state.copyWith(countryLoading: true));
    final resutls = await addressRepo.getCountries();
    resutls.fold((l) => emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),countryLoading: false,countryList: [],stateList: [],districtList: [])), (r) => emit(state.copyWith(countryList: r,countryLoading: false)));
  }

  // GET ALL STATES LIST
  Future<void> getAllStates({required String countryId}) async {
    emit(state.copyWith(stateLoading: true,stateList: []));
    final results = await addressRepo.getStateByCountry(countryId: countryId);
    results.fold((l) => emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),stateList: [],districtList: [],selectedStateModel: null,selectedDistrictModel: null)), (r) => emit(state.copyWith(stateList: r,stateLoading: false)));
  }

  // GET ALL DIVISION LIST
   Future<void> getDistrictByState({required String stateId}) async {
    emit(state.copyWith(districtList: [],districtLoading: true,selectedDistrictModel: null));
    await Future.delayed(const Duration(milliseconds: 800));
    final results = await addressRepo.getDistrictByState(stateId: stateId);
    results.fold((l) => emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),districtLoading: false)), (r) {
      List<DistrictModel> sortedDistrictList = List.from(r);
      sortedDistrictList.sort((a, b) => a.districtName!.toLowerCase().compareTo(b.districtName!.toLowerCase()));
      emit(state.copyWith(districtList: sortedDistrictList,districtLoading: false));
    });
   }

  //  GET ALL ZONE LIST
  Future<void> getAllZoneList() async {
    emit(state.copyWith(zoneLoading: true,zoneList: [],selectedZoneModel: null));
   final results = await zoneRepo.getAllZones();
    results.fold((l) => emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),zoneLoading: false)), (r) {
      List<ZoneModel> sortedZoneList = List.from(r);
      sortedZoneList.sort((a, b) => a.zoneName!.toLowerCase().compareTo(b.zoneName!.toLowerCase()));
      emit(state.copyWith(zoneList: sortedZoneList,zoneLoading: false));
    });
  }

  // GET ALL TITLES
  Future<void> getAllTitles() async {
    emit(state.copyWith(titlesList: ['Mr', 'Mrs']));
  }

  // GET ALL CUSTOMER TYPES LIST
  Future<void> getAllCustomerTypes() async {
    emit(state.copyWith(customerTypeList: ['Commerical', 'Non-Commerical']));
  }

  void clearCustomerType() {
    emit(state.copyWith(selectedCustomerType: null));
  }



  


  // GET ALL INITIAL VALUES
  Future<void> getAllInitialValues() async {
    emit(CustomerCreateState.initial());
    clearAllController();

    await getAllTitles();
    await getAllCustomerTypes();
    await getPrimarySourceList();
    await getCountryLists();
    await getAllZoneList();

  }


  void clearAllFields() {
    emit(CustomerCreateState.initial());
    clearAllController();
  }
  

}

