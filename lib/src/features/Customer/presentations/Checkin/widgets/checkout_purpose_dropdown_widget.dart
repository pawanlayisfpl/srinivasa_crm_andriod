import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Purpose/purpose_model.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_state.dart';



class CheckoutPurposeDropDownWidget extends StatelessWidget {
  const CheckoutPurposeDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckinCubit, CheckinState>(
      builder: (context, state,) {
        return state.isLoading == true ? const DropdownLoadingWidget() : DropdownSearch<PurposeModel>(
                enabled: true,

                
                
                dropdownButtonProps: const DropdownButtonProps(
                  
                  
                  
                ),

                popupProps: const PopupPropsMultiSelection.modalBottomSheet(
                  // title: CommonTextWidget(title: 'Select Purpose'),
                  

                  constraints: BoxConstraints.expand(),
                  modalBottomSheetProps: ModalBottomSheetProps(
                    enableDrag: true,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                    ),
                    padding: EdgeInsets.all(8),
                    useSafeArea: true
                  ),
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    hintText: 'Search Purpose',
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
                    // provider.clearSelectedEmployee();
                    context.read<CheckinCubit>().clearSelectedPurpose();
                  }


                ),
                selectedItem: state.selectedPurpose,
                dropdownBuilder: (context, selectedItem) => selectedItem == null ? const Text("Select Purpose") : CommonTextWidget(title: selectedItem.purposeName.toString(),textSize: 16.sp,fontWeight: FontWeight.w400,),
                

                    items:  state.purposeList.isEmpty ? [] : state.purposeList.map((e) =>e).toList(),

                
              

                    itemAsString: (item) => item.purposeName ?? 'No purpose title found' ,
                // show: (EmployeModel employee) => employee.name,
                onChanged: (values) {
                  if(values != null) {
                    context.read<CheckinCubit>().setSelectedPurpose(values);

                  }
                },
                // validator: (value) =>   value == null || value.isEmpty ? 'Please select employee' : null,
                // ... rest of your code
              );
      },
    );
  }
}