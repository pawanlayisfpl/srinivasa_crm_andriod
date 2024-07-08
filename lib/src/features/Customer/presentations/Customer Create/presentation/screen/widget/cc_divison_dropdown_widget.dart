import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Country/country_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/shared/shared.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';



class CCDivisionDropDownWidget extends StatelessWidget {
  const CCDivisionDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (context, state,) {
        return DropdownSearch<DivisionModel>(
                enabled: true,
                selectedItem: state.selectedDivisonModel,

                dropdownBuilder: (context, selectedItems) => state.selectedDivisonModel == null ?  const CommonTextWidget(title: "Select your division",fontWeight: FontWeight.w500,textColor: Colors.grey,) : CommonTextWidget(title: state.selectedDivisonModel!.districtName.toString()) ,
                
                
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
                    hintText: 'Search district',
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
                    context.read<CustomerCreateCubit>().clearDivisionValue();
                  }


                ),
                autoValidateMode: state.showInputError ?  AutovalidateMode.always : AutovalidateMode.onUserInteraction,

                    items: state.divisionList,

                
              
                onChanged: (values) {
                 if(values != null) {
                    context.read<CustomerCreateCubit>().setDivisionValue(divisionModel: values);
                  
                 }
                },
                validator: (value) =>   value == null? 'Please select division' : null,
              );
      },
    ); 
  }
}