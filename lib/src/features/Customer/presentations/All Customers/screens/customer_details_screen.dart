
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/screens/check_out_screen.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/screens/checkin_screen.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/screen/update_customer_form_screen.dart';

import '../../../../../config/config.dart';
import '../../../domain/model/get/customer_model.dart';
import '../../Checkin/cubit/checkin_cubit.dart';

class CustomerDetailsScreen extends StatefulWidget {
  final Customermodel? customermodel;
  

  const CustomerDetailsScreen({
    super.key,
    this.customermodel,
  });

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
        actions:  [
          
          IconButton(onPressed: () {

            
            // UpdateCustomerModel updateCustomerModel = UpdateCustomerModel(farmId: 12, customerId: "customerId", farmName: "farmName", customerName: "customerName", customerPhone: "customerPhone",  title: "title", email: "email", customerType: true  , addressLine2: "addressLine2", creditLimit: 500  , primarySourceId: 1, zoneId: " ", kycStatus: "kycStatus", countryId: 1, stateId: "1", districtId: "2", cityId: 1, localityId: 1, mandal: "mandal", postalCode: "postalCode", address: "address", isIndividual: false, isOrganization: false, contactPerson: "contactPerson", mobile: "mobile", alternateContact: "alternateContact", farmCapacity: 500, faxNo: "faxNo", divisionId: [], assignTo: 123);
            if(context.mounted) {
              Navigator.push(context, ScaleRoute(screen: CustomerUpdateForm(farmid: widget.customermodel?.farm?.farmId.toString())));
            }
          }, icon: const Icon(Icons.edit)),
          const SizedBox(width: 10,)
        ],
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
                              data: widget.customermodel?.farm!.farmName ?? "N/A",
                            ),
                            const CustomerDetailsDividerWidget(),
                             10.verticalSpace,
                                const CustomerDetailsHeadingWidget(
                              title: 'Customer Location',
                            ),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel?.farm!.custLocation ?? 'N/A',  
                            ),
                            const CustomerDetailsDividerWidget(),
                              10.verticalSpace,
      const CustomerDetailsHeadingWidget(
        title: 'Customer Zone',
      ),
      CustomerDetailsTextWidget(
        data: widget.customermodel?.farm?.custZone ?? 'N/A',
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
                              title: 'Contact Person',
                            ),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel?.farm?.contactPerson.toString(),  
                            ),
                            const CustomerDetailsDividerWidget(),
                              10.verticalSpace,
                              const CustomerDetailsHeadingWidget(
                              title: 'Contact Person Number',
                            ),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel?.farm!.contPersContactNo.toString(),
                            ),
                            const CustomerDetailsDividerWidget(),
                               10.verticalSpace,
                              const CustomerDetailsHeadingWidget(
                              title: 'Contact Person Alternate Number',
                            ),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel?.farm!.contPersAltContNo ?? "N/A",
                            ),
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                          
                            const CustomerDetailsHeadingWidget(title: 'Country'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.custCountry,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
    
                            const CustomerDetailsHeadingWidget(title: 'State Code'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.custStateCode,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'Customer Address'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.custAddress,
                              maxline: 5,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'Postal Code'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.custPostal.toString(),
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'City'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.custCity,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'Customer Credit Limit'),
                            CustomerDetailsTextWidget(
                              maxline: 10,
                              
                              data: widget.customermodel!.farm!.custCreditLimit,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'Customer Kyc Status'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.custStatus,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'Customer Code'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.customerCode,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'Location Code'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.locationCode,
                            ),

                                const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                              const CustomerDetailsHeadingWidget(title: 'Organization'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.isOrganization == true ? "Yes" : "No",
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                                const CustomerDetailsHeadingWidget(title: 'Longtitude'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.longitude,
                            ),
                           
                            const CustomerDetailsDividerWidget(),
                            10.verticalSpace,
                                const CustomerDetailsHeadingWidget(title: 'Latitude'),
                            CustomerDetailsTextWidget(
                              data: widget.customermodel!.farm!.latitude,
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
    super.key,
    this.data,
    this.maxline,
  });

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