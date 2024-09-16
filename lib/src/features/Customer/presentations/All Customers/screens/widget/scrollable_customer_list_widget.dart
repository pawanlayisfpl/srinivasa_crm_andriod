// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/screens/customer_details_screen.dart';

import '../../../../domain/model/get/customer_model.dart';

class CustomerScrollableListWidget extends StatelessWidget {
  const CustomerScrollableListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCustomerCubit, AllCustomerState>(
      builder: (context, state) {
        return ScrollablePositionedList.builder(
          itemScrollController: context.watch<AllCustomerCubit>().itemScrollController,
          itemCount: context.watch<AllCustomerCubit>().customerList.length,
          itemBuilder: (c, i) {
            Customermodel customerModel = context.watch<AllCustomerCubit>().customerList[i];
              return Card(
                margin: EdgeInsets.only(bottom: 10.h),
                color: context.watch<AllCustomerCubit>().selectedIndex  == i ? Colors.green[300] : Colors.white,
                child: ListTile(
                  trailing:  customerModel.farm!.checkInStatus == true ?  GestureDetector(
                    onTap: () {
                      context.read<AllCustomerCubit>().setItemScrollValue(i);
                      QuickAlert.show(context: context,animType: QuickAlertAnimType.slideInUp,disableBackBtn: true,barrierDismissible: false, type: QuickAlertType.success,title: "Check in",text: 'Customer is checked in at ${customerModel.customerName}',confirmBtnColor: Colors.black);
                    },
                    child:  Icon(Icons.location_pin,color: Colors.red,size: 40.sp,)) : null,
                            dense: true, 
                            // tileColor: Colors.white,
                          
                            
                            enableFeedback: true,
                            
                               onTap: () async {
                                 await   Navigator.push(context, MaterialPageRoute(builder: (c) => CustomerDetailsScreen(customermodel: customerModel,)));
                },
                            isThreeLine: false,
                
                              title: CommonTextWidget(title: customerModel.customerName ?? "No Name Found",fontWeight: FontWeight.w500,textColor: Colors.black,),
                              subtitle: CommonTextWidget(title: customerModel.farm!.isIndividual  == true  ? "${customerModel.farm!.farmName} - ${customerModel.farm!.custLocation}" : "Organization",textColor: Colors.black.withOpacity(0.7),fontWeight: FontWeight.w400,maxLines: 2,),
                            ),
              );
          },
        );
      },
    );
  }
}