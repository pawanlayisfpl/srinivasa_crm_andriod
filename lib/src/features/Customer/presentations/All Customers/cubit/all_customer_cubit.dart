import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../domain/model/get/customer_model.dart';
import '../../../domain/repo/customer_repo.dart';
import 'all_customer_state.dart';

@injectable
class AllCustomerCubit extends Cubit<AllCustomerState> {
  final CustomerRepo customerRepo;
  final List<Customermodel> _originalList = []; 
  List<Customermodel> customerList = []; 

  final ItemScrollController itemScrollController = ItemScrollController();
  int _selectedIndex = -1;
  int get selectedIndex => _selectedIndex;

  AllCustomerCubit({
    required this.customerRepo,
  }) : super(const AllCustomerState.initial());

  Future<void> getAllCustomer() async {
    emit(const AllCustomerState.loading());
  final result = await customerRepo.getCustomers();
     result.fold(
      (l) {
        ApiFailedModel apiFailedModel = ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l), message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l));
        _selectedIndex = -1;
        emit(AllCustomerState.error(apiFailedModel));
      },
      (r) {
        customerList = r.customermodel ?? [];
        emit(AllCustomerState.loaded(r.customermodel ?? []));
        int index = findCheckedInCustomerIndex(customerList);
        if(index != -1 ) {
          setItemScrollValue(index);
          // jumpToIndex();
        }else {
          _selectedIndex = -1;
        }
      },
    );
  }


   // Method to filter customers by name or farm name
  void filterCustomers(String query) {
    if (query.isEmpty) {
      emit(AllCustomerState.loaded(_originalList)); // Show original list when query is empty
    } else {
      final filteredList = _originalList.where((customer) {
        final customerName = customer.customerName?.toLowerCase() ?? '';
        final farmName = customer.farm?.farmName?.toLowerCase() ?? '';
        return customerName.contains(query.toLowerCase()) || farmName.contains(query.toLowerCase());
      }).toList();
      
      emit(AllCustomerState.loaded(filteredList)); // Emit filtered state
    }
  }

  // Optional: Reset the filter and show all customers
  void resetFilter() {
    emit(AllCustomerState.loaded(_originalList));
  } 


  void setItemScrollValue(int index) {
    _selectedIndex = index;





  }

  // Assuming customerList is a List<Customermodel>
int findCheckedInCustomerIndex(List<Customermodel> customerList) {
  return customerList.indexWhere((customer) => customer.farm?.checkInStatus == true);
}

  Future<void> jumpToIndex() async {
    await itemScrollController.scrollTo(index: _selectedIndex, duration: const Duration(milliseconds: 700),curve: Curves.easeInOut);
  }


  @override
  Future<void> close() {
    _selectedIndex = -1;
    return super.close();
  }

}