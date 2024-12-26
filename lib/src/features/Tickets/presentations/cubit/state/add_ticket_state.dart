import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Image/image_model.dart';
import 'package:srinivasa_crm_new/src/common/fields/string_field.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/model/get/ticket_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/model/static/priority_model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/model/static/service_request_model.dart';

part 'add_ticket_state.freezed.dart';

@freezed
class AddTicketState with _$AddTicketState {
  const factory AddTicketState({
    TicketResponseModel? ticketResponseModel,
    @Default(false) bool isLoading,
    @Default(false) bool isSubmiting,
    @Default(false) bool showInputError,
    @Default(null) ApiFailedModel? apiFailedModel,
    @Default(null) ImageModel? imageModel,
    @Default([]) List<ImageModel> imageList,

    required StringField descriptionField,
    PriorityModel? selectedPriorityModel,
    ServiceRequestModel? selectedServiceRequestModel,
  }) = _AddTicketState;

  factory AddTicketState.initial() => AddTicketState(
        ticketResponseModel: null,
        isLoading: false,
        isSubmiting: false,
        showInputError: false,
        imageList:  [],
        descriptionField: StringField(''), // Provide a default value for the required field
        selectedPriorityModel: null,
        imageModel:  null,
        selectedServiceRequestModel: null,
        apiFailedModel: null
      );
}
