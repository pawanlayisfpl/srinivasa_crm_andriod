import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/domain/model/StateModel/state_model.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/update_customer_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/cubit/update_customer_cubit.dart';



class UcStatesDropDownWidget extends StatelessWidget {
  const UcStatesDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateCustomerCubit, UpdateCustomerState>(
      builder: (context, state,) {
        return  state.isStateLoading ? const DropdownLoadingWidget() :  DropdownSearch<StateModel>(
                enabled: true,
                selectedItem: state.selectedStateModel,

                dropdownBuilder: (context, selectedItems) => state.selectedStateModel == null ?  const CommonTextWidget(title: "Select state",fontWeight: FontWeight.w500,textColor: Colors.grey,) : CommonTextWidget(title: state.selectedStateModel!.stateName.toString()) ,
                
                
                dropdownButtonProps:  const DropdownButtonProps(
                  icon: Icon(Icons.arrow_downward),
                  selectedIcon: Icon(Icons.arrow_drop_down_circle)
                   
                  
                  
                ),
    itemAsString: (item) => item.stateName.toString(),
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
                    hintText: 'Search State',
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
                    context.read<UpdateCustomerCubit>().resetStates();
                  }


                ),
                autoValidateMode: AutovalidateMode.disabled,

                    items: state.statesList,

                
              
                onChanged: (values) {
                 if(values != null) {
                    context.read<UpdateCustomerCubit>().setSelectedStateModel( values);
                  
                 }
                },
                validator: (value) =>   value == null? 'Please select state' : null,
              );
      },
    ); 
  }
}