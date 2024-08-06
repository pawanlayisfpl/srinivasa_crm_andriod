// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';

import 'package:srinivasa_crm_new/src/features/Sales%20Order/data/repo/sales_repo.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Particular/cubit/state/sales_order_particular_state.dart';


@injectable
class SalesOrderParticularCubit extends Cubit<SalesOrderParticularState> {
  final SalesRepo salesRepo;
  SalesOrderParticularCubit(
    this.salesRepo,
  ) : super(SalesOrderParticularState.initial());

  // GET PARTICULAR SALES ORDER
  void getParticularSalesOrder(int orderId) async {
    emit(state.copyWith(isLoading: true,particularSalesModel: null,apiFailedModel: null));
    await Future.delayed(const Duration(seconds: 1));

    final result = await salesRepo.getParticularSalesOrder(orderId);
    result.fold(
      (l) => emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
      (r) => emit(state.copyWith(isLoading: false, particularSalesModel: r)),
    );
  }
}
