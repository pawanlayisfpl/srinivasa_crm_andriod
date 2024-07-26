import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/payment_mode_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/product_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/uom_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';



class SocProductDropDown extends StatelessWidget {
  const SocProductDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderCreateCubit, SalesOrderCreateState>(
      builder: (context, state,) {
        return ColoredBox(
          color: Colors.grey.shade300,
          child: DropdownSearch<ProductsModel>(
            
                  enabled: true,
                  selectedItem: state.selectedProductModel,
          
                  dropdownBuilder: (context, selectedItems) => state.selectedProductModel == null ?  const CommonTextWidget(title: "Select your product",fontWeight: FontWeight.w500,textColor: Colors.grey,) : CommonTextWidget(title: state.selectedProductModel!.productName.toString()) ,
                  
                  
                  dropdownButtonProps:   DropdownButtonProps( 
                    style: ButtonStyle(),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    
                    icon: const Icon(Icons.arrow_downward),
                    selectedIcon: const Icon(Icons.arrow_drop_down_circle)
                     
                    
                    
                  ),
              itemAsString: (item) => item.productName.toString(),
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
                      hintText: 'Search product',
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
                      context.read<SalesOrderCreateCubit>().resetProductModel();
                    }
          
          
                  ),
                  autoValidateMode: state.showInputError ?  AutovalidateMode.always : AutovalidateMode.onUserInteraction,
          
                      items: state.productsList,
          
                  
                
                  onChanged: (values) {
                   if(values != null) {
                    context.read<SalesOrderCreateCubit>().setSelectedProductModel(value: values);
                    
                   }
                  },
                  validator: (value) =>   value == null? 'product is required' : null,
                ),
        );
      },
    ); 
  }
}