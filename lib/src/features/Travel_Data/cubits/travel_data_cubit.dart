import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';
import 'package:srinivasa_crm_new/src/features/Travel_Data/cubits/travel_data_state.dart';
import 'package:srinivasa_crm_new/src/features/Travel_Data/repo/travel_data_repo_impl.dart';

@injectable
class TravelDataCubit extends Cubit<TravelDataState> {
  final TravelDataRepo travelDataRepo;

  TravelDataCubit(this.travelDataRepo) : super(TravelDataState.initial());

  Future<void> getTravelDataApi(String startDate,
    String endDate,) async {
    emit(state.copyWith(isLoading: true, apiFailedModel: null,travelDataList: []));
    await Future.delayed(const Duration(milliseconds: 800));
    final results = await travelDataRepo.getTravelData(startDate,endDate);
    results.fold(
      (l) => emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
     (r)=>   emit(state.copyWith(
        isLoading: false,
        travelDataModel: r, 
      ))
      //(r) => emit(state.copyWith(isLoading: false,travelDataList: r.data?.customDailyReportDtoList ?? [])),
    );
  }

  

  // void resetState() {
  //   emit(ViewTicketState.initial());
  // }
}