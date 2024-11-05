
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/model/get/ticket_particular_model.dart';

part 'view_particular_ticket_state.freezed.dart';

@freezed
class ViewParticularTicketState with _$ViewParticularTicketState {
  const factory ViewParticularTicketState.initial() = Initial;
  const factory ViewParticularTicketState.loading() = Loading;
  const factory ViewParticularTicketState.loaded(ViewParticularTicketModel viewParticularTicketModel) = Loaded;
  const factory ViewParticularTicketState.error(ApiFailedModel apiFailedModel) = Error;
}