// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:srinivasa_crm_new/shared/domain/repo/Employe/employe_repo.dart';
import 'package:srinivasa_crm_new/shared/presentations/AllEmploye/cubit/state/all_employe_state.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';


@injectable
class AllEmployeCubit extends Cubit<AllEmployeState> {

  final EmployeRepo employeRepo;

  AllEmployeCubit(
    this.employeRepo,
  ) : super(AllEmployeState.initial());



  Future<void> getEmployesData() async {
    emit(state.copyWith(allEmployeModel: null,isLoading: true,apiFailedModel: null));
    final results = await employeRepo.getAllGlobalEmployesList();

    results.fold((l) {
      emit(state.copyWith(allEmployeModel: null,isLoading: false,apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
    }, (r) {
          emit(state.copyWith(allEmployeModel: r,isLoading: false,apiFailedModel: null),);

  });
  }
}
 

