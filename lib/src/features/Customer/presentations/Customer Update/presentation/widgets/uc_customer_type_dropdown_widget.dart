// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:srinivasa_crm_new/shared/domain/model/zone_model.dart';
// import 'package:srinivasa_crm_new/src/common/common.dart';
// import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/update_customer_state.dart';
// import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/cubit/update_customer_cubit.dart';



// class UcCustomerTypeDropDownWiidget extends StatelessWidget {
//   const UcCustomerTypeDropDownWiidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UpdateCustomerCubit, UpdateCustomerState>(
//       builder: (context, state,) {
//         return  DropdownSearch<String>(
//                 enabled: true,
//                 selectedItem: context.watch<UpdateCustomerCubit>().selectedCustomerType,

//                 dropdownBuilder: (context, selectedItems) => context.watch<UpdateCustomerCubit>().selectedCustomerType == null ?  const CommonTextWidget(title: "Select Type",fontWeight: FontWeight.w500,textColor: Colors.grey,) : CommonTextWidget(title: context.watch<UpdateCustomerCubit>().selectedCustomerType.toString()) ,
                
                
//                 dropdownButtonProps:  const DropdownButtonProps(
//                   icon: Icon(Icons.arrow_downward),
//                   selectedIcon: Icon(Icons.arrow_drop_down_circle)
                   
                  
                  
//                 ),
//     itemAsString: (item) => context.watch<UpdateCustomerCubit>().selectedCustomerType.toString(),
//                 popupProps: const PopupPropsMultiSelection.modalBottomSheet(
                  

//                   constraints: BoxConstraints.expand(),
//                   modalBottomSheetProps: ModalBottomSheetProps(
//                     enableDrag: true,
//                     isScrollControlled: true,
//                     backgroundColor: Colors.white,
//                     elevation: 10,
//                     shape: RoundedRectangleBorder(
//                     ),
//                   ),
//                 showSearchBox: true,
//                 searchFieldProps: TextFieldProps(
//                   decoration: InputDecoration(
//                     hintText: 'Search zone',
//                     prefixIcon: Icon(Icons.search), 
//                 ),
//                 ),
//                 ),
//                 clearButtonProps:  ClearButtonProps(
//                   isVisible: true,
//                   color: Colors.black,
//                   enableFeedback: true,
//                   icon: const Icon(Icons.clear),
//                   onPressed: () {
//                     context.read<UpdateCustomerCubit>().resetSelectedZone();
//                   }


//                 ),
//                 autoValidateMode: AutovalidateMode.disabled,

//                     items: state.zonesList,

                
              
//                 onChanged: (values) {
//                  if(values != null) {
//                     context.read<UpdateCustomerCubit>().setSelectedZone(values);
                  
//                  }
//                 },
//                 validator: (value) =>   value == null? 'Please select zone' : null,
//               );
//       },
//     ); 
//   }
// }