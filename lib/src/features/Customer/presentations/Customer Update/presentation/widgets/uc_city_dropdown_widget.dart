import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/domain/model/City/city_model.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/update_customer_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/cubit/update_customer_cubit.dart';



class UcCityDropDownWidget extends StatelessWidget {
  const UcCityDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateCustomerCubit, UpdateCustomerState>(
      builder: (context, state,) {
        return  state.isCityLoading ? const DropdownLoadingWidget() :  DropdownSearch<CityModel>(
                enabled: true,
                selectedItem: state.selectedCityModel,

                dropdownBuilder: (context, selectedItems) => state.selectedCityModel == null ?  const CommonTextWidget(title: "Select city",fontWeight: FontWeight.w500,textColor: Colors.grey,) : CommonTextWidget(title: state.selectedCityModel!.cityName.toString()) ,
                
                
                dropdownButtonProps:  const DropdownButtonProps(
                  icon: Icon(Icons.arrow_downward),
                  selectedIcon: Icon(Icons.arrow_drop_down_circle)
                   
                  
                  
                ),
    itemAsString: (item) => item.cityName.toString(),
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
                    context.read<UpdateCustomerCubit>().resetCities();
                  }


                ),
                autoValidateMode: AutovalidateMode.disabled,

                    items: state.citiesList,

                
              
                onChanged: (values) {
                 if(values != null) {
                    context.read<UpdateCustomerCubit>().setCityModel(values);
                  
                 }
                },
                validator: (value) =>   value == null? 'Please select city' : null,
              );
      },
    ); 
  }
}