import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/domain/model/City/city_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/District/district_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Locality/locality_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/StateModel/state_model.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Address/address_repo.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Primary%20Source/primary_source_repo.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/update_customer_model.dart';

import '../../../../../../../shared/domain/model/Primary Source/primary_source_model.dart';

@injectable
class UpdateCustomerCubit extends Cubit<UpdateCustomerModel> {
  final AddressRepo addressRepo;
  final PrimarySourceRepo primarySourceRepo;

  UpdateCustomerCubit({
    required UpdateCustomerModel initialState,
    required this.addressRepo,
    required this.primarySourceRepo,
  }) : super(initialState);


  List<StateModel> _statesList  = [];
  List<StateModel> get statesList => _statesList;

  StateModel? _selectedStateModel;
  StateModel? get selectedStateModel => _selectedStateModel;

  void setSelectedStateModel(StateModel? stateModel) {
    _selectedStateModel = stateModel;
  }

  void resetSelectedStateModel() {
    _selectedStateModel  = null;
  }

  List<String> _customerTypesList = [];
  List<String> get customerTypeList => _customerTypesList;

  String? _selectedCustomeTypeModel;
  String? get selectedCustomerTypeModel => _selectedCustomeTypeModel;


  void setCustomerTypeModel(String? value) {
    _selectedCustomeTypeModel  = value;
  }

  void resetCustomerTypeModel() {
    _selectedCustomeTypeModel = null;
  }

  List<PrimarySourceModel> _primarySourceList = [];
  List<PrimarySourceModel> get primarySourceList => _primarySourceList;

  PrimarySourceModel? _selectedPrimarySourceModel;
  PrimarySourceModel? get selectedPrimarySourceModel => _selectedPrimarySourceModel;

  void setPrimarySourceModel(PrimarySourceModel primarySourceModel) {
    _selectedPrimarySourceModel = primarySourceModel;
  }

  resetPrimarySourceModel() {
    _selectedPrimarySourceModel = null;
  }


  List<DistrictModel> _districtList = [];
  List<DistrictModel> get districtList => _districtList;

  DistrictModel? _selectedDistrictModel;
  DistrictModel? get selectedDistrictModel => _selectedDistrictModel;

  void setDistrictModel(DistrictModel? districtModel) {
    _selectedDistrictModel = districtModel;

  }

  void resetDistrictModel() {
    _selectedDistrictModel =null;
  }

  List<CityModel> _cityList = [];
  List<CityModel> get cityList => _cityList;

  CityModel? _selectedCityModel;
  CityModel? get selectedCityModel => _selectedCityModel;

  void setCityModel(CityModel? cityModel) {
    _selectedCityModel = cityModel;
  }

  void resetCityModel() {
    _selectedCityModel = null;
  }



  List<LocalityModel> _localityList = [];
  List<LocalityModel> get localityList => _localityList;

  LocalityModel? _selectedLocalityModel;
  LocalityModel? get selectedLocalityModel => _selectedLocalityModel;

  void setLocalityModel(LocalityModel? localityModel) {
    _selectedLocalityModel = localityModel;

  }

  void resetLocalityModel() {
    _selectedLocalityModel = null;
  }



  void getAllInitialValues() {

    getStates();

  }


  bool _isStateLoading = false;
  bool get isStateLoading => _isStateLoading;
  Future<void> getStates() async {
    _isStateLoading = true;
    final results = await addressRepo.getStateByCountry(countryId: 'in');
    results.fold((l) async {
      ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);
      Fluttertoast.showToast(msg: apiFailedModel.message.toString(),backgroundColor: Colors.red,textColor: Colors.white);

    }, (r) async { _isStateLoading = false;
      _statesList = r;
      
    });
  }


  // GET DISTRICTS

  bool _isDistrictLoading = false;
  bool get isDistrictLoading => _isDistrictLoading;
  Future<void> getStatesListByDistrictId() async {
    _isDistrictLoading = true;
    final results = await addressRepo.getDistrictByState(stateId: _selectedStateModel?.stateId.toString() ?? 1.toString());
    results.fold((l) async {
      ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);
      Fluttertoast.showToast(msg: apiFailedModel.message.toString(),backgroundColor: Colors.red,textColor: Colors.white);

    }, (r) async { _isDistrictLoading = false;
      _districtList = r;
      
    });
  }

  // GET CITIES

  bool _isCityLoading = false;
  bool get isCityLoading => _isCityLoading;
  Future<void> getCitiyListByStateId() async {
    _isCityLoading = true;
    final results = await addressRepo.getCityByStateId(statemodel: _selectedStateModel!);
    results.fold((l) async {
      ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);
      Fluttertoast.showToast(msg: apiFailedModel.message.toString(),backgroundColor: Colors.red,textColor: Colors.white);

    }, (r) async { _isCityLoading = false;
      _cityList = r;
      
    });
  }


 // GET LOCALITY BY CITY ID

  bool _isLocalityLoading = false;
  bool get isLocalityLoading => _isLocalityLoading;
  Future<void> getLocalityByCitiesId() async {
    _isLocalityLoading = true;
    final results = await addressRepo.getLocalityByCityId(cityModel: _selectedCityModel!);
    results.fold((l) async {
      ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);
      Fluttertoast.showToast(msg: apiFailedModel.message.toString(),backgroundColor: Colors.red,textColor: Colors.white);

    }, (r) async { _isLocalityLoading = false;
      _localityList = r;
      
    });
  }








  

  /// Updates a specific field in the `UpdateCustomerModel`
  void updateCustomerField(String key, dynamic value) {
    final updatedCustomer = state.copyWith(
      farmName: key == 'farmName' ? value : null,
      customerName: key == 'customerName' ? value : null,
      customerPhone: key == 'customerPhone' ? value : null,
      title: key == 'title' ? value : null,
      email: key == 'email' ? value : null,
      customerType: key == 'customerType' ? value : null,
      addressLine2: key == 'addressLine2' ? value : null,
      creditLimit: key == 'creditLimit' ? value : null,
      primarySourceId: key == 'primarySourceId' ? value : null,
      zoneId: key == 'zoneId' ? value : null,
      kycStatus: key == 'kycStatus' ? value : null,
      countryId: key == 'countryId' ? value : null,
      stateId: key == 'stateId' ? value : null,
      districtId: key == 'districtId' ? value : null,
      cityId: key == 'cityId' ? value : null,
      localityId: key == 'localityId' ? value : null,
      mandal: key == 'mandal' ? value : null,
      postalCode: key == 'postalCode' ? value : null,
      address: key == 'address' ? value : null,
      isIndividual: key == 'isIndividual' ? value : null,
      isOrganization: key == 'isOrganization' ? value : null,
      contactPerson: key == 'contactPerson' ? value : null,
      mobile: key == 'mobile' ? value : null,
      alternateContact: key == 'alternateContact' ? value : null,
      farmCapacity: key == 'farmCapacity' ? value : null,
      faxNo: key == 'faxNo' ? value : null,
      divisionId: key == 'divisionId' ? value : null,
      assignTo: key == 'assignTo' ? value : null,
    );

    emit(updatedCustomer);
  }
}
