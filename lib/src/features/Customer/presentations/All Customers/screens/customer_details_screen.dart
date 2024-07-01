// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/screens/check_out_screen.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/screens/checkin_screen.dart';

import '../../../../../config/config.dart';
import '../../../domain/model/get/customer_model.dart';
import '../../Checkin/cubit/checkin_cubit.dart';
import '../../Customer Full Details/screen/customer_full_details_screen.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.customermodel != null) {
        // todo: call last checkin checkout api here
        context.read<CheckinCubit>().lastCheckinCheckoutLogic(
            customerId: widget.customermodel!.customerCode.toString());
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
                    // View full details
                    Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  if (mounted) {
                                   
    
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CustomerFullDetails2(
                                          customerCode: widget.customermodel!.customerCode.toString(),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: const CommonTextWidget(
                                  title: 'View full details',
                                  textColor: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                )),
                            Icon(
                              semanticLabel: 'View full details on next page',
                              Icons.link_sharp,
                              color: AppColors.primaryColor,
                              size: 20.sp,
                            ),
                          ],
                        )),
                    Expanded(
                        child: Scrollbar(
                      interactive: true,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomerDetailsHeadingWidget(
                              title: 'Customer Code',
                            ),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel?.customerCode,
                            ),
                            const CustomerDetailsDividerWidget(),
                            //Customer Details
                            if (!widget.customermodel!.typeOfCompany
                                .toString()
                                .contains('Individual'))
                              const CustomerDetailsHeadingWidget(
                                title: 'Customer Name',
                              ),
                            if (!widget.customermodel!.typeOfCompany
                                .toString()
                                .contains('Individual'))
                              CustomerDetailsTextWidget(
                                data: widget.customermodel?.custName,
                              ),
                            if (!widget.customermodel!.typeOfCompany
                                .toString()
                                .contains('Individual'))
                              const CustomerDetailsDividerWidget(),
                            //Customer phone
                            if (!widget.customermodel!.typeOfCompany
                                .toString()
                                .contains('Individual'))
                              const CustomerDetailsHeadingWidget(
                                title: 'Customer Number',
                              ),
                            if (!widget.customermodel!.typeOfCompany
                                .toString()
                                .contains('Individual'))
                              CustomerDetailsTextWidget(
                                data: widget.customermodel?.custPhone,
                              ),
                            if (!widget.customermodel!.typeOfCompany
                                .toString()
                                .contains('Individual'))
                              const CustomerDetailsDividerWidget(),
                            // //Customer type
                            // const CustomerDetailsHeadingWidget(
                            //   title: 'Customer Type',
                            // ),
                            // CustomerDetailsTextWidget(
                            //   data: widget.customermodel?.customerType,
                            // ),
                            // const CustomerDetailsDividerWidget(),
    
                            const CustomerDetailsHeadingWidget(title: 'Zone'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.zone!.zoneName,
                            ),
                            const CustomerDetailsDividerWidget(),
                            // contact number
                            if (widget.customermodel!.typeOfCompany
                                .toString()
                                .contains('Individual'))
                              const CustomerDetailsHeadingWidget(
                                  title: 'Contact Name'),
                            if (widget.customermodel!.typeOfCompany
                                .toString()
                                .contains('Individual'))
                              CustomerDetailsTextWidget(
                                data: widget.customermodel!.custName,
                              ),
                            if (widget.customermodel!.typeOfCompany
                                .toString()
                                .contains('Individual'))
                              const CustomerDetailsDividerWidget(),
                            // contact number
                            if (widget.customermodel!.typeOfCompany
                                .toString()
                                .contains('Individual'))
                              const CustomerDetailsHeadingWidget(
                                  title: 'Contact Number'),
                            if (widget.customermodel!.typeOfCompany
                                .toString()
                                .contains('Individual'))
                              CustomerDetailsTextWidget(
                                data: widget.customermodel!.custPhone,
                              ),
                            if (widget.customermodel!.typeOfCompany
                                .toString()
                                .contains('Individual'))
                              const CustomerDetailsDividerWidget(),
                            // contact details
                            const CustomerDetailsHeadingWidget(
                                title: 'Customer Details'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel?.custAddress ?? 'N/A',
                              maxline: 5,
                            ),
                            const CustomerDetailsDividerWidget(),
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
