import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/cubit/employee_update_cubit.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';

import '../../cubit/state/single_employe_state.dart';



class UeGenderDropdownWidget extends StatelessWidget {
  const UeGenderDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeUpdateCubit, SingleEmployeState>(
      builder: (context, state,) {
        return  state.genderLoading ? const DropdownLoadingWidget() :  DropdownSearch<String>(
                enabled: true,
                selectedItem: state.selectedGender,

                dropdownBuilder: (context, selectedItems) => state.selectedStateModel == null ?  const CommonTextWidget(title: "Select gender",fontWeight: FontWeight.w500,textColor: Colors.grey,) : CommonTextWidget(title: state.selectedGender.toString()) ,
                
                
                dropdownButtonProps:  const DropdownButtonProps(
                  icon: Icon(Icons.arrow_downward),
                  selectedIcon: Icon(Icons.arrow_drop_down_circle)
                   
                  
                  
                ),
    itemAsString: (item) => item..toString(),
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
                    hintText: 'Search gender',
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
                    context.read<EmployeUpdateCubit>().resetGender();
                  }


                ),
                autoValidateMode: AutovalidateMode.disabled,

                    items: state.gender,

                
              
                onChanged: (values) {
                 if(values != null) {
                    context.read<EmployeUpdateCubit>().setGender(values);
                  
                 }
                },
                validator: (value) =>   value == null? 'Please select gender' : null,
              );
      },
    ); 
  }
}