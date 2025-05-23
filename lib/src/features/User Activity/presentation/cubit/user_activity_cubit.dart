// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';

import 'package:srinivasa_crm_new/src/features/User%20Activity/data/repo/user_activity_repo.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/cubit/state/user_activity_state.dart';

@injectable
class UserActivityCubit extends Cubit<UserActivityState> {
  final UserActivityRepo userActivityRepo;
  UserActivityCubit(
    this.userActivityRepo,
  ) : super(UserActivityState.initial());

  final dateController = TextEditingController();
  


  Future<void> getUserActivity({required DateTime dateTime}) async {
                  dateController.text = DateFormat.MMMMd().format(dateTime);

    
    emit(state.copyWith(isLoading: true,apiFailedModel: null,userActivityModel: null));
    await Future.delayed(const Duration(seconds: 1));

    final result = await userActivityRepo.getUserAcitivies(dateTime: dateTime);
    result.fold(
      (l) {
        emit(state.copyWith(isLoading: false,apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),userActivityModel: null));
      },
      (r) {

        emit(state.copyWith(isLoading: false,apiFailedModel: null,userActivityModel: r));
debugPrint(r.repTravelLogsData!.length.toString());
      }
    );
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      dateController.text = DateFormat.MMMMd().format(picked);
      getUserActivity(dateTime: picked);
    }
  }

  void resetState() {
    dateController.clear();
    emit(UserActivityState.initial());
  }



  @override
  Future<void> close() {
    dateController.dispose();
    emit(UserActivityState.initial());
    return super.close();
  }


}
