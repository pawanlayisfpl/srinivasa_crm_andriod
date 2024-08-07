// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/particular_sales_order_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/post/sales_approve_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/post/sales_reject_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Particular/cubit/sales_order_particular_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Particular/cubit/state/sales_order_particular_state.dart';

class ParticularSalesOrderScreen extends StatefulWidget {
  final int orderId;
  final bool isApproveOrRejectEnabled;
  const ParticularSalesOrderScreen({
    Key? key,
    required this.orderId,
    required this.isApproveOrRejectEnabled,
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
        child: Stack(
          children: [
            BlocBuilder<SalesOrderParticularCubit, SalesOrderParticularState>(
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
                  80.verticalSpace,
            
            
                    ],
                  ).withSymetricPadding(horizontalPadding: 20.w, verticalPadding: 20.h),
                );
              },
            ),
         
        //  APPROVE AND REJECT BUTTONS
          widget.isApproveOrRejectEnabled == false ? SizedBox.shrink() :  Positioned(
              bottom: 20.h,
              left: 20.w,
              right: 20.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 4,
                    child: CommonButton(
                      isApproveButton: true,
                      callback: () async  {
                        AlertDialog alertDialog = AlertDialog.adaptive(
                          
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.white,  
                          elevation: 5,
                          // icon: const Icon(Icons.sub),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              5.verticalSpace,
                              
                              Row(
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: CommonTextWidget(title: 'Are you sure want to Approve ?',fontWeight: FontWeight.w500,textColor: Colors.black,textSize: 18.sp,maxLines: 3,align: TextAlign.start,)),
                                IconButton(icon: Icon(Icons.close),onPressed: () {
                                Navigator.pop(context);
                              },)
                                ],
                              ),
                              20.verticalSpace,
                             CommonTextFormFieldWidget(
                              maxLines: 4,
                              inputType: TextInputType.multiline,
                              textEditingController: context.read<SalesOrderParticularCubit>().getTextController, hintText: "Enter remarks", onChanged: (val) {}),
                             20.verticalSpace,
                             CommonButton(callback: () {
                              if(context.read<SalesOrderParticularCubit>().getTextController.text.isNotEmpty) {
                                SalesApprovePostModel salesApprovePostModel = SalesApprovePostModel(orderId: widget.orderId.toString(), comments: context.read<SalesOrderParticularCubit>().getTextController.text.trim().toString());

                                context.read<SalesOrderParticularCubit>().approveOrder(salesApprovePostModel: salesApprovePostModel, successCallBack: () { 
                                  Fluttertoast.showToast(msg: 'Order Approved Successfully',backgroundColor: Colors.green,textColor: Colors.white);
                                  
                                  Navigator.pop(context); 
                                 });
                                Navigator.pop(context);

                              }else {
                                Fluttertoast.showToast(msg: 'please enter your remarks to approve',backgroundColor: Colors.red,textColor: Colors.white);
                              }
                             }, title: "Submit")
                            ],
                          ),
                        );
                        //  ----------- ALERT DIALOGGG ENDSS HEREEEE---------
                                                showDialog(context: context,
                                                barrierDismissible: false,
                                                barrierColor: Colors.black.withOpacity(0.5),
                                                
                                                 builder: (c) => alertDialog);

                        },
                      title: "Approve",
                    ),
                  ),
                 10.horizontalSpace,
                  Expanded(
                    flex: 4,
                    child:  CommonButton(
                      // isApproveButton: true,
                      isRejectButton: true,
                      callback: () async  {
                        AlertDialog alertDialog = AlertDialog.adaptive(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.white,  
                          elevation: 5,
                          // icon: const Icon(Icons.sub),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              5.verticalSpace,
                              
                              Row(
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: CommonTextWidget(title: 'Are you sure want to Reject ?',fontWeight: FontWeight.w500,textColor: Colors.black,textSize: 18.sp,maxLines: 3,align: TextAlign.start,)),
                                IconButton(icon: Icon(Icons.close),onPressed: () {
                                Navigator.pop(context);
                              },)
                                ],
                              ),
                              20.verticalSpace,
                             CommonTextFormFieldWidget(
                              maxLines: 4,
                              inputType: TextInputType.multiline,
                              textEditingController: context.read<SalesOrderParticularCubit>().getTextController, hintText: "Enter remarks", onChanged: (val) {}),
                             20.verticalSpace,
                             CommonButton(callback: () {
                              if(context.read<SalesOrderParticularCubit>().getTextController.text.isNotEmpty) {
                           SalesRejectPostModel salesRejectPostModel = SalesRejectPostModel(orderId: widget.orderId.toString(), comments: context.read<SalesOrderParticularCubit>().getTextController.text.trim().toString());

                                context.read<SalesOrderParticularCubit>().rejectOrder(salesRejectPostmodelasync: salesRejectPostModel, successCallBack: () { 
                                   Fluttertoast.showToast(msg: 'Order Rejected Successfully',backgroundColor: Colors.green,textColor: Colors.white);
                                  Navigator.pop(context);
                                 });
                                Navigator.pop(context);
                              }else {
                                Fluttertoast.showToast(msg: 'please enter your remarks to reject',backgroundColor: Colors.red,textColor: Colors.white);
                              }
                             }, title: "Submit")
                            ],
                          ),
                        );
                        //  ----------- ALERT DIALOGGG ENDSS HEREEEE---------
                                                showDialog(context: context,
                                                   barrierDismissible: false,
                                                barrierColor: Colors.black.withOpacity(0.6),
                                                
                                                 builder: (c) => alertDialog);

                        },
                      title: "Reject",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 
}
