import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/cubit/update_customer_cubit.dart';

import '../../domain/model/update_customer_state.dart';



class UcDivisionDropDownWidget extends StatelessWidget {
  const UcDivisionDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateCustomerCubit, UpdateCustomerState>(
      builder: (context, state,) {
        return DropdownSearch<DivisionModel>.multiSelection(
                enabled: true,

                dropdownBuilder: (context, selectedItems) => CommonTextWidget(title: selectedItems.isEmpty ? 'Select Employee Divisions' : selectedItems.map((e) => e.divisionName).join(' , '),fontWeight: selectedItems.isEmpty ? FontWeight.w400 : FontWeight.w500,maxLines: 6,) ,
                
                
                dropdownButtonProps: const DropdownButtonProps(
                  
                  
                ),

                popupProps: const PopupPropsMultiSelection.modalBottomSheet(
                  

                  constraints: BoxConstraints.expand(),
                  modalBottomSheetProps: ModalBottomSheetProps(
                    enableDrag: true,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                    ),
                  ),
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    hintText: 'Search Employe divisions',
                    prefixIcon: Icon(Icons.search), 
                ),
                ),
                ),
                clearButtonProps:  ClearButtonProps(
                  isVisible: true,
                  color: Colors.black,
                  enableFeedback: true,
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    // provider.clearSelectedEmployee();
                    context.read<UpdateCustomerCubit>().resetDivisionList();
                  }


                ),
                selectedItems: state.selectedDivisionList.isEmpty
                    ? []
                    : state.selectedDivisionList.map((e) => e).toList(),

                    items:  state.selectedDivisionList.isEmpty ? [] : state.selectedDivisionList.map((e) =>e).toList(),

                  itemAsString: (item) => item.divisionName,
              

                    // itemAsString: (item) => item.userName != null && item.designation == null ? item.userName.toString() :  item.userName != null && item.designation != null ? "${item.userName  }-(${(item.designation)})" :   "No name found"  ,
                onChanged: (values) {
                  if(values.isNotEmpty) {
                    context.read<UpdateCustomerCubit>().setSelectedDivisionsList(values);

                  }
                },
                // validator: (value) =>   value == null || value.isEmpty ? 'Please select employee' : null,
                // ... rest of your code
              );
      },
    );
  }
}