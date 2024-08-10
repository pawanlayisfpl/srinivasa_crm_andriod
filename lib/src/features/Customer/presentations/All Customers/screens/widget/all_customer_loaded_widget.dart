// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/screens/customer_details_screen.dart';

import '../../../../../../config/config.dart';

class AllCustomerLoadedWidget extends StatelessWidget {
  final List<Customermodel> customerLists;
  const AllCustomerLoadedWidget({
    super.key,
    required this.customerLists,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: customerLists.isEmpty ? EmptyWidget(title: 'No Customers  found', callback: () async {
      context.read<AllCustomerCubit>().getAllCustomer();
    }) : Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Expanded(
            child: AlphabetScrollView(
              isAlphabetsFiltered: true,
              list: customerLists
                  .map((e) => AlphaModel( e.customerName ?? ""))
                  .toList(),
              alignment: LetterAlignment.right,
              itemExtent: 0.14.sh, // Set a fixed height for each item
              unselectedTextStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              selectedTextStyle: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
              overlayWidget: (value) => Stack(

                
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    size: 50,
                    color: AppColors.primaryColor,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      // ignore: unnecessary_string_interpolations
                      '$value'.toUpperCase(),
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
              itemBuilder: (_, k, id) {
                Customermodel? customerModel = customerLists[k];
                return ListTile(
                            dense: true,
                            tileColor: Colors.white,
                          
                            
                            enableFeedback: true,
                            
                               onTap: () async {
                                 await   Navigator.push(context, MaterialPageRoute(builder: (c) => CustomerDetailsScreen(customermodel: customerModel,)));
                },
                            isThreeLine: false,
                
                              title: CommonTextWidget(title: customerModel.customerName ?? "No Name Found",fontWeight: FontWeight.w500,textColor: Colors.black,),
                              subtitle: CommonTextWidget(title: customerModel.farm!.custLocation ?? "No Farm Found",textColor: Colors.black.withOpacity(0.7),fontWeight: FontWeight.w400,),
                            );
              },
            ),
          )
        ],
      ),
    ),);
  }
}
