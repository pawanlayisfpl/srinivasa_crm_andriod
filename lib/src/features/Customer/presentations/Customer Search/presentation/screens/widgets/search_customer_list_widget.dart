
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../../../../domain/model/get/customer_model.dart';
import '../../../../All Customers/screens/customer_details_screen.dart';
import '../../cubit/search_customer_cubit.dart';
import '../../cubit/search_customer_state.dart';
import 'search_customer_empty_widget.dart';



class SearchCustomerListWidget extends StatelessWidget {
  const SearchCustomerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCustomerCubit, SearchCustomerState>(
      builder: (context, state) {
        return state.customers.isEmpty ? const SearchCustomerEmptyWidget() :  Expanded(
          child: ListView.separated(itemBuilder: (c,i) {
            Customermodel customer = state.customers[i];

            return ListTile(
              onTap: () {
                // customercode,zone,contact name,custoemr details
              
            
                if(context.mounted) {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => CustomerDetailsScreen(customermodel:customer )));

                }
              },
              leading: const Icon(Icons.person),
            title: CommonTextWidget(title: customer.custName.toString()),
            subtitle: CommonTextWidget(title: customer.zone != null ? customer.zone!.zoneName.toString() : "No Zone Found",fontWeight: FontWeight.w500,textColor: Colors.grey,),
          );
          },itemCount: state.customers.length, separatorBuilder: (BuildContext context, int index) { 
            return const Divider().withSymetricPadding(horizontalPadding: 20.w);
           },),
        );
      },
    );
  }
}
