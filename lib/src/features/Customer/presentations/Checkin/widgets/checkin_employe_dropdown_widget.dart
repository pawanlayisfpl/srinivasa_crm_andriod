import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/joint_employe_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_state.dart';

import '../../../../../../shared/domain/model/Employe/employe_model.dart';


class CheckinEmployeDropdownWidget extends StatelessWidget {
  const CheckinEmployeDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckinCubit, CheckinState>(
      builder: (context, state,) {
        return DropdownSearch<JoinEmployeModel>.multiSelection(
                enabled: true,

                dropdownBuilder: (context, selectedItems) => CommonTextWidget(title: selectedItems.isEmpty ? 'Select Employee' : selectedItems.map((e) => e.userName).join(' , '),fontWeight: selectedItems.isEmpty ? FontWeight.w400 : FontWeight.w500,maxLines: 6,) ,
                
                
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
                    hintText: 'Search Employee',
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
                    context.read<CheckinCubit>().clearEmployeLists();
                  }


                ),
                selectedItems: state.selectedEmployeList.isEmpty
                    ? []
                    : state.selectedEmployeList.map((e) => e).toList(),

                    items:  state.employeList.isEmpty ? [] : state.employeList.map((e) =>e).toList(),

                  itemAsString: (item) => item.userName+" (${item.designation.map((e) => e.toString()+")").join(' , ')}",
              

                    // itemAsString: (item) => item.userName != null && item.designation == null ? item.userName.toString() :  item.userName != null && item.designation != null ? "${item.userName  }-(${(item.designation)})" :   "No name found"  ,
                onChanged: (values) {
                  if(values.isNotEmpty) {
                    context.read<CheckinCubit>().setSelectedEmployeList(values);

                  }
                },
                // validator: (value) =>   value == null || value.isEmpty ? 'Please select employee' : null,
                // ... rest of your code
              );
      },
    );
  }
}