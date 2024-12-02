import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/post/product_form_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';

import '../../../../../../common/common.dart';

class SocProductListWidget extends StatelessWidget {
  const SocProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
  return  BlocBuilder<SalesOrderCreateCubit, SalesOrderCreateState>(
    builder: (context, state) {
      return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        
                        itemBuilder: (c,i) {
                          ProductFormModel pendingFormModel = state.productFormList[i];
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
  
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
                                CommonTextWidget(title: "${i + 1}. ",fontWeight: FontWeight.w500, ),
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
                                            child: CommonTextWidget(title: "Product :",align: TextAlign.start,textSize: 14.sp,),),
                                               Expanded( 
                                            flex: 6,
                                            child: 
                                            CommonTextWidget(title: pendingFormModel.productsModel == null ? 'No Product found' : pendingFormModel.productsModel!.productName.toString(),align: TextAlign.left,maxLines: 3,textSize: 14.sp,)
                                            
                                            ),
                                            
                                            
                                        ],
                                      ),
                                      const Divider(),
                                      5.verticalSpace,
                                       Row(
                                        children: [
                                           Expanded( 
                                            flex: 5,
                                            child: CommonTextWidget(title: "Qty :",align: TextAlign.start,textSize: 14.sp,)),
                                               Expanded( 
                                            flex: 6,
                                            child: CommonTextWidget(title: pendingFormModel.quanity.toString(),align: TextAlign.start,textSize: 14.sp,),)
                                            
                                            
                                        ],
                                      ),
                                      // DUE PERCENTAGE
                                         const Divider(),
                                        5.verticalSpace,
                                        Row(
                                        children: [
                                           Expanded( 
                                            flex: 5,
                                            child: CommonTextWidget(title: "Rate :",align: TextAlign.start,textSize: 14.sp,)),
                                               Expanded( 
                                            flex: 6,
                                            child: CommonTextWidget(title: pendingFormModel.rate.toIndianPriceFormat(),align: TextAlign.start,textSize: 14.sp,),)
                                            
                                            
                                        ],
                                      ),
                                       // DISCOUNT PER QTY
                                          const Divider(),
                                        5.verticalSpace,
                                        Row(
                                        children: [
                                           Expanded( 
                                            flex: 5,
                                            child: CommonTextWidget(title: "Selling\nRate :",align: TextAlign.start,textSize: 14.sp,)),
                                               Expanded( 
                                            flex: 6,
                                            child: CommonTextWidget(title: pendingFormModel.sellingRate!.toIndianPriceFormat(),align: TextAlign.start,textSize: 14.sp,),)
                                            
                                            
                                        ],
                                      ),
                                       // DISCOUNT PER PERCENTAGE
                                          const Divider(),
                                      //   5.verticalSpace,
                                      //   Row(
                                      //   children: [
                                      //     const Expanded( 
                                      //       flex: 5,
                                      //       child: CommonTextWidget(title: "Discount\nQty :",align: TextAlign.start,)),
                                      //          Expanded( 
                                      //       flex: 6,
                                      //       child: CommonTextWidget(title: pendingFormModel.discountPerQty.toString(),align: TextAlign.start,),)
                                            
                                            
                                      //   ],
                                      // ),

                                      //  // TOTAL PERCENTAGE
                                      //     const Divider(),
                                      //   5.verticalSpace,
                                      //   Row(
                                      //   children: [
                                      //     const Expanded( 
                                      //       flex: 5,
                                      //       child: CommonTextWidget(title: "Discount\nPercentage :",align: TextAlign.start,)),
                                      //          Expanded( 
                                      //       flex: 6,
                                      //       child: CommonTextWidget(title: "${pendingFormModel.discountPerPercentage} %",align: TextAlign.start,),)
                                            
                                            
                                      //   ],
                                      // ),
                                        //  const Divider(),
                                            // 5.verticalSpace,
                                        Row(
                                        children: [
                                           Expanded( 
                                            flex: 5,
                                            child: CommonTextWidget(title: "Total value :",align: TextAlign.start,textSize: 14.sp,)),
                                               Expanded( 
                                            flex: 6,
                                            child: CommonTextWidget(title: pendingFormModel.totalAmount.toIndianPriceFormat(),align: TextAlign.start,textSize: 14.sp),)
                                            
                                            
                                        ],
                                      ),
                                         const Divider(),
                                    ],
                                  ),
                                ),
                                    Center(child: IconButton(icon: const Icon(Icons.delete,color: Colors.black,),onPressed: () {
                                      if(context.mounted) {
                                        QuickAlert.show(context: context, type: QuickAlertType.error,text: "Are you sure want to delete it ?",
                                        title: 'Warning',
                                        cancelBtnText: 'Cancel',
                                        showCancelBtn: true,
                                        confirmBtnText: 'Yes',
                                        confirmBtnColor: Colors.black,
                                        barrierDismissible: false,
                                        onConfirmBtnTap: () {
                                          context.read<SalesOrderCreateCubit>().removeFromProductFormList(productFormModel: pendingFormModel);
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
                        }, separatorBuilder: (c,i) => 10.verticalSpace, itemCount: state.productFormList.length);} );}}