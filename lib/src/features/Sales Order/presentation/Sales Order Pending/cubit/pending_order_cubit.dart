import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/common/widgets/loading/common_progress_dialog.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/data/repo/sales_repo.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Order%20Pending/cubit/state/pending_order_state.dart';


@injectable
class PendingOrderCubit extends Cubit<PendingOrderState> {
  final SalesRepo saleRepo;

  PendingOrderCubit({required this.saleRepo}) : super(const PendingOrderState.initial());

  final ScrollController  scrollController = ScrollController();


  // GET ALL PENDING ORDERS
  Future<void> getAllPendingOrders()  async {
    ProgressDialogUtils.showProgressDialog();
    
  emit(const PendingOrderState.loading());
  final results = await saleRepo.getPendingOrders();
    results.fold((l) {
      ProgressDialogUtils.hideProgressDialog();
      emit(PendingOrderState.error(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
    }, (r) {
      ProgressDialogUtils.hideProgressDialog();
      emit(PendingOrderState.loaded(pendingOrderModel: r));
      if (scrollController.hasClients && scrollController.position.hasPixels) {
  scrollController.animateTo(
    0,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeIn,
  );
}
    });
  }
  

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
  
  }