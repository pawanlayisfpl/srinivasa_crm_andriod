// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../../../../common/common.dart';
import '../../../domain/model/get/customer_full_details_model.dart';
import '../cubit/customer_full_details_cubit.dart';
import '../cubit/customer_full_details_state.dart';



class CustomerFullDetails2 extends StatefulWidget {
  // final Customermodel? customermodel;
  final String? customerCode;
  const CustomerFullDetails2({
    super.key,
    this.customerCode,
  });

  @override
  State<CustomerFullDetails2> createState() => _CustomerFullDetails2State();
}

class _CustomerFullDetails2State extends State<CustomerFullDetails2> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context
          .read<CustomerFullDetailsCubit>()
          .loadCustomerByid(customerCode: widget.customerCode.toString());
    });
  }

  @override
  Widget build(BuildContext context) {



Map<String, String> customerModelMapping = {
  "Customer Code": "customerCode",
  "Name": "custName",
  "Email": "custEmail",
  "Phone": "custPhone",
  "City": "custCity",
  "Address": "custAddress",
  "Customer Type": "customerType",
  "Country": "custCountry",
  "State": "custStateCode",
  "Zone": "zone", // Assuming you want to display zoneName from Zone object
  "Pincode": "custPostal",
  "Primary Source": "custPrimarySource",
  "Create Name": "createdBy",
  "Create Date": "createdDate",
  "Credit Limit": "custCreditLimit",
  "Assigned to":"empName",
  "latitude":"latitude",
  "longitude":"longitude",
};



List<TableRow> buildRows(Map<String, String> mapping, CustomerFullDetailsModel customer) {
  final customerJson = customer.toJson();
  debugPrint('Customer JSON: $customerJson');
  return mapping.entries.map((entry) {
    var displayKey = entry.key;
    var actualKey = entry.value;
    // Check if the actual key exists in customerJson and is not null, otherwise set to 'N/A'
    var value = customerJson.containsKey(actualKey) && customerJson[actualKey] != null ? customerJson[actualKey] : 'N/A';
    if (actualKey == 'zone' && value != 'N/A') {
      // Ensure value is not null before attempting to cast and access 'zoneName'
      value = value != null && (value as Map)['zoneName'] != null ? (value)['zoneName'] : 'N/A';
    }
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              displayKey,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value.toString()),
          ),
        ),
      ],
    );
  }).toList();
}
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Full Details'),
      ),
      body: SafeArea(
        child: BlocBuilder<CustomerFullDetailsCubit, CustomerFullDetailsState>(
          builder: (context, state) {
            return state.when(initial: () => Container(), loading: () => const Center(child: CustomLoadingWidget()), loaded: (value) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    const CustomHeadingTextWidget(
                      title: 'Customer Details',
                      textDecoration: TextDecoration.underline,

                    ),
                    10.verticalSpace,
                   Table(
          border: TableBorder.all(),
         children: buildRows(customerModelMapping, value),
        ),
        20.verticalSpace,
       
                  ],
                ),
              ).withSymetricPadding(horizontalPadding: 15.w);
            }, error: (error) => CommonErrorWidget(error: error.toString(), callback: () {
              context.read<CustomerFullDetailsCubit>().loadCustomerByid(customerCode: widget.customerCode.toString());
            }));
          },
        ).withSymetricPadding(horizontalPadding: 20.w),
      ),
    );
  }
}
