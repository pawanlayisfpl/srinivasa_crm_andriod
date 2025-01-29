import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_reporting_manager_model.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/cubit/employee_update_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/cubit/state/single_employe_state.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/update_customer_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/cubit/update_customer_cubit.dart';



class UEmployeeDropDownWidget extends StatelessWidget {
  const UEmployeeDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeUpdateCubit, SingleEmployeState>(
      builder: (context, state,) {
        return  state.isReportingMangaresLoading ? const DropdownLoadingWidget() :  DropdownSearch<EmployeRepModel>(
                enabled: true,
                selectedItem: state.selectedReportingManager,

                dropdownBuilder: (context, selectedItems) => state.selectedReportingManager == null ?  const CommonTextWidget(title: "Select Reporting Manager",fontWeight: FontWeight.w500,textColor: Colors.grey,) : CommonTextWidget(title: state.selectedReportingManager!.userName.toString()+" \n"+state.selectedReportingManager!.designation.toString() ) ,
                
                
                dropdownButtonProps:  const DropdownButtonProps(
                  icon: Icon(Icons.arrow_downward),
                  selectedIcon: Icon(Icons.arrow_drop_down_circle)
                   
                  
                  
                ),
                itemAsString: (item) => "${item.userName }\n${item.designation?.map((e) =>e).toList()}",
    // itemAsString: (item) =>  "${state.selectedReportingManager!.userName} \n${state.selectedReportingManager!.designation}" ,
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
                    hintText: 'Search Employe',
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
                    context.read<EmployeUpdateCubit>().resetEmployeModel();
                  }


                ),
                autoValidateMode: AutovalidateMode.disabled,

                    items: state.reportingMangerList,

                
              
                onChanged: (values) {
                                     context.read<EmployeUpdateCubit>().setEmployeRepModel(values);

                },
                validator: (value) =>   value == null? 'Please select employe' : null,
              );
      },
    ); 
  }
}