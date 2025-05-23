import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';



class SocCustomerDropDownWidget extends StatelessWidget {
  const SocCustomerDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderCreateCubit, SalesOrderCreateState>(
      builder: (context, state,) {
        return ColoredBox(
          color: Colors.grey.shade100,
          child: DropdownSearch<Customermodel>(
             
                  enabled: true,
                  selectedItem: state.selectedCustomerModel,
          
                  dropdownBuilder: (context, selectedItems) => state.selectedCustomerModel == null ?  const CommonTextWidget(title: "Select Your Customer",fontWeight: FontWeight.w500,textColor: Colors.grey,) : CommonTextWidget(title: state.selectedCustomerModel!.farm!.isIndividual == true ? state.selectedCustomerModel!.farm!.farmName.toString() : state.selectedCustomerModel!.customerName.toString(),maxLines: 4,) ,
                  
                  
                  dropdownButtonProps:  const DropdownButtonProps(
                    icon: Icon(Icons.arrow_downward),
                    selectedIcon: Icon(Icons.arrow_drop_down_circle)
                     
                    
                    
                  ),
              itemAsString: (item) =>  item.farm!.isIndividual == true ? "${item.farm!.farmName} \n(${item.customerName})" : "${item.customerName}\n(Organization)",
                  popupProps: const PopupPropsMultiSelection.modalBottomSheet(
                    
          
                    constraints: BoxConstraints.expand(),
                    modalBottomSheetProps: ModalBottomSheetProps(
                      useSafeArea: true,
                      barrierDismissible: true,
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
                      hintText: 'Search cutomer',
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
                      context.read<SalesOrderCreateCubit>().resetCustomer();
                    }
          
          
                  ),
                  autoValidateMode: state.showInputError ?  AutovalidateMode.always : AutovalidateMode.onUserInteraction,
          
                      items: state.customerList,
          
                  
                
                  onChanged: (values) {
                   if(values != null) {
                      context.read<SalesOrderCreateCubit>().setSelectedCustomer(values);
                    
                   }
                  },
                  validator: (value) =>   value == null? 'Please select customer' : null,
                ),
        );
      },
    ); 
  }
}