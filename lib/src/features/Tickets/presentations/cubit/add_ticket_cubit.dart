// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Image/image_model.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/fields/string_field.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/model/post/ticket_create_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/model/static/priority_model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/model/static/service_request_model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/repo/tickers_repo_impl.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Ticket/screens/view_tickets_screen.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/cubit/state/add_ticket_state.dart';

@injectable
class AddTicketCubit extends Cubit<AddTicketState> {
  final TicketsRepo ticketsRepo;
  final CommonImageServices commonImageServices;

  AddTicketCubit(
    this.ticketsRepo,
    this.commonImageServices,
  ) : super(AddTicketState.initial());

  final _descriptioncontroller = TextEditingController();
  TextEditingController get descriptionController => _descriptioncontroller;

  void onChangeDescription(String? value) {
    emit(state.copyWith(descriptionField: StringField(value ?? "")));
  }

  void onSelectPriority({required PriorityModel priorityModel}) {
    emit(state.copyWith(selectedPriorityModel: priorityModel));
  }

  void clearPriority() {
    emit(state.copyWith(selectedPriorityModel: null));
  }

  void onSelectServiceRequestType(
      {required ServiceRequestModel serviceRequestModel}) {
    emit(state.copyWith(selectedServiceRequestModel: serviceRequestModel));
  }

  void clearServiceRequestType() {
    emit(state.copyWith(selectedServiceRequestModel: null));
  }

  void resetState() {
    emit(AddTicketState.initial());
    _descriptioncontroller.clear();
  }

  void clearImage() {
    emit(state.copyWith(imageModel: null));
  }

  void clearAllImages() {
    emit(state.copyWith(imageList: []));
  }

  Future<void> pickAllImages(BuildContext context) async {
    
    final results = await commonImageServices.pickMultipleUint8ListImageUsingImagePicker(isFromCamera: false);
emit(state.copyWith(isLoading: true));
    results.fold((l) {
      emit(state.copyWith(isLoading: false));
      Fluttertoast.showToast(msg: 'Someting went wrong ${l.toString()}');
    }, (r) {
      List<ImageModel> newImagesList = r;

      List<ImageModel> existingImageList =
          List.from(state.imageList); // Create a copy of the existing list

      existingImageList
          .addAll(newImagesList); // Add new images to the copied list

      emit(state.copyWith(
          imageList: existingImageList));
          emit(state.copyWith(isLoading: false)); // Emit the updated state
    });
  }

  Future<void> pickImage(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final results = await commonImageServices.pickSingleImageBytes();

    results.fold((l) {
      ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);
      emit(state.copyWith(apiFailedModel: apiFailedModel));
    }, (r) {
      emit(state.copyWith(isLoading: false));
       List<ImageModel> existingList = List.from(state.imageList);
       existingList.add(r!);

       emit(state.copyWith(imageList: existingList,isLoading: false));
    });
  }


  Future<void> removeImageByIndex(int index) async {
    List<ImageModel> list = List.from(state.imageList);
    list.removeAt(index);
    emit(state.copyWith(imageList: list));
  }

  Future<void> onSubmit(BuildContext context) async {
    final description = state.descriptionField.value.isRight();

    if (description &&
        state.selectedPriorityModel != null &&
        state.selectedServiceRequestModel != null) {
      emit(state.copyWith(isSubmiting: true));

      if (context.mounted) {
        // Show a loading indicator (customize as needed)
        // showDialog(
        //   context: context,
        //   barrierDismissible: false,
        //   builder: (BuildContext context) {
        //     return const Center(child: CircularProgressIndicator());
        //   },
        // );
        QuickAlert.show(
            context: context,
            type: QuickAlertType.loading,
            title: "Loading",
            text: "Please wait...");
        TicketCreatePostModel ticketCreatePostModel = TicketCreatePostModel(
          description: _descriptioncontroller.text.toString(),
          priorityId: state.selectedPriorityModel!.id,
          serviceRequestTypeId: state.selectedServiceRequestModel!.id,
          images: state.imageList.map((e) => e.imageByes).toList()
           
        );

        final results = await ticketsRepo.createTickets(
            ticketCreatePostModel: ticketCreatePostModel);
        Navigator.pop(context); // Close the loading indicator

        results.fold((l) {
          ApiFailedModel apiFailedModel =
              ApiFailedModel.fromNetworkExceptions(l);
          emit(state.copyWith(isSubmiting: false));

          if (context.mounted) {
            // Show an error dialog
            Navigator.pop(context); // Close the loading indicator
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Ticket creation failed"),
                  content: Text(apiFailedModel.message.toString()),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        }, (r) {
          // emit(state.copyWith(isSubmiting: false,));
          emit(AddTicketState.initial());
          _descriptioncontroller.clear();

          if (context.mounted) {
            Navigator.pop(context); // Close the loading indicator
            // Show a success dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Successful'),
                  content: const Text('Ticket created successfully'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        if (context.mounted) {}
                        Navigator.push(context,
                            ScaleRoute(screen: const ViewTicketsScreen()));
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        });
      }
    } else {
      emit(state.copyWith(showInputError: true));

      if (context.mounted) {
        // Show a warning dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Warning'),
              content: const Text('Please fill all the fields'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Future<void> close() {
    _descriptioncontroller.dispose();
    return super.close();
  }
}
