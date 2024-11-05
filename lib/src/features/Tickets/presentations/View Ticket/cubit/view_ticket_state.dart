import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/model/get/view_ticket_resposne_model.dart';

part 'view_ticket_state.freezed.dart';

@freezed
class ViewTicketState with _$ViewTicketState {
  factory ViewTicketState({
    @Default(false) bool isLoading,
    @Default(null) ApiFailedModel? apiFailedModel,
    @Default([]) List<ViewTicketModel> viewTicketsList,
  }) = _ViewTicketState;

  factory ViewTicketState.initial() => ViewTicketState(
    isLoading: false,
    apiFailedModel: null,
    viewTicketsList: [],
  );
}