import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_state.dart';



class MonthlyPlanCustomerListDropDownWidget extends StatelessWidget {
  const MonthlyPlanCustomerListDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateMonthlyPlanCubit, CreateMonthlyPlanState>(
      builder: (context, state,) {
        return DropdownSearch<MonthlyPlanCustomerModel>.multiSelection(
                enabled: true,

                dropdownBuilder: (context, selectedItems) => CommonTextWidget(title: selectedItems.isEmpty ? 'Select Customers' : selectedItems.map((e) => e.customerName == null ? 'no name found' : e.customerName.toString()).join(' , '),fontWeight: selectedItems.isEmpty ? FontWeight.w400 : FontWeight.w500,) ,
                
                
                dropdownButtonProps:  DropdownButtonProps(
                   
                  
                  
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
                    hintText: 'Search Customer',
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
                    context.read<CreateMonthlyPlanCubit>().clearSelectedCustomerLists();
                  }


                ),
                selectedItems:state.selectedCustomersList,

                    items: state.customerList,

                
              
                itemAsString: (item) => item.customerName != null ? "${item.customerName}\n(${item.customerCode != null ? ' (${item.customerCode}))' : ''}" : 'No name found\n${item.customerCode != null ? "("+item.customerCode.toString()+")" : ""}',                // show: (EmployeModel employee) => employee.name,
                onChanged: (values) {
                  if(values.isNotEmpty) {
                    context.read<CreateMonthlyPlanCubit>().setSelectedCustomerLists(selectedCustomers: values);
                    // context.read<CheckinCubit>().setSelectedEmployeList(values);

                  }
                },
                // validator: (value) =>   value == null || value.isEmpty ? 'Please select employee' : null,
                // ... rest of your code
              );
      },
    );
  }
}