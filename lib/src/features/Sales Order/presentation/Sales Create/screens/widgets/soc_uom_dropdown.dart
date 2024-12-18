import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/uom_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';



class SocUomDropDownWidget extends StatelessWidget {
  const SocUomDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderCreateCubit, SalesOrderCreateState>(
      builder: (context, state,) {
        return ColoredBox(
          color: Colors.grey.shade100,
          child: DropdownSearch<UOMModel>(
            
                  enabled: true,
                  selectedItem: state.selectedUomModel,
          
                  dropdownBuilder: (context, selectedItems) => state.selectedUomModel == null ?  const CommonTextWidget(title: "Select Your UOM Type",fontWeight: FontWeight.w500,textColor: Colors.grey,) : CommonTextWidget(title: state.selectedUomModel!.uomName.toString()) ,
                  
                  
                  dropdownButtonProps:   DropdownButtonProps( 
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    
                    icon: const Icon(Icons.arrow_downward),
                    selectedIcon: const Icon(Icons.arrow_drop_down_circle)
                     
                    
                    
                  ),
              itemAsString: (item) => item.uomName.toString(),
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
                      hintText: 'Search UOM Type',
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
                      context.read<SalesOrderCreateCubit>().resetUomType();
                    }
          
          
                  ),
                  autoValidateMode: state.showInputError ?  AutovalidateMode.always : AutovalidateMode.onUserInteraction,
          
                      items: state.uomList,
          
                  
                
                  onChanged: (values) {
                   if(values != null) {
                    context.read<SalesOrderCreateCubit>().setUomType(values);
                    
                   }
                  },
                  validator: (value) =>   value == null? 'uom type is required' : null,
                ),
        );
      },
    ); 
  }
}