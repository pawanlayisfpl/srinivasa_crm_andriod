import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/cubit/state/single_employe_state.dart';
import 'package:srinivasa_crm_new/shared/shared.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';

import '../../cubit/employee_update_cubit.dart';



class UpZonesDropDownWidget extends StatelessWidget {
  const UpZonesDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeUpdateCubit, SingleEmployeState>(
      builder: (context, state,) {
        return DropdownSearch<ZoneModel>.multiSelection(
                enabled: true,

                dropdownBuilder: (context, selectedItems) => CommonTextWidget(title: selectedItems.isEmpty ? 'Select zone' : selectedItems.map((e) => e.zoneName).join(' , '),fontWeight: selectedItems.isEmpty ? FontWeight.w400 : FontWeight.w500,maxLines: 6,) ,
                
                
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
                    hintText: 'Search zone',
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
                    context.read<EmployeUpdateCubit>().resetSelectedZones();
                  }


                ),
                selectedItems: state.selectedZones.isEmpty
                    ? []
                    : state.zonesList.map((e) => e).toList(),

                    items:  state.zonesList.isEmpty ? [] : state.zonesList.map((e) =>e).toList(),

                  itemAsString: (item) => item.zoneName ?? "N/A",
              

                    // itemAsString: (item) => item.userName != null && item.designation == null ? item.userName.toString() :  item.userName != null && item.designation != null ? "${item.userName  }-(${(item.designation)})" :   "No name found"  ,
                onChanged: (values) {
                  if(values.isNotEmpty) {
                    context.read<EmployeUpdateCubit>().setSelectedZones(values);

                  }
                },
                // validator: (value) =>   value == null || value.isEmpty ? 'Please select employee' : null,
                // ... rest of your code
              );
      },
    );
  }
}