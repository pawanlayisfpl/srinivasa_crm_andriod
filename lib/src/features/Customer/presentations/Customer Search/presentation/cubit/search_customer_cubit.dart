// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/repo/customer_repo.dart';
import 'search_customer_state.dart';


@injectable
class SearchCustomerCubit extends Cubit<SearchCustomerState> {
  final CustomerRepo customerRepo;
  SearchCustomerCubit(
    this.customerRepo,
  ) : super(const SearchCustomerState());

  TextEditingController searchController = TextEditingController();


  Future<void> searchCustomer(String searchKey) async {
    
    if(searchKey.isNotEmpty) {
        emit(state.copyWith(
      isLoading: true,
      isSearchingAgain: true,
      searchQuery: searchKey,
    ));
    await Future.delayed(const Duration(milliseconds: 800));
    final result = await customerRepo.searchCustomer(searchKey: searchKey);
    if(result != null) {
      result.fold(
      (l) => emit(state.copyWith(
        isLoading: false,
        isSearchingAgain: false,
        hasError: true,
      )),
      (r) => emit(state.copyWith(
        isLoading: false,
        isSearchingAgain: false,
        customers: r,
      )),
    );
    }
    }
  }

  void clearController() {
    searchController.clear();
    emit(state.copyWith(
      searchQuery: '',
      customers: [],
    ));
  
  }


 @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
 
}
