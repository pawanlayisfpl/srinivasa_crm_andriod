import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/post/product_pending_form_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/sales_pending_payment_form_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/sales_product_form_screen.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/custom_expansion_tile_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_amount_paid_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_assigned_to_remarks_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_assigned_to_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_balance_amount_due_date_field.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_balance_amount_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_customerCode_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_discount_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_order_amount_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_order_gst_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_order_remarks_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_payment_mode_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_product_list_view_widget.dart';

import '../../cubit/sales_order_create_cubit.dart';
import 'soc_order_amount_total_textfield.dart';

class SalesOrderCreateBodyWidget extends StatelessWidget {
  const SalesOrderCreateBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          // CUSTOMER CODE NON EDIT

          // PROUDCT DETAILS DROPDOWN
          // ORDER AMOUNT TEXTFIELD
          // ORDER GST NUMBER TEXTFIELD
          // ORDER DISCOUNT TEXTFIELD
          // AMOUNT PAID TEXTFIELD
          // PAYMENT MODE DROPDOWN LSIT
          // BALANCE AMOUNT TEXTFIELD
          // BALANCE AMOUNT DUE DATE FIELD
          // ORDER REMAKRS TEXTAREA FIELD
          // EMPLOYEE OWN ID TEXTFIELD NOT EDITABLE
          // ASSIGNED TO REMAKRS FIELD
          // LIST OF PENDING PAYMENT DROPDOWNS
          // SUBMIT BUTTON

          // CUSTOMER CODE NON EDIT
          // CUSTOMER EXPANSION TILE
          CustomExpansionTileWidget(heading: 'Customer Details', childrens: [
            // 20.verticalSpace,
            const CustomHeadingTextWidget(title: 'Customer'),
            const SocCustomerDropDownWidget(),
            20.verticalSpace,
          ]),
          20.verticalSpace,

          CustomExpansionTileWidget(heading: 'Product Details:', childrens: [
            20.verticalSpace,
            SocProductListWidget(),
            20.verticalSpace,
            
            
            CommonButton(
                callback: () {
                  if (context.mounted) {
                    Navigator.push(
                        context, ScaleRoute(screen: SalesProductFormScreen()));
                  }
                },
                title: 'Add Product'),
            20.verticalSpace,
          ]),
          20.verticalSpace,

          // ORDER DETAILS EXPANSION TILE
          CustomExpansionTileWidget(heading: 'Order Details:', childrens: [
            20.verticalSpace,
            const CustomHeadingTextWidget(title: 'Order Amount '),
            const SocAmountPaidController(),
            20.verticalSpace,
            const CustomHeadingTextWidget(title: 'Order Amount Total'),
            const SocTotalOrderAmountTextField(),
            20.verticalSpace,
            const CustomHeadingTextWidget(title: 'Amount Paid'),
            const SocAmountPaidController(),
            20.verticalSpace,
            const CustomHeadingTextWidget(title: 'Payment Mode'),
            const SocPaymentModeDropDownWidget(),
            20.verticalSpace,
            const CustomHeadingTextWidget(title: 'Balance Amount'),
            const SocBalanceAmountTextField(),
            20.verticalSpace,
            const CustomHeadingTextWidget(title: 'Balance Amount Due Date'),
            const SocBalanceDueDateTextField(),
            20.verticalSpace,
            const CustomHeadingTextWidget(title: 'Order Remarks'),
            const SocOrderRemakrsTextField(),
            20.verticalSpace,
          ]),
          20.verticalSpace,
          // ASSIGNED TO EXPNSION TILE
          CustomExpansionTileWidget(heading: 'Assigned To:', childrens: [
            const CustomHeadingTextWidget(title: 'Employee Own ID'),
            const SocAssignedToTextField(),
            20.verticalSpace,
            const CustomHeadingTextWidget(title: 'Assigned To Remarks'),
            const SocAssignedToRemarksTextField(),
            20.verticalSpace,
          ]),
          20.verticalSpace,
          BlocBuilder<SalesOrderCreateCubit, SalesOrderCreateState>(
            builder: (context, state) {
              return CustomExpansionTileWidget(
                  heading: 'Pending Payment Details:',
                  childrens: [
                    20.verticalSpace,
                    // ADDING LIST HERE
                    state.productFormList.isEmpty ? const SizedBox.shrink() : CommonTextWidget(title: 'Pending Payment Details'),
                    20.verticalSpace,
                    ListView.separated(
                      shrinkWrap: true,
                      
                      itemBuilder: (c,i) {
                        ProductPendingFormModel pendingFormModel = state.pendingFormList[i];
                        return Container(

                          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget(title: (i + 1).toString()+ ". ",fontWeight: FontWeight.w500, ),
                              10.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded( 
                                          flex: 5,
                                          child: CommonTextWidget(title: "Date :",align: TextAlign.start,),),
                                             Expanded( 
                                          flex: 6,
                                          child: 
                                          CommonTextWidget(title: DateFormat.yMMMd().format(DateTime.parse(pendingFormModel.dueDate.toString())),align: TextAlign.left,)
                                          
                                          ),
                                          
                                          
                                      ],
                                    ),
                                    5.verticalSpace,
                                     Row(
                                      children: [
                                        Expanded( 
                                          flex: 5,
                                          child: CommonTextWidget(title: "Amount :",align: TextAlign.start,)),
                                             Expanded( 
                                          flex: 6,
                                          child: CommonTextWidget(title: pendingFormModel.dueAmount.toIndianPriceFormat(),align: TextAlign.start,),)
                                          
                                          
                                      ],
                                    ),
                                    // DUE PERCENTAGE
                                      5.verticalSpace,
                                      Row(
                                      children: [
                                        Expanded( 
                                          flex: 5,
                                          child: CommonTextWidget(title: "Percentage :",align: TextAlign.start,)),
                                             Expanded( 
                                          flex: 6,
                                          child: CommonTextWidget(title: pendingFormModel.dueAmountPercentage.toString() + " %",align: TextAlign.start,),)
                                          
                                          
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                                  Center(child: IconButton(icon: Icon(Icons.delete,color: Colors.black,),onPressed: () {
                                    if(context.mounted) {
                                      QuickAlert.show(context: context, type: QuickAlertType.error,text: "Are you sure want to delete it ?",
                                      title: 'Warning',
                                      cancelBtnText: 'Cancel',
                                      showCancelBtn: true,
                                      confirmBtnText: 'Yes',
                                      confirmBtnColor: Colors.black,
                                      barrierDismissible: false,
                                      onConfirmBtnTap: () {
                                        context.read<SalesOrderCreateCubit>().removeFromProductPendingList(model: pendingFormModel);
                                        if(context.mounted) {
                                          Navigator.pop(context);
                                        }
                                      }
                                      );
                                    }
                                  },),)

                            ],
                          ),
                        );
                      }, separatorBuilder: (c,i) => 10.verticalSpace, itemCount: state.pendingFormList.length),
                    20.verticalSpace,
                    CommonButton(
                        callback: () {
                          if (context.mounted) {
                            Navigator.push(context,
                                ScaleRoute(screen: SalesPendingPaymentForm()));
                          }
                        },
                        title: 'Add Peding Details'),
                    20.verticalSpace,
                  ]);
            },
          ),
          20.verticalSpace,
          20.verticalSpace,
          CommonButton(callback: () {}, title: "Create Order"),
          20.verticalSpace,
        ],
      ).withSymetricPadding(horizontalPadding: 20.w),
    );
  }
}
