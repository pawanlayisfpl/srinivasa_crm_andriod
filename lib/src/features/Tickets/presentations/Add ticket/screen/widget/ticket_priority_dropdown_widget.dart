import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/model/static/priority_model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/cubit/add_ticket_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/cubit/state/add_ticket_state.dart';

class TicketPriorityDropDownWidget extends StatelessWidget {
  const TicketPriorityDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTicketCubit, AddTicketState>(
      builder: (
        context,
        state,
      ) {
        return DropdownSearch<PriorityModel>(
          enabled: true,
          selectedItem: state.selectedPriorityModel,
          dropdownBuilder: (context, selectedItems) =>
              state.selectedPriorityModel == null
                  ? const CommonTextWidget(
                      title: "Select your priority",
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey,
                    )
                  : CommonTextWidget(
                      title: state.selectedPriorityModel!.name.toString()),
          dropdownButtonProps: const DropdownButtonProps(
              icon: Icon(Icons.arrow_downward),
              selectedIcon: Icon(Icons.arrow_drop_down_circle)),
          itemAsString: (item) => item.name.toString(),
          popupProps: const PopupPropsMultiSelection.modalBottomSheet(
            constraints: BoxConstraints.expand(),
            modalBottomSheetProps: ModalBottomSheetProps(
              enableDrag: true,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(),
            ),
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                hintText: 'Search priority',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          clearButtonProps: ClearButtonProps(
              isVisible: true,
              color: Colors.black,
              enableFeedback: true,
              icon: const Icon(Icons.clear),
              onPressed: () {
                context.read<AddTicketCubit>().clearPriority();
              }),
          autoValidateMode: state.showInputError
              ? AutovalidateMode.always
              : AutovalidateMode.onUserInteraction,
          items: priorityList,
          onChanged: (values) {
            if (values != null) {
              context
                  .read<AddTicketCubit>()
                  .onSelectPriority(priorityModel: values);
            }
          },
          validator: (value) => value == null ? 'Please select priority' : null,
        );
      },
    );
  }
}
