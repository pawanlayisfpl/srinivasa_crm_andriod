// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/get/alert_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/post/mark_alert_as_read_postmodel.dart';

import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/repo/alert_repo.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_state.dart';

@injectable
class AlertCubit extends Cubit<AlertState> {
  final AlertRepo alertRepo;
  AlertCubit(
    this.alertRepo,
  ) : super(  AlertState.initial());

  int _alertCount = 0;
  int get alertCount => _alertCount;


  // GET ALL INITIAL VALUES

  Future<void> getAlerts() async {
    _alertCount = 0;
    

    emit(state.copyWith(isLoading: true, alertsList: []));
    await Future.delayed(const Duration(milliseconds: 800));

    final response = await alertRepo.getAlerts();
    response.fold(
      (l) => emit( state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),isLoading: false)),
      (r) {
        emit(state.copyWith(isLoading: false, alertsList: r ));
        getAlertCountValue();

      },
    );
  }


  Future<void> markAsRead({required MarkAlertAsReadPostModel markAlertReadPostModel}) async {
    final response = await alertRepo.makAsRead(markAlertAsReadPostModel: markAlertReadPostModel);
    response.fold(
      (l) => emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l) )),
      (r) {
       
        getAlerts();
        
        getAlertCountValue();

        
      },
    ); 
  }

   getAlertCountValue () {
    List<AlertModel> filterAlertList = state.alertsList.where((alert) => alert.read != null && alert.read == false).toList();
    _alertCount =  filterAlertList.length;

  }





}
