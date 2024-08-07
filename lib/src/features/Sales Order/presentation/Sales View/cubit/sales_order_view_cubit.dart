// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';

import 'package:srinivasa_crm_new/src/features/Sales%20Order/data/repo/sales_repo.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/cubit/state/sales_order_view_state.dart';


@injectable
class SalesOrderViewCubit extends Cubit<SalesOrderViewState> {
  final SalesRepo salesRepo;
  SalesOrderViewCubit(
    this.salesRepo,
  ) : super(SalesOrderViewState.initial());

  void getSalesOrder() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isLoading: true));
    await salesRepo.getPendingOrders();
    final result = await salesRepo.getAllSalesOrder();
    result.fold(
      (l) => emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
      (r) => emit(state.copyWith(isLoading: false, viewSalesOrderModel: r)),
    );
    
  }
}
