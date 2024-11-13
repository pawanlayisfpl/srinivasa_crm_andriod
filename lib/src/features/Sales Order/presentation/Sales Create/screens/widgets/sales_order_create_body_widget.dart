import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/widgets/text/common_textfield_heading_widget.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/post/product_pending_form_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/sales_product_form_screen.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/custom_expansion_tile_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_amount_paid_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_assigned_to_remarks_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_assigned_to_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_balance_amount_due_date_field.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_balance_amount_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_customerCode_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_delivery_location_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_delivery_types_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_order_amount_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_order_remarks_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_payment_mode_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_product_list_view_widget.dart';

import '../../cubit/sales_order_create_cubit.dart';
import 'soc_order_amount_total_textfield.dart';

class SalesOrderCreateBodyWidget extends StatelessWidget {
  const SalesOrderCreateBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SalesOrderCreateCubit, SalesOrderCreateState>(
      listenWhen: (previous, current) => previous.apiFailedModel != current.apiFailedModel || previous.isSubmitting != current.isSubmitting || previous.isSuccess != current.isSuccess,
      listener: (context, state) {
        if(state.apiFailedModel != null) {
           if(Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          QuickAlert.show(context: context, type: QuickAlertType.error, text: state.apiFailedModel!.errorMessage, title: 'Error', showCancelBtn: false, barrierDismissible: false, confirmBtnText: 'Ok', confirmBtnColor: Colors.black, onConfirmBtnTap: () {
            if(Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          });
        }

        if(state.isSubmitting) {
          QuickAlert.show(context: context, type: QuickAlertType.loading, text: "Please wait...", title: 'Loading', showCancelBtn: false, barrierDismissible: false);

        }

        if(state.isSuccess) {
            Navigator.pop(context);

          // if(Navigator.canPop(context)) {
          // }
          QuickAlert.show(context: context, type: QuickAlertType.success, text: "Order created successfully", title: 'Success',confirmBtnText: 'Ok', confirmBtnColor: Colors.black, onConfirmBtnTap: () {
                         Navigator.pop(context);

          });
        }


      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,

            CustomExpansionTileWidget(heading: 'Customer Details', childrens: [
              // 20.verticalSpace,
              const CommonTextFieldHeadingWidget(title: "Customer",isRequired: true,),
             context.watch<SalesOrderCreateCubit>().state.isCustomerLoading ? const DropdownLoadingWidget() : const SocCustomerDropDownWidget(),
              20.verticalSpace,
            ]),
            20.verticalSpace,

            CustomExpansionTileWidget(heading: 'Product Details(required)', childrens: [
              20.verticalSpace,
              const SocProductListWidget(),
              20.verticalSpace,
              CommonButton(
                  callback: () {
                    if (context.mounted) {
                      Navigator.push(context,
                          ScaleRoute(screen: const SalesProductFormScreen()));
                    }
                  },
                  title: context
                          .watch<SalesOrderCreateCubit>()
                          .state
                          .productFormList
                          .isNotEmpty
                      ? "Add another product"
                      : 'Add Product'),
              20.verticalSpace,
            ]),
            20.verticalSpace,

            // ORDER DETAILS EXPANSION TILE
            CustomExpansionTileWidget(heading: 'Order Details:', childrens: [
              10.verticalSpace,
              const CustomHeadingTextWidget(
                  title: 'Order Total Amount(with GST)'),
              const SocTotalOrderAmountTextField(),
              20.verticalSpace,
              const CustomHeadingTextWidget(title: 'Order Amount '),
              const SocOrderAmountTextField(),
              20.verticalSpace,
              const CommonTextFieldHeadingWidget(title: 'Amount Paid',isRequired: true,),
              const SocAmountPaidController(),
              20.verticalSpace,
              const CustomHeadingTextWidget(title: 'Balance Amount(optional)'),
              const SocBalanceAmountTextField(),
              20.verticalSpace,
              const CustomHeadingTextWidget(title: 'Balance Amount Due Date(optional)'),
              const SocBalanceDueDateTextField(),
              20.verticalSpace,
              const CommonTextFieldHeadingWidget(title: 'Payment Mode',isRequired: true,)
,              const SocPaymentModeDropDownWidget(),
              20.verticalSpace,
              const CustomHeadingTextWidget(title: 'Order Remarks(optional)'),
              const SocOrderRemakrsTextField(),
              20.verticalSpace,
            ]),
            20.verticalSpace,
            // ASSIGNED TO EXPNSION TILE
            CustomExpansionTileWidget(heading: 'Assigned To:', childrens: [
              const CustomHeadingTextWidget(title: 'Employee Own ID'),
              const SocAssignedToTextField(),
              20.verticalSpace,
              const CustomHeadingTextWidget(title: 'Employee Remarks(optional)'),
              const SocAssignedToRemarksTextField(),
              20.verticalSpace,
            ]),
            20.verticalSpace,
            BlocBuilder<SalesOrderCreateCubit, SalesOrderCreateState>(
              builder: (context, state) {
                return  state.productFormList.isEmpty
                          ? const SizedBox.shrink()
                          :  CustomExpansionTileWidget(
                    heading: 'Pending Payment Details:',
                    childrens: [
                      20.verticalSpace,
                      // ADDING LIST HERE
                      state.productFormList.isEmpty
                          ? const SizedBox.shrink()
                          : const CommonTextWidget(title: 'Pending Payment Details'),
                      20.verticalSpace,
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (c, i) {
                            ProductPendingFormModel pendingFormModel =
                                state.pendingFormList[i];
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonTextWidget(
                                    title: "${i + 1}. ",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  10.horizontalSpace,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Expanded(
                                              flex: 5,
                                              child: CommonTextWidget(
                                                title: "Date :",
                                                align: TextAlign.start,
                                              ),
                                            ),
                                            Expanded(
                                                flex: 6,
                                                child: CommonTextWidget(
                                                  title: DateFormat.yMMMd()
                                                      .format(DateTime.parse(
                                                          pendingFormModel
                                                              .dueDate
                                                              .toString())),
                                                  align: TextAlign.left,
                                                )),
                                          ],
                                        ),
                                        5.verticalSpace,
                                        Row(
                                          children: [
                                            const Expanded(
                                                flex: 5,
                                                child: CommonTextWidget(
                                                  title: "Amount :",
                                                  align: TextAlign.start,
                                                )),
                                            Expanded(
                                              flex: 6,
                                              child: CommonTextWidget(
                                                title: pendingFormModel
                                                    .dueAmount
                                                    .toIndianPriceFormat(),
                                                align: TextAlign.start,
                                              ),
                                            )
                                          ],
                                        ),
                                        // DUE PERCENTAGE
                                        5.verticalSpace,
                                        // Row(
                                        //   children: [
                                        //     Expanded(
                                        //         flex: 5,
                                        //         child: CommonTextWidget(
                                        //           title: "Percentage :",
                                        //           align: TextAlign.start,
                                        //         )),
                                        //     Expanded(
                                        //       flex: 6,
                                        //       child: CommonTextWidget(
                                        //         title: pendingFormModel
                                        //                 .dueAmountPercentage
                                        //                 .toString() +
                                        //             " %",
                                        //         align: TextAlign.start,
                                        //       ),
                                        //     )
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        if (context.mounted) {
                                          QuickAlert.show(
                                              context: context,
                                              type: QuickAlertType.error,
                                              text:
                                                  "Are you sure want to delete it ?",
                                              title: 'Warning',
                                              cancelBtnText: 'Cancel',
                                              showCancelBtn: true,
                                              confirmBtnText: 'Yes',
                                              confirmBtnColor: Colors.black,
                                              barrierDismissible: false,
                                              onConfirmBtnTap: () {
                                                context
                                                    .read<
                                                        SalesOrderCreateCubit>()
                                                    .removeFromProductPendingList(
                                                        model:
                                                            pendingFormModel);
                                                if (context.mounted) {
                                                  Navigator.pop(context);
                                                }
                                              });
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (c, i) => 10.verticalSpace,
                          itemCount: state.pendingFormList.length),
                      // 20.verticalSpace,
                      // CommonButton(
                      //     callback: () {
                      //       if (context.mounted) {
                      //         Navigator.push(context,
                      //             ScaleRoute(screen: SalesPendingPaymentForm()));
                      //       }
                      //     },
                      //     title: 'Add Peding Details'),
                      20.verticalSpace,
                    ]);
              },
            ),
            20.verticalSpace,
            CustomExpansionTileWidget(heading: "Delivery", childrens: [
              const CommonTextFieldHeadingWidget(title: 'Delivery Location',isRequired: true,),
              const SocDeliveryLocationField(),
              20.verticalSpace,
              const CommonTextFieldHeadingWidget(title: 'Delivery Type',isRequired: true,),
              const SocDeliveryTypesDropDownWidget(),
              20.verticalSpace,
            ]),
            20.verticalSpace,
            20.verticalSpace,
            CommonButton(
              callback: () => resetFormFun(context),
              title: "Reset form",
              isRejectButton: true,
            ),
            20.verticalSpace,
            CommonButton(
              callback: () => createOrderFun(context),
              title: "Create Order",
              isApproveButton: true,
            ),
            20.verticalSpace,
          ],
        ).withSymetricPadding(horizontalPadding: 20.w),
      ),
    );
  }

  void resetFormFun(BuildContext context) {
    if (context.mounted) {
      context.read<SalesOrderCreateCubit>().resetForm();
    }
  }

  void createOrderFun(BuildContext context) {
    if (context.mounted) {
      context.read<SalesOrderCreateCubit>().createOrder();
    }
  }
}
