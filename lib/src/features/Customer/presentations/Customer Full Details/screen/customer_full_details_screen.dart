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
  "Customer Name": "custName",
  "Customer Phone" : 'custPhone',
  "City": "custCity",
  "Address" : 'custAddress',
  "Customer Type": 'customerType',
  "Country" : "custCountry",
  "State" : "custStateCode",
  'Zone' : 'zone',
  'Locality': 'locality',
  "Address Line" : 'addressLine',
  "Mandal": 'mandal',
  "District": 'district',
  "Pincode": 'custPostal',
  "Primary Source": 'custPrimarySource ',
  "Create Name" : 'createdBy',
  "Create Date" : 'createdDate',
  "Assigned To": 'assignedTo',
  "Credit Limit": 'custCreditLimit',


};


Map<String,String> allContactsDetailsMappign = {
  "Title": "title",
  "Contact Person": "custContactPerson",
  "Mobile": 'custContPersContactNo',
  "Additional Phone" : 'custContPersAltContNo',
  "Email": "custEmail",

};

Map<String,String> historyMapping = {
  "Added by": "empName",
 
  
};



List<TableRow> _buildRows(Map<String, String> mapping, CustomerFullDetailsModel customer) {
  return mapping.entries.map((entry) {
    var displayKey = entry.key;
    var actualKey = entry.value;
    var value = customer.toJson()[actualKey]; // Fetch the value from the model using the actual key
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
            child: Text(
              value != null ? actualKey.toString() == 'zone' ? value.toString().split(":").last.toString().replaceAll("}", "") :  value.toString() : 'N/A', // Display the value
            ),
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
         children: _buildRows(customerModelMapping, value),
        ),
        20.verticalSpace,
        const CustomHeadingTextWidget(title: 'All Contact Detail',textDecoration: TextDecoration.underline,),
                    Table(
                      border: TableBorder.all(),
                      children: _buildRows(allContactsDetailsMappign,value),
                    ),
                    10.verticalSpace,
                    const CustomHeadingTextWidget(
                      title: 'History',
                      textDecoration: TextDecoration.underline,
                    ),
                    20.verticalSpace,
                    Table(
                      border: TableBorder.all(),
                      children: _buildRows(historyMapping,value),
                    ),
                    20.verticalSpace,
                    const CustomHeadingTextWidget(
                      title: 'All Images',
                      textDecoration: TextDecoration.underline ,
                    ),
                    10.verticalSpace
                    // Table(
                    //   border: TableBorder.all(),
                    //   children: _buildRows(addressDetailsKeys,value),
                    // ),
                    // CustomHeadingTextWidget(
                    //   title: 'Customer Type',
                    // ),
                    // Table(
                    //   border: TableBorder.all(),
                    //   children: _buildRows(customerTypeKeys,value),
                    // ),
                    // CustomHeadingTextWidget(
                    //   title: 'Individual Details',
                    // ),
                    // Table(
                    //   border: TableBorder.all(),
                    //   children: _buildRows(inidvidualDetailsKeys,value),
                    // ),
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
