import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/domain/model/District/district_model.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/update_customer_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/cubit/update_customer_cubit.dart';



class UcDistrictsDropDownWidget extends StatelessWidget {
  const UcDistrictsDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateCustomerCubit, UpdateCustomerState>(
      builder: (context, state,) {
        return  state.isDistrictLoading ? const DropdownLoadingWidget() :  DropdownSearch<DistrictModel>(
                enabled: true,
                selectedItem: state.selectedDistrictModel,

                dropdownBuilder: (context, selectedItems) => state.selectedDistrictModel == null ?  const CommonTextWidget(title: "Select district",fontWeight: FontWeight.w500,textColor: Colors.grey,) : CommonTextWidget(title: state.selectedDistrictModel!.districtName.toString()) ,
                
                
                dropdownButtonProps:  const DropdownButtonProps(
                  icon: Icon(Icons.arrow_downward),
                  selectedIcon: Icon(Icons.arrow_drop_down_circle)
                   
                  
                  
                ),
    itemAsString: (item) => item.districtName.toString(),
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
                    context.read<UpdateCustomerCubit>().resetDistrictModel();
                  }


                ),
                autoValidateMode: AutovalidateMode.disabled,

                    items: state.districtList,

                
              
                onChanged: (values) {
                 if(values != null) {
                    context.read<UpdateCustomerCubit>().setSelectedDistrictModel(values);
                  
                 }
                },
                validator: (value) =>   value == null? 'Please select district' : null,
              );
      },
    ); 
  }
}