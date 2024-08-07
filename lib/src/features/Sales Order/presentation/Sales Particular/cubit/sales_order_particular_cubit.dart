// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';

import 'package:srinivasa_crm_new/src/features/Sales%20Order/data/repo/sales_repo.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/post/sales_approve_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/post/sales_reject_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Particular/cubit/state/sales_order_particular_state.dart';


@injectable
class SalesOrderParticularCubit extends Cubit<SalesOrderParticularState> {
  final SalesRepo salesRepo;
  SalesOrderParticularCubit(
    this.salesRepo,
  ) : super(SalesOrderParticularState.initial());

  final TextEditingController textController = TextEditingController();
  TextEditingController get getTextController => textController;


  // GET PARTICULAR SALES ORDER
  Future<void> getParticularSalesOrder(int orderId) async {
    emit(state.copyWith(isLoading: true,particularSalesModel: null,apiFailedModel: null));
    await Future.delayed(const Duration(seconds: 1));

    final result = await salesRepo.getParticularSalesOrder(orderId);
    result.fold(
      (l) => emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
      (r) {
        emit(state.copyWith(isLoading: false, particularSalesModel: r));
        
      },
    );
  }


  // APPROVEEEEEE 
  Future<void> approveOrder({required SalesApprovePostModel salesApprovePostModel,required VoidCallback successCallBack}) async {
    emit(state.copyWith(isLoading: true, apiFailedModel: null));
    await Future.delayed(const Duration(seconds: 1));

    final result = await salesRepo.approveSalesOrder(salesApprovePostModel: salesApprovePostModel);
    result.fold(
      (l) => emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
      (r) async {
        emit(state.copyWith(isLoading: false));textController.clear();
       await  getParticularSalesOrder(int.parse(salesApprovePostModel.orderId.toString()));
         
        successCallBack();
      },
    );
  }

  //  REJECTTTTT

  Future<void>  rejectOrder({required SalesRejectPostModel salesRejectPostmodelasync,required VoidCallback successCallBack}) async {
    emit(state.copyWith(isLoading: true, apiFailedModel: null));
    await Future.delayed(const Duration(seconds: 1));

    final result = await salesRepo.rejectSalesOrder(salesRejectPostmodel: salesRejectPostmodelasync);
    result.fold(
      (l) {
        emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
      textController.clear();
      },
      (r)  async {
        emit(state.copyWith(isLoading: false));
        textController.clear();
        await getParticularSalesOrder(int.parse(salesRejectPostmodelasync.orderId.toString()));
        successCallBack();
      },
    );
  }


  @override
  Future<void> close() {
    textController.dispose();
    return super.close();
  }
}
