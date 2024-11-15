import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/payment_mode_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';



class SocPaymentModeDropDownWidget extends StatelessWidget {
  const SocPaymentModeDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderCreateCubit, SalesOrderCreateState>(
      builder: (context, state,) {
        return ColoredBox(
          color: Colors.grey.shade100,
          child: DropdownSearch<PaymentModeModel>(
                  enabled: true,
                  selectedItem: state.selectedPaymentModeModel,
          
                  dropdownBuilder: (context, selectedItems) => state.selectedPaymentModeModel == null ?  const CommonTextWidget(title: "Select your payment mode",fontWeight: FontWeight.w500,textColor: Colors.grey,) : CommonTextWidget(title: state.selectedPaymentModeModel!.paymentModeName.toString()) ,
                  
                  
                  dropdownButtonProps:  const DropdownButtonProps(
                    icon: Icon(Icons.arrow_downward),
                    selectedIcon: Icon(Icons.arrow_drop_down_circle)
                     
                    
                    
                  ),
              itemAsString: (item) => item.paymentModeName.toString(),
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
                      hintText: 'Search payment mode',
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
                      context.read<SalesOrderCreateCubit>().resetPaymentMode();
                    }
          
          
                  ),
                  autoValidateMode: state.showInputError ?  AutovalidateMode.always : AutovalidateMode.onUserInteraction,
          
                      items: state.paymentModeList,
          
                  
                
                  onChanged: (values) {
                   if(values != null) {
                    context.read<SalesOrderCreateCubit>().setPaymentMode(values);
                    
                   }
                  },
                  validator: (value) =>   value == null? 'Please select zone' : null,
                ),
        );
      },
    ); 
  }
}