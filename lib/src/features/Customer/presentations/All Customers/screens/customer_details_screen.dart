
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/screens/check_out_screen.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/screens/checkin_screen.dart';

import '../../../../../config/config.dart';
import '../../../domain/model/get/customer_model.dart';
import '../../Checkin/cubit/checkin_cubit.dart';

class CustomerDetailsScreen extends StatefulWidget {
  final Customermodel? customermodel;
  

  CustomerDetailsScreen({
    Key? key,
    this.customermodel,
  }) : super(key: key);

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  @override
  void initState() {
    log(widget.customermodel!.toJson().toString());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.customermodel != null) {
        // todo: call last checkin checkout api here
        context.read<CheckinCubit>().lastCheckinCheckoutLogic(
            customerId: widget.customermodel!.farm!.customerId.toString(), farmId: widget.customermodel!.farm!.farmId.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Customer Details'),
        actions: [],
      ),
      body: widget.customermodel == null
          ? const Center(
              child:
                  Text('Something went wrong , please select another customer'),
            )
          : SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    // View full details
    //                 Align(
    //                     alignment: Alignment.centerRight,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.end,
    //                       children: [
    //                         TextButton(
    //                             onPressed: () {
    //                               Navigator.pop(context);
    //                               if (mounted) {
                                   
    //                                 //   Navigator.push(
    //                                 //   context,
    //                                 //   MaterialPageRoute(
    //                                 //     builder: (_) => CustomerFullDetails2(
    //                                 //       customerCode: widget.customermodel!.customerCode.toString(),
    //                                 //     ),
    //                                 //   ),
    //                                 // );
    //                               }
    //                             },
    //                             child: const CommonTextWidget(
    //                               title: 'View full details',
    //                               textColor: AppColors.primaryColor,
    //                               fontWeight: FontWeight.w600,
    //                             )),
    //                         Icon(
    //                           semanticLabel: 'View full details on next page',
    //                           Icons.link_sharp,
    //                           color: AppColors.primaryColor,
    //                           size: 20.sp,
    //                         ),
    //                       ],
    //                     )),
                    Expanded(
                        child: Scrollbar(
                      interactive: true,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomerDetailsHeadingWidget(
                              title: 'Customer ID',
                            ),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel?.farm!.customerId.toString(),
                            ),
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(
                              title: 'Farm ID',
                            ),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel?.farm!.farmId.toString(),
                            ),
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(
                              title: 'Farm Name',
                            ),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel?.farm!.farmName.toString(),
                            ),
                            const CustomerDetailsDividerWidget(),
                             10.verticalSpace,
                                const CustomerDetailsHeadingWidget(
                              title: 'Customer Code',
                            ),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel?.farm!.customerCode ?? 'N/A',  
                            ),
                            const CustomerDetailsDividerWidget(),
                              10.verticalSpace,
      const CustomerDetailsHeadingWidget(
        title: 'Location Code',
      ),
      CustomerDetailsTextWidget(
        data: widget.customermodel?.farm?.locationCode ?? 'N/A',
      ),
      const CustomerDetailsDividerWidget(),

    //                        if (widget.customermodel?.farm?.isOrganization == true) ...[
    //   10.verticalSpace,
    //   const CustomerDetailsHeadingWidget(
    //     title: 'Location Code',
    //   ),
    //   CustomerDetailsTextWidget(
    //     data: widget.customermodel?.farm?.locationCode ?? 'N/A',
    //   ),
    //   const CustomerDetailsDividerWidget(),
    // ],
                              10.verticalSpace,
                                const CustomerDetailsHeadingWidget(
                              title: 'Customer Name',
                            ),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel?.customerName.toString(),  
                            ),
                            const CustomerDetailsDividerWidget(),
                              10.verticalSpace,
                              const CustomerDetailsHeadingWidget(
                              title: 'Customer Zone',
                            ),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel?.farm!.custZone.toString(),
                            ),
                            const CustomerDetailsDividerWidget(),
                               10.verticalSpace,
                              const CustomerDetailsHeadingWidget(
                              title: 'Contact Person',
                            ),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel?.farm!.contactPerson.toString(),
                            ),
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                          
                            const CustomerDetailsHeadingWidget(title: 'City'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.custCity,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
    
                            const CustomerDetailsHeadingWidget(title: 'Farm Location'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.custLocation,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'Contact No'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.contPersContactNo,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'Alternative No'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.contPersAltContNo.toString() == "01234567890" ? "N/A" : widget.customermodel!.farm!.contPersAltContNo.toString(),
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'Country'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.custCountry,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'Address'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.custAddress,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'State'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.custStateCode,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'City'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.custCity,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'Postal Code'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.custPostal,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                            
                            

                          ],
                        ),
                      ),
                    )),
    
                    BlocBuilder<CheckinCubit, CheckinState>(
                      builder: (context, state) {
                        return state.lastCheckinOutResponseModel != null && state.lastCheckinOutResponseModel!.status == true ? CommonButton(
                            callback: () async {
                                 if(context.mounted) {
                                                                       Navigator.pushReplacement(context, SlideLeftRoute(screen: CheckinScreen(customermodel: widget.customermodel!,)));

                              }
                            }, title: "Proceed to check In") : CommonButton(callback: () async  {
                                if(context.mounted) {
                                  if(widget.customermodel != null) {
                                  Navigator.pushReplacement(context, SlideLeftRoute(screen:  CheckoutScreen(customermodel: widget.customermodel!,)));

                                  }
                              }
                              
                            }, title: "Proceed to checkout");
                      },
                    ),
                  
                    10.verticalSpace,
                  ],
                ),
              ),
            ),
    );
  }
}

class CustomerDetailsHeadingWidget extends StatelessWidget {
  final String title;
  const CustomerDetailsHeadingWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CommonTextWidget(
      title: title,
      textSize: 18.sp,
      fontWeight: FontWeight.w500,
      textColor: Colors.black,
    ).withPadding(left: 10.w, bottom: 4.h);
  }
}

class CustomerDetailsTextWidget extends StatelessWidget {
  final String? data;
  final int? maxline;
  const CustomerDetailsTextWidget({
    Key? key,
    this.data,
    this.maxline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTextWidget(
      title: data ?? 'N/A',
      fontWeight: FontWeight.w400,
      textColor: AppColors.secondaryTextClr,
      maxLines: maxline ?? 1,
    ).withPadding(left: 10.w);
  }
}

class CustomerDetailsDividerWidget extends StatelessWidget {
  const CustomerDetailsDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider();
  }
}