import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/state/monthly_paln_search_state.dart';


@injectable
class MonthlyPlanSearchCubit extends Cubit<MonthlyPlanSearchState> {


  TextEditingController searchController = TextEditingController();

  MonthlyPlanSearchCubit(
  ) : super( MonthlyPlanSearchState.initial());

  // SEARCH EMPLOYE LIST
  Future<void> searchEmploye({required String searchKey}) async {

    if(searchKey.isNotEmpty) {
      emit(state.copyWith(
        isLoading: true,
      isSearchingAgain: true,
      searchQuery: searchKey,
        
      ));
      await Future.delayed(const Duration(milliseconds: 800));

    }else {

    }
  }

  // CLEAR CONTROLLERS
  void clearController() {
    searchController.clear();
    emit(state.copyWith(
      searchQuery: '',
      empolyesList: [],
    ));
  }

  // DISPOSE CONTROLLERS
  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }

}