import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';

class CCDivisionDropDownWidget extends StatelessWidget {
  const CCDivisionDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (
        context,
        state,
      ) {
        return DropdownSearch<DivisionModel>.multiSelection(
          enabled: true,

          dropdownBuilder: (context, selectedItems) => CommonTextWidget(
            title: selectedItems.isEmpty
                ? 'Select Divisions'
                : selectedItems
                    .map((e) => e.divisionName.toString())
                    .join(' , '),
                    textColor: selectedItems.isEmpty ? Colors.grey : Colors.black,
            fontWeight:
                selectedItems.isEmpty ? FontWeight.w400 : FontWeight.w600,
          ),

          dropdownButtonProps: const DropdownButtonProps(),

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
                hintText: 'Search Division',
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
                context.read<CustomerCreateCubit>().clearSelectedDivisionList();
              }),
          selectedItems: state.selectedDivisionsList,
          items: state.divisionsList,

          itemAsString: (item) => item.divisionName,
          onChanged: (values) {
            if (values.isNotEmpty) {
              context
                  .read<CustomerCreateCubit>()
                  .setSelectdDivisionsList(divisionList: values);
            }
          },
          autoValidateMode: state.showInputError
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          validator: (value) =>
              value != null && value.isNotEmpty ? null : "Select Division",
          // ... rest of your code
        );
      },
    );
  }
}
