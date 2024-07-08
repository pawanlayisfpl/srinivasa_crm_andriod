import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';



class CCTitleDropDownWidget extends StatelessWidget {
  const CCTitleDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (context, state,) {
        return DropdownSearch<String>(
                enabled: true,
                selectedItem: state.selectedTitleValue,

                dropdownBuilder: (context, selectedItems) => state.selectedTitleValue == null ?  const CommonTextWidget(title: "Select Title",fontWeight: FontWeight.w500,textColor: Colors.grey,) : CommonTextWidget(title: state.selectedTitleValue.toString()) ,
                
                
                dropdownButtonProps:  const DropdownButtonProps(
                  icon: Icon(Icons.arrow_downward),
                  selectedIcon: Icon(Icons.arrow_drop_down_circle)
                   
                  
                  
                ),
    itemAsString: (item) => item.toString(),
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
                    hintText: 'Select Title',
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
                    context.read<CustomerCreateCubit>().clearTitleValue();
                  }


                ),
                autoValidateMode: state.showInputError ?  AutovalidateMode.always : AutovalidateMode.onUserInteraction,

                    items: state.titlesList,

                
              
                onChanged: (values) {
                 if(values != null) {
                    context.read<CustomerCreateCubit>().setTitleValue(titleValue: values);
                  
                 }
                },
                validator: (value) =>   value == null? 'Please select title' : null,
              );
      },
    ); 
  }
}