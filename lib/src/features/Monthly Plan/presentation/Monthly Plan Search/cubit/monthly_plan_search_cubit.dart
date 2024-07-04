// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/repo/monthly_plan_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/state/monthly_paln_search_state.dart';

@injectable
class MonthlyPlanSearchCubit extends Cubit<MonthlyPlanSearchState> {
  final MonthlyPlanRepo monthlyPlanRepo;


  TextEditingController searchController = TextEditingController();

  MonthlyPlanSearchCubit(
    this.monthlyPlanRepo,
  ) : super( MonthlyPlanSearchState.initial());

  // SEARCH EMPLOYE LIST
  Future<void> searchEmploye({required String searchKey}) async {

    if(searchKey.isNotEmpty) {
      emit(state.copyWith(
        isLoading: true,
      isSearchingAgain: true,
      searchQuery: searchKey,
      monthlyPlanSearchResponseModel: null,
        
      ));
      final results = await monthlyPlanRepo.searchMonthlyPlanUser(search: searchKey);
      results.fold(
        (l) {
          emit(state.copyWith(
            isLoading: false,
            isSearchingAgain: false,
            empolyesList: [],
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),
            
          ));
        },
        (r) {
          emit(state.copyWith(
            isLoading: false,
            isSearchingAgain: false,
            empolyesList: [],
            monthlyPlanSearchResponseModel: r
          ));
        },
      );

    }else {

    }
  }

  // CLEAR CONTROLLERS
  void clearController() {
    searchController.clear();
    emit(state.copyWith(
      searchQuery: '',
      empolyesList: [],
      monthlyPlanSearchResponseModel:  null
    ));
  }

  // DISPOSE CONTROLLERS
  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }

}
