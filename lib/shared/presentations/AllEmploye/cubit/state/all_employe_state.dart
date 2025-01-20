

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../src/core/model/model.dart';
import '../../../../domain/model/Employe/all_employe_model.dart';


part 'all_employe_state.freezed.dart';

@freezed
class AllEmployeState  with _$AllEmployeState {

  const factory AllEmployeState({
    @Default(null) AllEmployesModel? allEmployeModel,
    @Default(false) bool isLoading,
    @Default(null) ApiFailedModel? apiFailedModel
  }) = _AllEmployeState;


  factory AllEmployeState.initial(
  ) => const AllEmployeState(
    allEmployeModel: null,
    isLoading: false,
    apiFailedModel: null,
  );

}