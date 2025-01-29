import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/cubit/employee_update_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/cubit/state/single_employe_state.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/cubit/update_customer_cubit.dart';




class UpDivisionDropDownWiget extends StatelessWidget {
  const UpDivisionDropDownWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeUpdateCubit, SingleEmployeState>(
      builder: (context, state,) {
        return DropdownSearch<DivisionModel>(
                enabled: true,

                dropdownBuilder: (context, selectedItems) => CommonTextWidget(title: selectedItems == null ? 'Select Employee Divisions' : selectedItems.divisionName,fontWeight: selectedItems == null ? FontWeight.w400 : FontWeight.w500,maxLines: 6,) ,
                
                
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
                selectedItem: state.selectedDivisionModel,

                    items:  state.divisionList,

                  itemAsString: (item) => item.divisionName,
              

                    // itemAsString: (item) => item.userName != null && item.designation == null ? item.userName.toString() :  item.userName != null && item.designation != null ? "${item.userName  }-(${(item.designation)})" :   "No name found"  ,
                onChanged: (values) {
                  context.read<EmployeUpdateCubit>().setSelectedDivisionModel(values);
                },
                // validator: (value) =>   value == null || value.isEmpty ? 'Please select employee' : null,
                // ... rest of your code
              );
      },
    );
  }
}