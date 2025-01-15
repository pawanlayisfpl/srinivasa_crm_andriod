import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/shared/domain/model/City/city_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/District/district_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Locality/locality_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/StateModel/state_model.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Address/address_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Divisions/divison_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Primary%20Source/primary_source_repo.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Full%20Details/screen/customer_full_details_screen.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/customer_full_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/update_customer_state.dart';
import '../../../../../../../shared/domain/model/Country/country_model.dart';
import '../../../../../../../shared/domain/model/Division/division_model.dart';
import '../../../../../../../shared/domain/model/Primary Source/primary_source_model.dart';

@injectable
class UpdateCustomerCubit extends Cubit<UpdateCustomerState> {
  final AddressRepo addressRepo;
  final PrimarySourceRepo primarySourceRepo;
  final DivisionRepo divisionRepo;
  final CustomerRepo customerRepo;
  
  UpdateCustomerCubit({
    required this.addressRepo,
    required this.primarySourceRepo,
    required this.divisionRepo,
    required this.customerRepo,
  }) : super(UpdateCustomerState.initial());


  final TextEditingController farmNameController  = TextEditingController();
  final TextEditingController customerNameController  = TextEditingController();
  final TextEditingController customerPhoneController  = TextEditingController();
  final TextEditingController titleController  = TextEditingController();
  final TextEditingController emailController  = TextEditingController();
  final TextEditingController addressLine2Controller  = TextEditingController();
  final TextEditingController creditLimitController  = TextEditingController();
  final TextEditingController mandalController  = TextEditingController();
  final TextEditingController postalCodeController  = TextEditingController();
  final TextEditingController addressController  = TextEditingController();
  final TextEditingController faxNoController  = TextEditingController();
  final TextEditingController mobileController  = TextEditingController();
  final TextEditingController alternativeMobileController  = TextEditingController();
  final TextEditingController farmCapacityController  = TextEditingController();


  void onChangeFarm(String? value) {
    farmNameController.text = value ?? "";
  }


  void onChangeMandal(String? value) {
    mandalController.text = value ?? "";
  }

  void onChangePostalCode(String? value) {
    postalCodeController.text = value ?? "";
  }

  void onChangeAddress(String? value) {
    addressController.text = value ?? "";
  }

  void onChangeFaxNo(String? value) {
    faxNoController.text = value ?? "";
  }

  void onChangeMobile(String? value) {
    mobileController.text = value ?? "";
  }

  void onChangeAlternativeMobile(String? value) {
    alternativeMobileController.text = value ?? "";
  }

  void onChangeFarmCapacity(String? value) {
    farmCapacityController.text = value ?? "";
  }

  void onChangeCustomerName(String? value) {
    customerNameController.text = value ?? "";
  }

  void onChangeCustomerPhone(String? value) {
    customerPhoneController.text = value ?? "";
  }

  void onChangeTitle(String? value) {
    titleController.text = value ?? "";
  }

  void onChangeEmail(String? value) {
    emailController.text = value ?? "";
  }

  void onChangeAddressLine2(String? value) {
    addressLine2Controller.text = value ?? "";
  }

  void onChangeCreditLimit(String? value) {
    creditLimitController.text = value ?? "";
  }
  // State Data Lists and Models
  List<StateModel> _statesList = [];
  List<StateModel> get statesList => _statesList;

  StateModel? _selectedStateModel;
  StateModel? get selectedStateModel => _selectedStateModel;

  Future<void> setSelectedStateModel(StateModel? stateModel) async {

    if(stateModel == null)  Fluttertoast.showToast(msg: 'No state found');
    // state.sel = stateModel;
    emit(state.copyWith(selectedStateModel: stateModel));
    log(stateModel!.stateId.toString());
      if(stateModel.stateId.isNotEmpty) {
               await getAllDistricts();
  await    getAllCities();
    
      }
  }

  Future<void> getTitles() async {
    await Future.delayed(const Duration(milliseconds: 800));
    emit(state.copyWith(titleList: [
           'Mr',
      'Mrs',
    ]));
  }

  void setTitleModel(String value) {
    emit(state.copyWith(selectedTitleValue: value));
  }

  void resetTitleValue() {
    emit(state.copyWith(selectedTitleValue: null));
  }

  void resetSelectedStateModel() {
    emit(state.copyWith(selectedStateModel: null));
  }

  Future<void> getInitData(String farmid,BuildContext context) async {
    
    final results = await customerRepo.getCustomerDetailsByFarmId(farmid: farmid);

    results.fold((l) {
      ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);
      if(context.mounted) {
        QuickAlert.show(context: context, type: QuickAlertType.error,title: apiFailedModel.errorMessage,text: apiFailedModel.message);
      }
    }, (r)  async {
      CustomerFullDetailsResponseModel? model = r;

      if(model == null) return;
      log('priting customer full details model');
      log(model.toJson().toString());

  // final TextEditingController creditLimitController  = TextEditingController();
  // final TextEditingController mandalController  = TextEditingController();
  // final TextEditingController postalCodeController  = TextEditingController();
  // final TextEditingController addressController  = TextEditingController();
  // final TextEditingController faxNoController  = TextEditingController();
  // final TextEditingController mobileController  = TextEditingController();
  // final TextEditingController alternativeMobileController  = TextEditingController();
  // final TextEditingController farmCapacityController  = TextEditingController();

      emit(state.copyWith(customerFullDetailsresposneModel: model,isIndividual: model.body?.isIndividual ?? false));
      farmNameController.text = model.body?.farmName?? "";
      customerNameController.text  = model.body?.customerName ?? "";
      customerPhoneController.text = model.body?.customerPhone ?? "";
      titleController.text = model.body?.title ?? "";
      emailController.text == model.body?.email;
      addressController.text = model.body?.address ?? "";
      creditLimitController.text = model.body?.creditLimit.toString() ?? '';
      mandalController.text = model.body?.mandal ?? "";
      postalCodeController.text  = model.body?.pincode ?? "";
      faxNoController.text = "";
      addressLine2Controller.text = model.body?.addressLine2 ?? "";
      mobileController.text = model.body?.phone ?? "";
      alternativeMobileController.text = model.body?.additionalPhone ?? "";
      farmCapacityController.text = model.body?.farmCapacity.toString() ?? "";
      await getAllCountries();
      await getTitles();
      setTitleModel(model.body?.title ?? "");
      
  await    setSelectedCountryModel(CountryModel(countryId: 79, countryName: model.body?.custCountry ?? "India"));
     await  setSelectedStateModel(StateModel(stateId: model.body!.state!.stateId!, stateName: model.body!.state!.stateName!, stateCode: model.body!.state!.stateName!));
      setDistrictModel(DistrictModel(
        districtId: model.body?.district?.districtId,
        districtName: model.body?.district?.districtName
      ));

   await   setCityModel(CityModel(
    cityId: model.body?.custCity?.cityId,
    cityName: model.body?.custCity?.cityName
   ));

   setLocalityModel(LocalityModel(
    localaityName: model.body?.locality?.localityName,
    localityId: model.body?.locality?.localityId
   ));

  

      



    });
  }

  Future<void> getAllDivisionList() async {
    emit(state.copyWith(divisionList: [],selectedDivisionList: []));
    final results = await divisionRepo.getDivisions();

    results.fold((l) {
      emit(state.copyWith(divisionList: [],selectedDivisionList: []));
    }, (r) {
       emit(state.copyWith(divisionList: r,selectedDivisionList: []));
    });
  }

  void setSelectedDivisionsList(List<DivisionModel> list) async {
    emit(state.copyWith(selectedDivisionList: list));
  }

  void resetDivisionList() {
    emit(state.copyWith(selectedDivisionList: []));
  }
  // TODO: ADD PRIMARY SORUCES AND DIVSION DROPDOWN IN UI,
  // TODO: CREATE SELECTED AND RESET PRIMARYSOURCES AND ADD INTO INIT DATA
  Future<void> getAllPrimarySources() async {
    emit(state.copyWith(isPrimarySourceLoading: true, primarySoruceList: [],selectedPrimarySourceModel: null));
    final results = await primarySourceRepo.getPrimarySources();


  }

  void resetCountires() async {
    emit(state.copyWith(countryModel: null,statesList: [],selectedStateModel: null,citiesList: [],selectedCityModel: null,districtList: [],selectedDistrictModel: null,localitiesList: [],selectedLocalityModel: null,));
  }


  void resetStates() {
        emit(state.copyWith(selectedStateModel: null,citiesList: [],selectedCityModel: null,districtList: [],selectedDistrictModel: null,localitiesList: [],selectedLocalityModel: null,));
        // mandalController.clear();
  }


  void resetDistricts() {
    emit(state.copyWith(selectedDistrictModel:  null));
    // mandalController.clear();
  }

  void resetCities() {
    emit(state.copyWith(selectedCityModel: null,localitiesList: [],selectedLocalityModel: null));
  }



  Future<void> getAllInitialvalues() async {

  }

  Future<void> getAllCountries() async {
    emit(state.copyWith(isCountryLoading:  true,countriesList: [],countryModel: null));

    await Future.delayed(const Duration(milliseconds: 800));
    final results = await addressRepo.getCountries();
    results.fold((l) {
      emit(state.copyWith(isCountryLoading: false,countriesList: [],countryModel: null));
    }, (r) {
      emit(state.copyWith(isCountryLoading: false,countriesList: r,countryModel: null));
      
    });
  }


  Future<void> setSelectedCountryModel(CountryModel? countrymodel) async {
    emit(state.copyWith(countryModel: countrymodel));
  await  getStates();
  }


  Future<void> getAllStates() async {
          emit(state.copyWith(isStateLoading:true,statesList: [],selectedStateModel: null,selectedCityModel: null,citiesList: [],selectedDistrictModel: null,districtList: []));
          await Future.delayed(const Duration(milliseconds: 800));

    final results = await addressRepo.getStateByCountry(countryId: state.countryModel?.countryId.toString() ?? "-1");
    results.fold((l) {
      emit(state.copyWith(isStateLoading: false,statesList: [],selectedStateModel: null,selectedCityModel: null,citiesList: [],selectedDistrictModel: null,districtList: []));
      // mandalController.clear();
    }, (r) {
      emit(state.copyWith(isStateLoading:false,statesList: r,selectedStateModel: null,selectedCityModel: null,citiesList: [],selectedDistrictModel: null,districtList: []));
        // mandalController.clear();
    });
  }

  Future<void> getAllCities() async {
    emit(state.copyWith(citiesList: [],selectedCityModel: null,isCityLoading: true,localitiesList: [],selectedLocalityModel: null,isLocalictyLoading: false));
    await Future.delayed(const Duration(milliseconds: 800));
    final results = await addressRepo.getCityByStateId(statemodel: state.selectedStateModel!);
    results.fold((l) {
      emit(state.copyWith(citiesList: [],isCityLoading: false,selectedCityModel: null,localitiesList: [],selectedLocalityModel: null,isLocalictyLoading: false));
    }, (r) {
       emit(state.copyWith(citiesList: r,isCityLoading: false,selectedCityModel: null,localitiesList: [],selectedLocalityModel: null,isLocalictyLoading: false));
    });
  }

  Future<void> getAllDistricts() async {
    emit(state.copyWith(isDistrictLoading:  true,districtList: []));
    await Future.delayed(const Duration(milliseconds: 800));
    final results = await addressRepo.getDistrictByState(stateId: state.selectedStateModel!.stateId);
    results.fold((l) {
      emit(state.copyWith(isDistrictLoading: false,districtList: [],selectedDistrictModel: null));
    }, (r) {
      emit(state.copyWith(isDistrictLoading: false,districtList: r,selectedDivisionList: []));
    });

  }

  void setSelectedDistrictModel(DistrictModel? model) {
    emit(state.copyWith(selectedDistrictModel: model));
      
  }

  Future<void> getAllLocalities() async {
    emit(state.copyWith(isLocalictyLoading: true,localitiesList: [],selectedLocalityModel: null));
    await Future.delayed(const Duration(milliseconds: 800));
    final results = await addressRepo.getLocalityByCityId(cityModel: state.selectedCityModel!);
    results.fold((l) {
      emit(state.copyWith(isLocalictyLoading: false,selectedLocalityModel: null,localitiesList: []));
    }, (r) {
      emit(state.copyWith(isLocalictyLoading: false,selectedLocalityModel: null,localitiesList: r));
    });
  }


  List<String> _customerTypesList = [
    "Inidividual",
    "Organization"
  ];
  List<String> get customerTypesList => _customerTypesList;

  String? _selectedCustomerType;
  String? get selectedCustomerType => _selectedCustomerType;

  void setCustomerType(String? value) {
    _selectedCustomerType = value;
  }

  void resetCustomerType() {
    _selectedCustomerType = null;
  }

 
  void setPrimarySourceModel(PrimarySourceModel primarySourceModel) {
    emit(state.copyWith(selectedPrimarySourceModel: primarySourceModel));
  }

  void resetPrimarySourceModel() {
    emit(state.copyWith(selectedPrimarySourceModel: null));
  }

  List<DistrictModel> _districtList = [];
  List<DistrictModel> get districtList => _districtList;

  DistrictModel? _selectedDistrictModel;
  DistrictModel? get selectedDistrictModel => _selectedDistrictModel;

  void setDistrictModel(DistrictModel? districtModel) {
    emit(state.copyWith(selectedDistrictModel:  districtModel));
    // mandalController.clear();
  }

  void resetDistrictModel() {
    emit(state.copyWith(selectedDistrictModel:  null));
    // mandalController.clear();
  }

  List<CityModel> _cityList = [];
  List<CityModel> get cityList => _cityList;

  CityModel? _selectedCityModel;
  CityModel? get selectedCityModel => _selectedCityModel;

  Future<void> setCityModel(CityModel? cityModel) async {
    _selectedCityModel = cityModel;
    emit(state.copyWith(selectedCityModel: cityModel,));
    await Future.delayed(const Duration(milliseconds: 800),() async {
      await getAllLocalities();
    });

  }

  void resetCityModel() {
    _selectedCityModel = null;
  }

 
  void setLocalityModel(LocalityModel? localityModel) {
    emit(state.copyWith(selectedLocalityModel: localityModel));

  }

  void resetLocalityModel() {
    emit(state.copyWith(selectedLocalityModel: null));
  }

 
  // Fetch States
  Future<void> getStates() async {
    emit(state.copyWith(isStateLoading: true,selectedStateModel: null,statesList: []));
    // mandalController.clear();
  await Future.delayed(const Duration(milliseconds: 800));
    final results = await addressRepo.getStateByCountry(countryId: "79");
    results.fold((l) {
       emit(state.copyWith(statesList: [],isStateLoading: false,selectedStateModel: null));
      final errorMessage = ApiFailedModel.fromNetworkExceptions(l).message;
      Fluttertoast.showToast(
        msg: errorMessage,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }, (r) {
        emit(state.copyWith(statesList: r,isStateLoading: false,selectedStateModel: null));
    });

  }

  // Fetch Districts by State ID
  Future<void> getDistrictsByStateId() async {
    emit(state.copyWith(isLoading: true));

    final stateId = _selectedStateModel?.stateId?.toString() ?? "1";
    final results = await addressRepo.getDistrictByState(stateId: stateId);
    results.fold((l) {
      final errorMessage = ApiFailedModel.fromNetworkExceptions(l).message;
      Fluttertoast.showToast(
        msg: errorMessage,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }, (r) {
      _districtList = r;
    });

    emit(state.copyWith(isLoading: false));
  }

  // Fetch Cities by State ID
  Future<void> getCitiesByStateId() async {
    emit(state.copyWith(isCityLoading: true));

    final results = await addressRepo.getCityByStateId(statemodel: _selectedStateModel!);
    results.fold((l) {
      final errorMessage = ApiFailedModel.fromNetworkExceptions(l).message;
      Fluttertoast.showToast(
        msg: errorMessage,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
       emit(state.copyWith(citiesList: [],isCityLoading: false,selectedCityModel: null));
    }, (r) {
    
      emit(state.copyWith(citiesList: r,isCityLoading: false,selectedCityModel: null));
    });

    emit(state.copyWith(isLoading: false));
  }

  // Fetch Localities by City ID
  Future<void> getLocalitiesByCityId() async {
    emit(state.copyWith(isLoading: true));

    final results = await addressRepo.getLocalityByCityId(cityModel: _selectedCityModel!);
    results.fold((l) {
      final errorMessage = ApiFailedModel.fromNetworkExceptions(l).message;
      Fluttertoast.showToast(
        msg: errorMessage,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }, (r) {
     emit(state.copyWith(localitiesList: r,selectedLocalityModel: null,isLocalictyLoading: false));

    });

    emit(state.copyWith(isLoading: false));
  }

  // Update Specific Customer Field
  void updateCustomerField(String key, dynamic value) {
    final updatedCustomer = state.copyWith(
      farmName: key == 'farmName' ? value : state.farmName,
      customerName: key == 'customerName' ? value : state.customerName,
      customerPhone: key == 'customerPhone' ? value : state.customerPhone,
      title: key == 'title' ? value : state.title,
      email: key == 'email' ? value : state.email,
      customerType: key == 'customerType' ? value : state.customerType,
      addressLine2: key == 'addressLine2' ? value : state.addressLine2,
      creditLimit: key == 'creditLimit' ? value : state.creditLimit,
      primarySourceId: key == 'primarySourceId' ? value : state.primarySourceId,
      zoneId: key == 'zoneId' ? value : state.zoneId,
      kycStatus: key == 'kycStatus' ? value : state.kycStatus,
      countryId: key == 'countryId' ? value : state.countryId,
      stateId: key == 'stateId' ? value : state.stateId,
      districtId: key == 'districtId' ? value : state.districtId,
      cityId: key == 'cityId' ? value : state.cityId,
      localityId: key == 'localityId' ? value : state.localityId,
      mandal: key == 'mandal' ? value : state.mandal,
      postalCode: key == 'postalCode' ? value : state.postalCode,
      address: key == 'address' ? value : state.address,
      isIndividual: key == 'isIndividual' ? value : state.isIndividual,
      isOrganization: key == 'isOrganization' ? value : state.isOrganization,
      contactPerson: key == 'contactPerson' ? value : state.contactPerson,
      mobile: key == 'mobile' ? value : state.mobile,
      alternateContact: key == 'alternateContact' ? value : state.alternateContact,
      farmCapacity: key == 'farmCapacity' ? value : state.farmCapacity,
      faxNo: key == 'faxNo' ? value : state.faxNo,
      divisionId: key == 'divisionId' ? value : state.divisionId,
      assignTo: key == 'assignTo' ? value : state.assignTo,
    );

    emit(updatedCustomer);
  }

    // Method to clear all TextEditingControllers
  void clearAllControllers() {
    farmNameController.clear();
    customerNameController.clear();
    customerPhoneController.clear();
    titleController.clear();
    emailController.clear();
    addressLine2Controller.clear();
    creditLimitController.clear();
    mandalController.clear();
    postalCodeController.clear();
    addressController.clear();
    faxNoController.clear();
    mobileController.clear();
    alternativeMobileController.clear();
    farmCapacityController.clear();
  }


   // Dispose method to release resources held by TextEditingControllers
  @override
  Future<void> close() {
    farmNameController.dispose();
    customerNameController.dispose();
    customerPhoneController.dispose();
    titleController.dispose();
    emailController.dispose();
    addressLine2Controller.dispose();
    creditLimitController.dispose();
    mandalController.dispose();
    postalCodeController.dispose();
    addressController.dispose();
    faxNoController.dispose();
    mobileController.dispose();
    alternativeMobileController.dispose();
    farmCapacityController.dispose();

    return super.close();
  }
}
