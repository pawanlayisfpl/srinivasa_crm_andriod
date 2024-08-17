// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import 'package:srinivasa_crm_new/shared/domain/model/Country/country_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/District/district_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Locality/locality_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Primary%20Source/primary_source_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/StateModel/state_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/zone_model.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Address/address_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Divisions/divison_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Primary%20Source/primary_source_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Zone/zone_repo.dart';
import 'package:srinivasa_crm_new/src/common/fields/string_field.dart';
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
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/customer_create_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/product_model.dart';

import '../../../../../../../shared/domain/model/City/city_model.dart';
import '../../../../../../../shared/domain/model/Employe/employe_model.dart';
import '../../../../../../../shared/shared.dart';
import '../../../../../../common/fields/number_field.dart';
import '../../../../domain/model/field/customer_create_addation_phone_field.dart';
import '../../../../domain/model/field/customer_create_contact_person_field.dart';
import '../../../../domain/model/field/customer_create_mobile_field.dart';
import '../../../../domain/model/field/customer_create_phone_field.dart';
import '../../../../domain/model/get/customer_code_model.dart';
import 'state/customer_create_state.dart';

@injectable
class CustomerCreateCubit extends Cubit<CustomerCreateState> {
  final PrimarySourceRepo primarySourceRepo;
  final AddressRepo addressRepo;
  final ZoneRepo zoneRepo;
  final CustomerRepo customerRepo;
  final DivisionRepo divisionRepo;

  CustomerCreateCubit({
    required this.primarySourceRepo,
    required this.addressRepo,
    required this.zoneRepo,
    required this.customerRepo,
    required this.divisionRepo,
  }) : super(CustomerCreateState.initial());

  // CONTROLLERS
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController contactPersonController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addationalPhoneController =
      TextEditingController();
  final TextEditingController creditLimitController = TextEditingController();
  final TextEditingController addressLineTwoController =
      TextEditingController();
  final TextEditingController mandalController = TextEditingController();
  final TextEditingController localityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController faxNumberController = TextEditingController();
  final TextEditingController farmCapacityController = TextEditingController();
  final TextEditingController farmNameController = TextEditingController();

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
    faxNumberController.clear();
    farmCapacityController.clear();
    farmNameController.clear();
  }

  // CHANGE NAME FIELD
  void changeCustomerName({required String customerName}) {
    emit(state.copyWith(
        customerCreateCustomerNameField:
            CustomerCreateCustomerNameField(customerName)));
  }

  // CHANGE FARM NAME FIELD
  void changeFarmName({required String farmName}) {
    emit(state.copyWith(farmNameField: StringField(farmName)));
  }

  // CHANGE CONTACT PERSON FIELD
  void changeContactPerson({required String contactPerson}) {
    emit(state.copyWith(
        customerCreateContactPersonField:
            CustomerCreateContactPersonField(contactPerson)));
  }

  // CHANGE PHONE FIELD
  void changePhone({required String phone}) {
    emit(state.copyWith(customerPhoneField: CustomerCreatePhoneField(phone)));
  }

  // CHANGE MANDAL FIELD
  void changeMandlField({required String value}) {
    emit(state.copyWith(
        customerCreateMandalField: CustomerCreateMandalField(value)));
  }

  // CHANGE CREDIT LIMIT
  void changeCreditLimit({required String value}) {
    emit(state.copyWith(
        customerCreateCreditLimitField: CustomerCreateCreditLimitField(value)));
  }

  void changeFaxNumber({required String value}) {
    emit(state.copyWith(faxNumberField: StringField(value)));
  }

  void changeFarmCapacity({required String value}) {
    emit(state.copyWith(farmCapacityField: NumberField(value)));
  }

  void getTitleLists() {
    emit(state.copyWith(titlesList: [
      'Mr',
      'Mrs',
    ]));
  }

  // SET TITLE value
  void setTitleValue({required String titleValue}) {
    emit(state.copyWith(selectedTitleValue: titleValue));
  }

  // CHANGE MOBILE FIELD
  void changeMobile({required String mobile}) {
    emit(
        state.copyWith(customerMobileField: CustomerCreateMobileField(mobile)));
  }

  // CHANGE EMAIL FIELD
  void changeEmail({required String email}) {
    emit(state.copyWith(
        customerCreateEmailField: CustomerCreateEmailField(email)));
  }

  // CHANGE ADDITIONAL PHONE FIELD
  void changeAddationalPhone({required String addationalPhone}) {
    emit(state.copyWith(
        customerCreateAddationField:
            CustomerCreateAddationalPhoneField(addationalPhone)));
  }

  // CHANGE ADDRESS LINE TWO FIELD
  void changeAddressLineTwo({required String addressLineTwo}) {
    emit(state.copyWith(
        customerCreateAddressLineTwoField:
            CustomerCreateAddressLineTwoField(addressLineTwo)));
  }

  // CHANGE MANDAL FIELD
  void changeMandal({required String mandal}) {
    emit(state.copyWith(
        customerCreateMandalField: CustomerCreateMandalField(mandal)));
  }

  // GET PRIMARY SOURCE LIST
  Future<void> getPrimarySourceLists() async {
    emit(state.copyWith(isLoading: true));
    final results = await primarySourceRepo.getPrimarySources();
    results.fold((l) {
      emit(state.copyWith(
          isLoading: false,
          apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
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
  Future<void> getDistrictList({required String stateId}) async {
    emit(state.copyWith(isLoading: true));
    final results = await addressRepo.getDistrictByState(stateId: stateId);
    results.fold((l) {
      emit(state.copyWith(
          isLoading: false,
          apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
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
      emit(state.copyWith(
          isLoading: false,
          apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
    }, (r) {
      List<StateModel> sortedStateList = List.from(r);
      sortedStateList.sort((a, b) =>
          a.stateName.toLowerCase().compareTo(b.stateName.toLowerCase()));
      emit(state.copyWith(stateList: sortedStateList, isLoading: false));
    });
  }

  // SET STATE VALUE
  void setStateValue({required StateModel stateModel}) async {
    emit(state.copyWith(selectedStateModel: stateModel));
    await Future.delayed(const Duration(milliseconds: 800));
    await getDistrictByState(stateId: stateModel.stateId.toString());
    await getAllCities(stateModel: stateModel);
  }

  void setAssignedValue({required AssignedToModel assignedModel}) {
    emit(state.copyWith(selectedAssignedModel: assignedModel));
  }

  void setApprovedCustomerCodeValue(
      {required CustomerCodeModel customerCodeModel}) {
    emit(state.copyWith(selectedCustomerCodeModel: customerCodeModel));
  }

  Future<void> getAssignedSRByZoneId({required ZoneModel zoneModel}) async {
    emit(state.copyWith(isLoading: true));
    final results = await customerRepo.getAssignedList(zoneModel: zoneModel);
    results.fold((l) {
      emit(state.copyWith(
          isLoading: false,
          apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),
          assignedList: []));
    }, (r) {
      List<AssignedToModel> sortedAssignedList = List.from(r);
      sortedAssignedList.sort((a, b) =>
          a.userName!.toLowerCase().compareTo(b.userName!.toLowerCase()));
      emit(state.copyWith(assignedList: sortedAssignedList, isLoading: false));
    });
  }

  // GET COUNTRY LIST
  Future<void> getCountryLists() async {
    await Future.delayed(const Duration(milliseconds: 800));
    emit(state.copyWith(
      isLoading: true,
      countryList: [CountryModel(countryId: 79, countryName: "India")],
    ));

    // emit(state.copyWith(isLoading: true));
    // final results = await addressRepo.getCountries();
    // results.fold((l) {
    //   emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
    // }, (r) {
    //   emit(state.copyWith(countryList: r, isLoading: false));
    // });
  }

  // SET COUNTRY VALUE
  void setCountryValue({required CountryModel countryModel}) async {
    emit(state.copyWith(selectedCountryModel: countryModel));
    await Future.delayed(const Duration(milliseconds: 800));
    if (state.selectedCountryModel != null &&
        state.selectedCountryModel!.countryId.toString() == '79') {
      await getStateLists(countryId: countryModel.countryId.toString());
    } else {}
  }

  // CHANGE CITY FIELD
  void changeCity({required String city}) {
    emit(
        state.copyWith(customerCreateCityField: CustomerCreateCityField(city)));
  }

  // CHANGE LOCALITY FIELD
  void changeLocality({required String locality}) {
    emit(state.copyWith(
        customerCreateLocalityField: CustomerCreateLocalityField(locality)));
  }

  // CHANGE PINCODE FIELD
  void changePincode({required String pincode}) {
    emit(state.copyWith(
        customerCreatePincodeField: CustomerCreatePincodeField(pincode)));
  }

  // CHANGE ADDRESS FIELD
  void changeAddress({required String address}) {
    emit(state.copyWith(
        customerCreateAddressField: CustomerCreateAddressField(address)));
  }

  //CLEAR ALL COUNTRIES
  void clearCountiresModel() {
    emit(state.copyWith(
        selectedCountryModel: null,
        selectedStateModel: null,
        stateList: [],
        districtList: [],
        selectedDistrictModel: null,
        cityList: [],
        selectedCityModel: null,
        localityList: [],
        selectedLocalityModel: null));
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
    emit(state.copyWith(
        selectedStateModel: null,
        districtList: [],
        selectedDistrictModel: null,
        cityList: [],
        selectedCityModel: null,
        localityList: [],
        selectedLocalityModel: null));
  }

// CLEAR DIVISION VALUE
  void clearDivisionValue() {
    emit(state.copyWith(selectedDistrictModel: null));
  }

  // CLEAR ASSIGNE VALUE
  void clearAssigneValue() {
    emit(state.copyWith(selectedAssignedModel: null));
  }

  // CLEAR APPROVED CUSTOMERS
  void clearApprovedCustomers() {
    emit(state.copyWith(selectedCustomerCodeModel: null));
  }

  // CLEAR ZONE VALUE
  void clearZoneValue() {
    emit(state.copyWith(
        selectedZoneModel: null,
        assignedList: [],
        selectedAssignedModel: null));
  }

  void clearAssignedModel() {
    emit(state.copyWith(selectedAssignedModel: null));
  }

  Future<void> getAllDivisions() async {
    emit(state.copyWith(
        isDivisionLoading: true, selectedDivisionsList: [], divisionsList: []));
    final results = await divisionRepo.getDivisions();
    results.fold(
        (l) => emit(state.copyWith(
            divisionsList: [],
            isDivisionLoading: false,
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))), (r) {
      List<DivisionModel> sortedDivisionList = List.from(r);
      sortedDivisionList.sort((a, b) =>
          a.divisionName.toLowerCase().compareTo(b.divisionName.toLowerCase()));
      emit(state.copyWith(
          apiFailedModel: null,
          divisionsList: sortedDivisionList,
          isDivisionLoading: false));
    });
  }

  void clearSelectedDivisionList() {
    emit(state.copyWith(selectedDivisionsList: []));
  }

  void clearSelectedDivisionModel() {
    emit(state.copyWith(selectedDivisionModel: null));
  }

  void setSelectedDivisionModel({required DivisionModel divisionModel}) {
    emit(state.copyWith(selectedDivisionModel: divisionModel));
  }

  void setSelectdDivisionsList(
      {required List<DivisionModel> divisionList}) async {
    emit(state.copyWith(selectedDivisionsList: divisionList));
  }

  void formSubmit() async {
    emit(state.copyWith(isSubmitting: true));
    await Future.delayed(const Duration(seconds: 1));
    final customerName =
        state.customerCreateCustomerNameField.value.getOrElse(() => "");
    final phone = state.customerPhoneField.value.getOrElse(() => '');
    final mobile = state.customerMobileField.value.getOrElse(() => '');
    final email = state.customerCreateEmailField.value.getOrElse(() => '');
    final contactPerson =
        state.customerCreateContactPersonField.value.getOrElse(() => "");
    // OPTIONAL
    final addationalPhone =
        state.customerCreateAddationField.value.getOrElse(() => '');
    final addressLineTwo =
        state.customerCreateAddressLineTwoField.value.getOrElse(() => '');
    final creditLimit =
        state.customerCreateCreditLimitField.value.getOrElse(() => "");
    // ------------------ OPTIONAL FIELDS ENDS HERE ----------
    final country = state.selectedCountryModel;
    final stateModel = state.selectedStateModel;
    final distirctModel = state.selectedDistrictModel;
    final mandal = state.customerCreateMandalField.value.getOrElse(() => '');
    final pincode = state.customerCreatePincodeField.value.getOrElse(() => '');
    final address = state.customerCreateAddressField.value.getOrElse(() => '');
    final title = state.selectedTitleValue;
    final primarySource = state.selectedPrimarySourceModel;
    final zone = state.selectedZoneModel;
    final customerType = state.selectedCustomerType;
    final assginedTo = state.selectedAssignedModel;
    final divisionModel = state.selectedDivisionModel;
    final farmName = state.farmNameField.value.getOrElse(() => "");

    final selectedCityValue = state.selectedCityModel;
    final selectedLocalityValue = state.selectedLocalityModel;

    final faxNumber = state.farmNameField.value.getOrElse(() => "");
    final farmCapacity = state.farmCapacityField.value.getOrElse(() => "");

    final bool isOrganization = state.isBusinessPartner;

    if (isOrganization) {
      if (state.selectedTitleValue != null &&
          customerName.isNotEmpty &&
          phone.isNotEmpty &&
          contactPerson.isNotEmpty &&
          mobile.isNotEmpty &&
          email.isNotEmpty &&
          customerType != null &&
          divisionModel != null &&
          zone != null &&
          mandal.isNotEmpty &&
          assginedTo != null &&
          primarySource != null &&
          country != null &&
          stateModel != null &&
          distirctModel != null &&
          mandal.isNotEmpty &&
          selectedCityValue != null &&
          selectedLocalityValue != null &&
          address.isNotEmpty &&
          addressLineTwo.isNotEmpty &&
          pincode.isNotEmpty &&
          farmCapacity.isNotEmpty) {
        CustomerCreatePostModel customerCreatePostModel =
            CustomerCreatePostModel(
                customerName: customerName,
                customerPhone: phone,
                title: state.selectedTitleValue!.toLowerCase().toString(),
                contactPerson: contactPerson,
                mobile: mobile,
                email: email,
                additionalPhone: addationalPhone,
                primarySourceId: primarySource.sourceId,
                zoneId: zone.zoneId!.toString(),
                customerType:
                    state.selectedCustomerType.toString() == "Commerical"
                        ? true
                        : false,
                creditLimit: double.tryParse(creditLimit) ?? 0.0,
                addressLine2: addressLineTwo,
                mandal: mandal,
                districtId: distirctModel.districtId.toString(),
                assignTo: assginedTo.id!,
                divisionId: [state.selectedDivisionModel!.divisionId],
                countryId: country.countryId,
                stateId: stateModel.stateId.toString(),
                cityId: selectedCityValue.cityId!,
                localityId: selectedLocalityValue.localityId!,
                address: address,
                pincode: pincode,
                isOrganization: true,
                customerCode: '',
                farmCapacity: double.tryParse(farmCapacity.toString()) ?? 0.0,
                faxNo: faxNumber.toString(),
                isIndividual: false);
        final results = await customerRepo.createCustomer(
            customerCreatePostModel: customerCreatePostModel);
        results.fold((l) {
          emit(state.copyWith(
              isSubmitting: false,
              apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
        }, (r) {
          emit(state.copyWith(isSubmitting: false, isSuccess: true));
        });
      } else {
        emit(state.copyWith(showInputError: true));

        Fluttertoast.showToast(msg: 'Please fill all the fields');
      }
    } else {
      // INDIVIDUAL

      if (state.selectedCustomerCodeModel != null &&
          state.selectedTitleValue != null &&
          contactPerson.isNotEmpty &&
          mobile.isNotEmpty &&
          email.isNotEmpty &&
          customerType != null &&
          divisionModel != null &&
          zone != null &&
          mandal.isNotEmpty &&
          assginedTo != null &&
          primarySource != null &&
          country != null &&
          stateModel != null &&
          distirctModel != null &&
          selectedCityValue != null &&
          selectedLocalityValue != null &&
          address.isNotEmpty &&
          addressLineTwo.isNotEmpty &&
          pincode.isNotEmpty &&
          farmCapacity.isNotEmpty) {
        CustomerCreatePostModel customerCreatePostModel =
            CustomerCreatePostModel(
          farmName: farmName,
          customerName: "",
          customerPhone: "",
          title: state.selectedTitleValue!.toLowerCase().toString(),
          contactPerson: contactPerson,
          mobile: mobile,
          email: email,
          additionalPhone: addationalPhone,
          primarySourceId: primarySource.sourceId,
          zoneId: zone.zoneId!.toString(),
          customerType: state.selectedCustomerType.toString() == "Commerical"
              ? true
              : false,
          creditLimit: double.tryParse(creditLimit) ?? 0.0,
          addressLine2: addressLineTwo,
          mandal: mandal,
          districtId: distirctModel.districtId.toString(),
          assignTo: assginedTo.id!,
          divisionId: [state.selectedDivisionModel!.divisionId],
          countryId: country.countryId,
          stateId: stateModel.stateId.toString(),
          cityId: selectedCityValue.cityId!,
          localityId: selectedLocalityValue.localityId!,
          address: address,
          pincode: pincode,
          isOrganization: false,
          customerCode:
              state.selectedCustomerCodeModel!.customerCode.toString(),
          farmCapacity: double.tryParse(farmCapacity.toString())?? 0.0 ,
          faxNo: faxNumber.toString(),
          isIndividual: true,
        );
        final results = await customerRepo.createCustomer(
            customerCreatePostModel: customerCreatePostModel);
        results.fold((l) {
          emit(state.copyWith(
              isSubmitting: false,
              apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
        }, (r) {
          emit(state.copyWith(isSubmitting: false, isSuccess: true));
        });
      } else {
        Fluttertoast.showToast(msg: 'Please fill all the fields');
        emit(state.copyWith(showInputError: true));
      }
    }
    emit(state.copyWith(isSubmitting: false));

//     if(state.selectedDivisionModel != null && title != null &&  customerName.isNotEmpty  && phone.isNotEmpty && contactPerson.isNotEmpty && mobile.isNotEmpty && email.isNotEmpty && customerType != null &&  zone != null && assginedTo != null && country != null && stateModel != null && distirctModel != null && mandal.isNotEmpty && selectedCityValue != null && selectedLocalityValue != null && address.isNotEmpty && pincode.isNotEmpty ) {
//       CustomerCreatePostModel createPostModel = CustomerCreatePostModel(customerName: customerName, customerPhone: phone, title: title.toLowerCase(), contactPerson: contactPerson, mobile: mobile, email: email, additionalPhone: addationalPhone, primarySourceId: primarySource!.sourceId.toString(), zoneId: zone.zoneId ?? "0", customerType: customerType.toString() == "Commercial" ? true : false , creditLimit: creditLimit.toString(), addressLine2: addressLineTwo, mandal: mandal, districtId: distirctModel.districtId ?? "0", assignTo: assginedTo.id.toString(), divisionId: divisionModle!.divisionId.toString(), countryId: country.countryId.toString(), stateId: stateModel.stateId, cityId: selectedCityValue.cityId.toString(), localityId: selectedLocalityValue.localityId.toString(), address: address, pincode: pincode);
//     log(createPostModel.toJson().toString());
//       await Future.delayed(const Duration(seconds: 2));
//      emit(state.copyWith(isSubmitting: false,isSuccess: false));
//      final results = await customerRepo.createCustomer(customerCreatePostModel: createPostModel);

// results.fold(
//   (l) => emit(state.copyWith(
//     isSubmitting: false,
//     showInputError: true,
//     apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),
//   )),
//   (r) => emit(state.copyWith(
//     isSubmitting: false,
//     isSuccess: true,
//     showInputError: false,
//     apiFailedModel: null,
//   )));
//     } else {
//       emit(state.copyWith(isSubmitting: false,showInputError: true));
//             Fluttertoast.showToast(msg: 'Form submission faield', backgroundColor: AppColors.redColor, textColor: Colors.white, gravity: ToastGravity.BOTTOM);

//     }
  }

  // GET ALL PRIMARY SOURCES LISTS
  Future<void> getPrimarySourceList() async {
    emit(state.copyWith(
        primarySourceList: [],
        selectedPrimarySourceModel: null,
        primarySourceLoading: true));
    final results = await primarySourceRepo.getPrimarySources();
    results.fold(
        (l) => emit(state.copyWith(
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),
            primarySourceLoading: false)), (r) {
      emit(state.copyWith(primarySourceList: r, primarySourceLoading: false));
    });
  }

//  GET ALL COUNTIRES LIST
  Future<void> getAllCountires() async {
    emit(state.copyWith(countryLoading: true));
    final resutls = await addressRepo.getCountries();
    resutls.fold(
        (l) => emit(state.copyWith(
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),
            countryLoading: false,
            countryList: [],
            stateList: [],
            districtList: [])),
        (r) => emit(state.copyWith(countryList: r, countryLoading: false)));
  }

  // GET ALL STATES LIST
  Future<void> getAllStates({required String countryId}) async {
    emit(state.copyWith(stateLoading: true, stateList: []));
    final results = await addressRepo.getStateByCountry(countryId: countryId);
    results.fold(
        (l) => emit(state.copyWith(
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),
            stateList: [],
            districtList: [],
            selectedStateModel: null,
            selectedDistrictModel: null)),
        (r) => emit(state.copyWith(stateList: r, stateLoading: false)));
  }

  // GET ALL DIVISION LIST
  Future<void> getDistrictByState({required String stateId}) async {
    emit(state.copyWith(
        districtList: [], districtLoading: true, selectedDistrictModel: null));
    await Future.delayed(const Duration(milliseconds: 800));
    final results = await addressRepo.getDistrictByState(stateId: stateId);
    results.fold(
        (l) => emit(state.copyWith(
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),
            districtLoading: false)), (r) {
      List<DistrictModel> sortedDistrictList = List.from(r);
      sortedDistrictList.sort((a, b) => a.districtName!
          .toLowerCase()
          .compareTo(b.districtName!.toLowerCase()));
      emit(state.copyWith(
          districtList: sortedDistrictList, districtLoading: false));
    });
  }

  //  GET ALL CITIES
  Future<void> getAllCities({required StateModel stateModel}) async {
    emit(state.copyWith(
        isCityLoading: true, cityList: [], selectedCityModel: null));
    final results = await addressRepo.getCityByStateId(statemodel: stateModel);
    results.fold(
        (l) => emit(state.copyWith(
            isCityLoading: false,
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
        (r) => emit(state.copyWith(cityList: r, isCityLoading: false)));
  }

  // SET CITY VALUE
  void setCityValue({required CityModel cityModel}) async {
    emit(state.copyWith(
        selectedCityModel: cityModel,
        localityList: [],
        selectedLocalityModel: null));
    await Future.delayed(const Duration(milliseconds: 800));
    await getAllLocalities(cityModel: cityModel);
  }

  void resetCityValue() {
    emit(state.copyWith(
        selectedCityModel: null,
        localityList: [],
        selectedLocalityModel: null));
  }

  // GET ALL LOCALITY
  Future<void> getAllLocalities({required CityModel cityModel}) async {
    emit(state.copyWith(
        isLocalityLoading: true,
        localityList: [],
        selectedLocalityModel: null));
    final results = await addressRepo.getLocalityByCityId(cityModel: cityModel);
    results.fold(
        (l) => emit(state.copyWith(
            isLocalityLoading: false,
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
        (r) => emit(state.copyWith(localityList: r, isLocalityLoading: false)));
  }

  // SET LOCALITY VALUE
  void setLocalityValue({required LocalityModel localityModel}) {
    emit(state.copyWith(selectedLocalityModel: localityModel));
  }

  void resetLocalityValue() {
    emit(state.copyWith(selectedLocalityModel: null));
  }

  //  GET ALL ZONE LIST
  Future<void> getAllZoneList() async {
    emit(state.copyWith(
        zoneLoading: true, zoneList: [], selectedZoneModel: null));
    final results = await zoneRepo.getAllZones();
    results.fold(
        (l) => emit(state.copyWith(
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),
            zoneLoading: false)), (r) {
      List<ZoneModel> sortedZoneList = List.from(r);
      sortedZoneList.sort((a, b) =>
          a.zoneName!.toLowerCase().compareTo(b.zoneName!.toLowerCase()));
      emit(state.copyWith(zoneList: sortedZoneList, zoneLoading: false));
    });
  }

  // GET ALL TITLES
  Future<void> getAllTitles() async {
    emit(state.copyWith(titlesList: ['Mr','Ms' ,'Mrs']));
  }

  // GET ALL CUSTOMER TYPES LIST
  Future<void> getAllCustomerTypes() async {
    emit(state.copyWith(customerTypeList: ['Commerical', 'Non-Commerical']));
  }

  void clearCustomerType() {
    emit(state.copyWith(selectedCustomerType: null));
  }

  Future<void> getAllCustomerCodesList() async {
    emit(state.copyWith(
        isCustomerCodeLoading: true,
        selectedCustomerCodeModel: null,
        customerCodeList: []));
    final results = await customerRepo.getApprovedCustomerList();
    results.fold(
        (l) => emit(state.copyWith(
            isCustomerCodeLoading: false,
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))), (r) {
      List<CustomerCodeModel> sortedCustomerCodeList = List.from(r);
      sortedCustomerCodeList.sort((a, b) =>
          a.customerName!.toLowerCase().compareTo(b.customerName!.toLowerCase()));
      emit(state.copyWith(
          customerCodeList: sortedCustomerCodeList,
          isCustomerCodeLoading: false));
    });
  }

  // GET ALL INITIAL VALUES
  Future<void> getAllInitialValues() async {
    // emit(CustomerCreateState.initial());
    emit(state.copyWith(showInputError: false));
    clearAllController();
    await getAllCustomerCodesList();

    await getAllTitles();
    await getAllCustomerTypes();
    await getPrimarySourceList();
    await getCountryLists();
    await getAllZoneList();
    await getAllDivisions();
  }

  void setBusinessPartnerBoolValue(bool value) {
    emit(state.copyWith(isBusinessPartner: value));
    log(value.toString());
  }

  void clearAllFields() {
    emit(CustomerCreateState.initial());
    clearAllController();
  }

  @override
  Future<void> close() {
    customerNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addationalPhoneController.dispose();
    creditLimitController.dispose();
    addressLineTwoController.dispose();
    mandalController.dispose();
    localityController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    cityController.dispose();
    faxNumberController.dispose();
    farmCapacityController.dispose();
    farmNameController.dispose();

    return super.close();
  }
}
