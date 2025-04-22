import 'package:freezed_annotation/freezed_annotation.dart'; 
import 'package:srinivasa_crm_new/src/core/model/model.dart'; 
import 'package:srinivasa_crm_new/src/features/Travel_Data/model/traveldatamodel.dart';
part 'travel_data_state.freezed.dart';

@freezed
class TravelDataState with _$TravelDataState {
  const factory TravelDataState({
    TravelDataModel? travelDataModel,
    @Default(false) bool isLoading,
    @Default(false) bool isSubmiting,
    @Default(false) bool showInputError,
    @Default([]) List<TravelDataModel> travelDataList,
    ApiFailedModel? apiFailedModel, 
  }) = _TravelDataState;

  factory TravelDataState.initial() => const TravelDataState(
        travelDataModel: null,
        isLoading: false,
        isSubmiting: false,
        showInputError: false,
        apiFailedModel: null, 
        travelDataList:[],
      );
}
