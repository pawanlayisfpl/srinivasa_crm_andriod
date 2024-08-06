// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/particular_sales_order_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Particular/cubit/sales_order_particular_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Particular/cubit/state/sales_order_particular_state.dart';

class ParticularSalesOrderScreen extends StatefulWidget {
  final int orderId;
  const ParticularSalesOrderScreen({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  State<ParticularSalesOrderScreen> createState() =>
      _ParticularSalesOrderScreenState();
}

class _ParticularSalesOrderScreenState
    extends State<ParticularSalesOrderScreen> {

      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<SalesOrderParticularCubit>().getParticularSalesOrder(widget.orderId);
    });
  }
  @override
  Widget build(BuildContext context) {
Map<String, String> customerModelMapping = {
  // "CustomerCode": "customerDetails.customerCode",
  "CustomerName": "customerDetails.customerName",
  "ContactPerson": "customerDetails.contactPerson",
  "Email": "customerDetails.email",
  "Phone": "customerDetails.phone",
  "City": "customerDetails.city",
  "State": "customerDetails.state",
  "Address": "customerDetails.address",
  "CustomerType": "customerDetails.customerType",
};


Map<String, String> orderDetailsMapping = {
  "ERP Order ID": "orderDetails.erpOrderID",
  "Create Date": "orderDetails.createDate",
  "Created By": "orderDetails.createdBy",
  "Order Status": "orderDetails.orderStatus",
  "Order ID": "orderDetails.orderId",
  "Remarks": "orderDetails.remarks",
  "Amount Paid": "orderDetails.amountPaid",
  "Balance Amount": "orderDetails.balanceAmount",
  "Balance Amount Due Date": "orderDetails.balanceAmountDueDate",
  "Order Remarks": "orderDetails.orderRemarks",
};

Map<String, String> productDetailsMapping = {
  "DivisionName": "divisionName",
  "ProductName": "productName",
  "Quantity": "quantity",
  "Rate": "rate",
  "DiscountPerQuantity": "discountPerQuantity",
  "GetDiscountPerQuantityInPercent": "getDiscountPerQuantityInPercent",
  "AmountPaid": "amountPaid",
  "TotalAmount": "totalAmount",
  "GstAmount": "gstAmount",
  "SellingRate": "sellingRate",
  "UomName": "uomName",
  "QuantityToDeliver": "quantityToDeliver",
  "ShipmentDate": "shipmentDate",
  "CeHatchDate": "ceHatchDate",
};

Map<String, String> paymentDetailsMapping = {
  "PaymentId": "paymentDetails.paymentId",
  "TotalAmount": "paymentDetails.totalAmount",
  "PendingAmount": "paymentDetails.pendingAmount",
  "DueDate": "paymentDetails.dueDate",
  "PaymentStatus": "paymentDetails.paymentStatus",
  "TotalAmountPaid": "paymentDetails.totalAmountPaid",
};



List<TableRow> buildRows(Map<String, String> mapping, ParticularSalesOrderModel customer) {
  final customerJson = customer.toJson();
  log('Customer JSON: $customerJson');
  return mapping.entries.map((entry) {
    var displayKey = entry.key;
    var actualKey = entry.value;
    log('printing display key = ${displayKey} and actual key = ${actualKey}');
    
    // Split the actualKey to handle nested keys
    var keys = actualKey.split('.');
    var value = 'N/A';
    
    // Traverse the nested keys to get the value
    dynamic currentJson = customerJson;
    for (var key in keys) {
      if (currentJson is Map<String, dynamic> && currentJson.containsKey(key) && currentJson[key] != null) {
        currentJson = currentJson[key];
      } else {
        currentJson = 'N/A';
        break;
      }
    }
    value = currentJson.toString();

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
            child: Text(value),
          ),
        ),
      ],
    );
  }).toList();
}


List<TableRow> buildProductRows(Map<String, String> mapping, Map<String, dynamic> productJson) {
  return mapping.entries.map((entry) {
    var displayKey = entry.key;
    var actualKey = entry.value;
    
    // Get the value from the productJson
    var value = productJson[actualKey]?.toString() ?? 'N/A';

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
            child: Text(value),
          ),
        ),
      ],
    );
  }).toList();
}




    return Scaffold(
      appBar: AppBar(
        title: const Text('Particular Sales Order Screen'),
      ),
      body: SafeArea(
        child: BlocBuilder<SalesOrderParticularCubit, SalesOrderParticularState>(
          builder: (context, state) {
            return  state.isLoading ? const CustomLoadingWidget() : SingleChildScrollView(
              child: state.particularSalesModel == null ? EmptyWidget(title: "No Details Found", callback: () {
                Navigator.pop(context);
              }) : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [     20.verticalSpace,
                    const CustomHeadingTextWidget(
                      title: 'Customer Details',
                      textDecoration: TextDecoration.underline,

                    ),
                    10.verticalSpace,
                          Table(
          border: TableBorder.all(),
         children: buildRows(customerModelMapping, state.particularSalesModel!),
        ),
        // ORDER DETAILSSS STARTSSS HEREEEE
       20.verticalSpace,
                    const CustomHeadingTextWidget(
                      title: 'Order Details',
                      textDecoration: TextDecoration.underline,

                    ),
                    10.verticalSpace,
                          Table(
          border: TableBorder.all(),
         children: buildRows(orderDetailsMapping, state.particularSalesModel!),
        ),
        // ORDER DETAAILSSS ENDDSSS HEREEEE
         
          // PAYMENT DETAILSSS STARTSSS HEREEEE
       20.verticalSpace,
                    const CustomHeadingTextWidget(
                      title: 'Payment Details',
                      textDecoration: TextDecoration.underline,

                    ),
                    10.verticalSpace,
                          Table(
          border: TableBorder.all(),
         children: buildRows(paymentDetailsMapping, state.particularSalesModel!),
        ),
        // PAYMENT DETAAILSSS ENDDSSS HEREEEE
         // PRODUCT DETAILSSS STARTSSS HEREEEE
       20.verticalSpace,
                    const CustomHeadingTextWidget(
                      title: 'Product Details',
                      textDecoration: TextDecoration.underline,

                    ),
                    10.verticalSpace,
        //                   Table(
        //   border: TableBorder.all(),
        //  children: buildRows(productDetailsMapping, state.particularSalesModel!),
        // ),
        // PRODUCT DETAAILSSS ENDDSSS HEREEEE



       if (state.particularSalesModel != null && state.particularSalesModel!.productDetails != null)
      ...state.particularSalesModel!.productDetails!.map((product) {
        return Table(
          border: TableBorder.all(),
          children: buildProductRows(productDetailsMapping, product.toJson()),
        );
      }), 


                ],
              ).withSymetricPadding(horizontalPadding: 20.w, verticalPadding: 20.h),
            );
          },
        ),
      ),
    );
  }
}
