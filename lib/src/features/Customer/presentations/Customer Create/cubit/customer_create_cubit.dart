import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Country/country_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Primary%20Source/primary_source_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/StateModel/state_model.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Address/address_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Primary%20Source/primary_source_repo.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_address_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_addresslinetwo_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_city_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_customer_name_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_email_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_locality_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_mandal_field.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/field/customer_create_pincode_field.dart';

import '../../../../../../shared/shared.dart';
import '../../../domain/model/field/customer_create_addation_phone_field.dart';
import '../../../domain/model/field/customer_create_mobile_field.dart';
import '../../../domain/model/field/customer_create_phone_field.dart';
import 'state/customer_create_state.dart';


@injectable
class CustomerCreateCubit extends Cubit<CustomerCreateState> {
  final PrimarySourceRepo primarySourceRepo;
  final AddressRepo addressRepo;

  CustomerCreateCubit({required this.primarySourceRepo, required this.addressRepo}) : super(CustomerCreateState.initial());


  // CHANGE NAME FIELD
  void changeCustomerName({required String customerName}) {
    emit(state.copyWith(customerCreateCustomerNameField: CustomerCreateCustomerNameField(customerName)));
  }
  // CHANGE PHONE FIELD
  void changePhone({required String phone}) {
    emit(state.copyWith(customerPhoneField: CustomerCreatePhoneField(phone)));
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
  void setZoneValue({required ZoneModel zoneModel}) {
    emit(state.copyWith(selectedZoneModel: zoneModel));
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
    final results = await addressRepo.getDivisionByState(stateId: stateId);
    results.fold((l) {
      emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
    }, (r) {
      emit(state.copyWith(divisionList: r, isLoading: false));
    });
  }

  // SET DIVISION VALUE

  void setDivisionValue({required DivisionModel divisionModel}) {
    emit(state.copyWith(selectedDivisonModel: divisionModel));
  }


  // GET STATE LIST
  Future<void> getStateLists({required String countryId}) async {
    emit(state.copyWith(isLoading: true));
    final results = await addressRepo.getStateByCountry(countryId: countryId);
    results.fold((l) {
      emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
    }, (r) {
      emit(state.copyWith(stateList: r, isLoading: false));
    });
  }

  // SET STATE VALUE
  void setStateValue({required StateModel stateModel}) {
    emit(state.copyWith(selectedStateModel: stateModel));
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
  void setCountryValue({required CountryModel countryModel}) {
    emit(state.copyWith(selectedCountryModel: countryModel));
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



  void formSubmit() {
    emit(state.copyWith(isSubmitting: true));
    final customerName = state.customerCreateCustomerNameField.value.getOrElse(() => "");
    final phone = state.customerPhoneField.value.getOrElse(() => '');
    final mobile = state.customerMobileField.value.getOrElse(() => '');
    final email = state.customerCreateEmailField.value.getOrElse(() => '');
    final addationalPhone = state.customerCreateAddationField.value.getOrElse(() => '');
    final addressLineTwo = state.customerCreateAddressLineTwoField.value.getOrElse(() => '');
    final mandal = state.customerCreateMandalField.value.getOrElse(() => '');
    final city = state.customerCreateCityField.value.getOrElse(() => '');
    final locality = state.customerCreateLocalityField.value.getOrElse(() => '');
    final pincode = state.customerCreatePincodeField.value.getOrElse(() => '');
    final address = state.customerCreateAddressField.value.getOrElse(() => '');
    final title = state.selectedTitleValue;
    final primarySource = state.selectedPrimarySourceModel;
    final zone = state.selectedZoneModel;
    final customerType = state.selectedCustomerType;
    final division = state.selectedDivisonModel;
    final stateModel = state.selectedStateModel;
    final country = state.selectedCountryModel;

    print('Customer Name: $customerName');
    print('Phone: $phone');
    print('Mobile: $mobile');
    print('Email: $email');
    print('Addational Phone: $addationalPhone');
    print('Address Line Two: $addressLineTwo');
    print('Mandal: $mandal');
    print('City: $city');
    print('Locality: $locality');
    print('Pincode: $pincode');
    print('Address: $address');
    print('Title: $title');
    print('Primary Source: $primarySource');
    print('Zone: $zone');
    print('Customer Type: $customerType');
    print('Division: $division');
    print('State: $stateModel');
    print('Country: $country');


    if(customerName.isNotEmpty && phone.isNotEmpty && mobile.isNotEmpty && email.isNotEmpty && addationalPhone.isNotEmpty && addressLineTwo.isNotEmpty && mandal.isNotEmpty && city.isNotEmpty && locality.isNotEmpty && pincode.isNotEmpty && address.isNotEmpty && title != null && primarySource != null && zone != null && customerType != null && division != null && stateModel != null && country != null) {
      emit(state.copyWith(isSubmitting: false,showInputError: false));
      Fluttertoast.showToast(msg: 'Form submitted successfully', backgroundColor: AppColors.greenColor, textColor: Colors.white, gravity: ToastGravity.BOTTOM);
    } else {
      emit(state.copyWith(isSubmitting: false,showInputError: true));
            Fluttertoast.showToast(msg: 'Form submission faield', backgroundColor: AppColors.redColor, textColor: Colors.white, gravity: ToastGravity.BOTTOM);

    }


    
  }  

}