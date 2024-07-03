import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../domain/repo/monthly_plan_repo.dart';
import 'state/monthly_plan_pending_state.dart';


@injectable
class MonthlyPlanPendingCubit extends Cubit<MonthlyPlanPendingRequestState> {
  final MonthlyPlanRepo monthlyPlanRepo;

  MonthlyPlanPendingCubit(
    this.monthlyPlanRepo,
  ) : super(const MonthlyPlanPendingRequestState.initial());

  // GET PENDING REQUESTS
  Future<void> getPendingRequests() async {
    emit(const MonthlyPlanPendingRequestState.loading());
    await Future.delayed(const Duration(milliseconds: 800));
   
    final result = await monthlyPlanRepo.getPendingMonthlyPlan();
   result.fold(
        (l) => emit(MonthlyPlanPendingRequestState.error(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
        (r) => emit(MonthlyPlanPendingRequestState.loaded(r)));
  }

  // CLEAR CONTROLLERS
  void clearController() {
   
  }

  @override
  Future<void> close() {
    return super.close();
  }
}