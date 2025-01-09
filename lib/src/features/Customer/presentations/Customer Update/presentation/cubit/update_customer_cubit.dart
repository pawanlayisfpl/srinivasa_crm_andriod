import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/update_customer_model.dart';

class UpdateCustomerCubit extends Cubit<UpdateCustomerModel> {
  UpdateCustomerCubit(UpdateCustomerModel initialState) : super(initialState);

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
