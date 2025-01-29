// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';

import 'package:srinivasa_crm_new/shared/domain/model/City/city_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/District/district_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_reporting_manager_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Locality/locality_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/StateModel/state_model.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Address/address_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Divisions/divison_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Employe/employe_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Primary%20Source/primary_source_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Zone/zone_repo.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/customer_full_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/update_customer_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/update_customer_state.dart';

import '../../../../../../../shared/domain/model/Country/country_model.dart';
import '../../../../../../../shared/domain/model/Division/division_model.dart';
import '../../../../../../../shared/domain/model/Primary Source/primary_source_model.dart';
import '../../../../../../../shared/domain/model/zone_model.dart';

@injectable
class UpdateCustomerCubit extends Cubit<UpdateCustomerState> {
  final AddressRepo addressRepo;
  final PrimarySourceRepo primarySourceRepo;
  final DivisionRepo divisionRepo;
  final CustomerRepo customerRepo;
  final ZoneRepo zoneRepo;
  final EmployeRepo employeRepo;
  
  UpdateCustomerCubit({
    required this.addressRepo,
    required this.primarySourceRepo,
    required this.divisionRepo,
    required this.customerRepo,
    required this.zoneRepo,
    required this.employeRepo,
  }) : super(UpdateCustomerState.initial());


  final TextEditingController farmNameController  = TextEditingController();
  final TextEditingController customerNameController  = TextEditingController();
  final TextEditingController customerPhoneController  = TextEditingController();
  final TextEditingController contactNameController  = TextEditingController();
  final TextEditingController contactPhoneController  = TextEditingController();
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


  List<String> customerTypes = [
    'Organization',
    "Individual"
  ];

  String? selectedCustomerType;



  void setSelectedCustomerType(String? type) {
    selectedCustomerType = type;


  }


  void resetCustomerType() {
    selectedCustomerType = null;
  }

  void onChangeFarm(String? value) {
    farmCapacityController.text = value ?? "";
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
  void onChangeContactName(String? value) {
    contactNameController.text = value ?? "";
  }
  void onChangeContactPhone(String? value) {
    contactPhoneController.text = value ?? "";
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
    // log(stateModel!.stateId.toString());
      if(state.selectedStateModel != null) {
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

      if(model.body?.custStatus?.toString() == "APPROVED" ) {
        emit(state.copyWith(customerFullDetailsresposneModel: null));
        if(context.mounted) {
          QuickAlert.show(context: context, type: QuickAlertType.error,title: "Warning",text: "You can't update values of the customer as KYC is already approved.",barrierDismissible: false,confirmBtnColor: Colors.black, disableBackBtn: true, onConfirmBtnTap: ( ) {
            if(context.mounted) {
              Navigator.pop(context);
              if(context.mounted) {
                Navigator.pop(context);
              }
            }
          });
        }
      }
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
      contactNameController.text = model.body?.contactPerson ?? "";
      contactPhoneController.text = model.body?.phone ?? "";
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
      farmCapacityController.text = model.body?.farmCapacity.toString().split(".").first ?? 0.0.toString();
      await getAllCountries();
      
      await getTitles();
      setTitleModel(model.body?.title ?? "");
     await setSelectedCountryModel(CountryModel(countryId: 79.toString(), countryName: 'India'));

      if(state.countryModel != null) {
     await  setSelectedStateModel(StateModel(stateId: model.body!.state!.stateId!, stateName: model.body!.state!.stateName!, stateCode: model.body!.state!.stateName!));


      }

      if(state.selectedStateModel != null) {
          setDistrictModel(DistrictModel(
        districtId: model.body?.district?.districtId,
        districtName: model.body?.district?.districtName
      ));

   await   setCityModel(CityModel(
    cityId: model.body?.custCity?.cityId,
    cityName: model.body?.custCity?.cityName
   ));

   await getAllDivisionList();

   if(state.divisionList.isNotEmpty) {
    // setSelectedDivisionsList(model.body?.)
   }

   

      }
      
  // await    setSelectedCountryModel(CountryModel(countryId: model.body?.custCountry?.id?? "79", countryName: model.body?.custCountry?.name ?? "India"));
    

   setLocalityModel(LocalityModel(
    localaityName: model.body?.locality?.localityName,
    localityId: model.body?.locality?.localityId
   ));

   await getAllEmployes();


   await getAllZones();
 await  setSelectedZone(ZoneModel(
    zoneId: model.body?.zoneModel?.zoneId,
    zoneName: model.body?.zoneModel?.zoneName
   ));

   await getAllPrimarySources();

   if(state.selectedPrimarySourceModel != null) {
    setPrimarySource(PrimarySourceModel(sourceId: model.body?.primarySource?.primarySourceId ?? 1, sourceName: model.body?.primarySource?.primarySourceName ?? ""));
   }
 
  //  setSelectedZone(ZoneModel(
  //   zoneId: model.body?.custZone,

  //  ));

  

      



    });
  }

  Future<void> getAllZones() async {
    emit(state.copyWith(isZoneLoading: false, zonesList: [],selectedZoneModel: null));
    final results = await zoneRepo.getAllZones();
    results.fold((l) {
      emit(state.copyWith(zonesList: [],selectedZoneModel: null,isZoneLoading: false));
    }, (r) async {
      emit(state.copyWith(zonesList: r,selectedZoneModel: null,isZoneLoading: false));

    });
  }

  Future<void>  setSelectedZone(ZoneModel model)  async {
    emit(state.copyWith(selectedZoneModel: model));
    if(state.selectedZoneModel != null) {
    await  getEmployeRepMangersList();
    }
  }

  void resetSelectedZone() {
    emit(state.copyWith(selectedZoneModel: null));
  }



  Future<void> getAllEmployes() async {
    emit(state.copyWith(employeList: [],isEmployeLoading: true,selectedEmployeModel: null));
    await Future.delayed(const Duration(milliseconds: 600));
    final results = await employeRepo.getEmployeesList();
    results.fold((l) {
          emit(state.copyWith(employeList: [],isEmployeLoading: false,selectedEmployeModel: null));


      
    }, (r) {
          emit(state.copyWith(employeList: r,isEmployeLoading: false,selectedEmployeModel: null));

    });
  }


  void setSelectedEmploye(EmployeRepModel employeModel) {
    emit(state.copyWith(selectedRepModel: employeModel));
  }

  void resetSelectedEmploye() {
    emit(state.copyWith(selectedRepModel:  null));
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

    results.fold((l) {

      ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);
            emit(state.copyWith(isPrimarySourceLoading: false, primarySoruceList: [],selectedPrimarySourceModel: null));


    }, (r) {
          emit(state.copyWith(isPrimarySourceLoading: false, primarySoruceList: r,selectedPrimarySourceModel: null));


    });


  }


  void setPrimarySource(PrimarySourceModel primarySourceModel) {
    emit(state.copyWith(selectedPrimarySourceModel: primarySourceModel));
  } 


  void resetPrimarySourceModel() {
    emit(state.copyWith(selectedPrimarySourceModel: null));
  }

  Future<void> getEmployeRepMangersList() async {
    emit(state.copyWith(isEmployeRepLoading: false,repMangerList: [],selectedRepModel: null));

    final results = await employeRepo.getEmployeReportingMange(state.selectedZoneModel?.zoneId?? '');

     results.fold((l) { 
      emit(state.copyWith(isEmployeLoading: false,repMangerList: [],selectedRepModel: null));
     }, (r) {
      emit(state.copyWith(isEmployeRepLoading: false,repMangerList: r?.body ?? [],selectedRepModel: null));
    });
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
  // await  getStates();
  await getAllStates();
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

  Future<void> updateCustomerLogic(BuildContext context) async {
    emit(state.copyWith(isLoading: true));

    if(context.mounted) {
      QuickAlert.show(context: context, type: QuickAlertType.loading,title: "Customer Updating",text: 'please wait while updating',disableBackBtn: true,barrierDismissible: false);
    }

    

    UpdateCustomerPostModel updateCustomerPostModel = UpdateCustomerPostModel(
      address: addressController.text.trim().isEmpty  ? state.customerFullDetailsresposneModel?.body?.address  :  addressController.text.trim(),
      addressLine2: addressLine2Controller.text.trim().isEmpty ? state.customerFullDetailsresposneModel?.body?.addressLine2 ?? "" : addressLine2Controller.text.trim(),
      alternateContact: alternativeMobileController.text.trim().isNotEmpty ? alternativeMobileController.text.trim() : state.customerFullDetailsresposneModel?.body?.additionalPhone,
      cityId: state.selectedCityModel == null ? state.customerFullDetailsresposneModel?.body?.custCity?.cityId : state.selectedCityModel?.cityId,
      contactPerson: contactNameController.text.trim().isEmpty ? state.customerFullDetailsresposneModel?.body?.contactPerson : contactNameController.text.trim(),
      countryId: 79,
      
      creditLimit: creditLimitController.text.trim().isNotEmpty ? creditLimitController.text.trim() : state.customerFullDetailsresposneModel?.body?.creditLimit?.toString(),
      customerId: state.customerFullDetailsresposneModel?.body?.customerId,
      customerName: customerNameController.text.trim().isNotEmpty ? customerNameController.text.trim() : state.customerFullDetailsresposneModel?.body?.customerName,
      customerPhone: customerPhoneController.text.trim().isNotEmpty ? customerPhoneController.text.trim() : state.customerFullDetailsresposneModel?.body?.customerPhone,
      customerType: state.customerFullDetailsresposneModel?.body?.customerType,
      districtId: state.selectedDistrictModel != null ? state.selectedDistrictModel?.districtId : state.customerFullDetailsresposneModel?.body?.district?.districtId,
      email: emailController.text.trim().isNotEmpty ? emailController.text.trim() : state.customerFullDetailsresposneModel?.body?.email,
      farmCapacity: farmCapacityController.text.trim().isNotEmpty ? farmCapacityController.text.toString() : state.customerFullDetailsresposneModel?.body?.farmCapacity.toString(),
      farmId: state.customerFullDetailsresposneModel?.body?.farmId,
      farmName: farmNameController.text.trim().isNotEmpty ? farmNameController.text.trim() : state.customerFullDetailsresposneModel?.body?.farmName,
      faxNo: faxNoController.text.trim(),
      // divisionId: state.selectedDivisionList.isNotEmpty ? state.selectedDivisionList.map((e) => e.divisionId).toList() : state.customerFullDetailsresposneModel?.body?.
      mobile: contactPhoneController.text.trim().isNotEmpty ? contactPhoneController.text.trim() : state.customerFullDetailsresposneModel?.body?.phone,
      mandal: mandalController.text.trim().isNotEmpty ? mandalController.text.trim() : state.customerFullDetailsresposneModel?.body?.mandal,
      title: state.selectedTitleValue ?? state.customerFullDetailsresposneModel?.body?.title,
      primarySourceId: state.selectedPrimarySourceModel != null ? state.selectedPrimarySourceModel?.sourceId : state.customerFullDetailsresposneModel?.body?.primarySource?.primarySourceId,
    
      kycstatus: state.customerFullDetailsresposneModel?.body?.custStatus,
      stateId: state.selectedStateModel != null ? state.selectedStateModel?.stateId : state.customerFullDetailsresposneModel?.body?.state?.stateId,
      zoneId: state.selectedZoneModel?.zoneId,
      postalCode: postalCodeController.text.trim().isNotEmpty ? postalCodeController.text.trim() : state.customerFullDetailsresposneModel?.body?.pincode,
      // divisionId: state.selectedDivisionList.isEmpty ? state.selectedDivisionList.map((e) => e.divisionId).toList() : [],
      assignTo: state.selectedRepModel != null ? state.selectedRepModel?.id : state.customerFullDetailsresposneModel?.body?.assignTo?.userId,
      localityId: state.selectedLocalityModel != null ? state.selectedLocalityModel?.localityId : state.customerFullDetailsresposneModel?.body?.locality?.localityId,

        isIndividual: state.customerFullDetailsresposneModel?.body?.isIndividual,
        isOrganization: state.customerFullDetailsresposneModel?.body?.isOrganization,
      // primarySourceId: state.customerFullDetailsresposneModel?.body?.primarySource,
      


    );

    await Future.delayed(const Duration(milliseconds: 900));
        log(updateCustomerPostModel.toJson().toString());



    final results  = await customerRepo.updateCustomer(updateCustomerPostModel: updateCustomerPostModel);

    results.fold((l)  async {

    if(context.mounted) {
      if(Navigator.canPop(context)) {
        Navigator.pop(context);
        if(context.mounted) {
                   QuickAlert.show(context: context, type: QuickAlertType.error,title: "Failed to update customer",text: ApiFailedModel.fromNetworkExceptions(l).message);

        }
      }
    }
      
    }, (r)  async {
      
    if(context.mounted) {
      if(Navigator.canPop(context)) {
        Navigator.pop(context);
        if(context.mounted) {
          if(Navigator.canPop(context)) {
            Navigator.pop(context);
            if(context.mounted) {
          await    context
          .read<UpdateCustomerCubit>()
          .getInitData(state.customerFullDetailsresposneModel?.body?.farmId.toString() ?? "-1", context);
          QuickAlert.show(context: context, type: QuickAlertType.success,title: "Updated Successfully");

            }
          }
        }
      }
    }

    });







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
    contactPhoneController.dispose();
    contactNameController.dispose();

    return super.close();
  }
}
