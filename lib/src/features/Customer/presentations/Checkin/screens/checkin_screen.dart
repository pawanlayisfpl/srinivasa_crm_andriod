// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quickalert/quickalert.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/widgets/checkin_employe_dropdown_widget.dart';

import '../../../domain/model/post/checkin_post_model.dart';

class CheckinScreen extends StatefulWidget {
  final Customermodel customermodel;
  const CheckinScreen({
    super.key,
    required this.customermodel,
  });

  @override
  State<CheckinScreen> createState() => _CheckinScreenState();
}

class _CheckinScreenState extends State<CheckinScreen> {
  final TextEditingController _remarksController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.read<CheckinBloc>().add(const CheckinEvent.started());
      context.read<CheckinCubit>().getEmployeListLogic();
    });
    super.initState();
  }

  @override
  void dispose() {
    _remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Checkin'),
      ),
      body: BlocListener<CheckinCubit, CheckinState>(
        listener: (context, state) {
          if(state.isFailed) {
              QuickAlert.show(context: context,
              disableBackBtn: false,
               type: QuickAlertType.error, title: "(${state.apiFailedModel!.statusCode})${state.apiFailedModel!.message}", text: state.apiFailedModel!.errorMessage.toString());
          }else if(state.isCheckIn == true) {
            Navigator.pop(context);
            if(context.mounted) {
                QuickAlert.show(context: context,
              disableBackBtn: true,



               type: QuickAlertType.success, title: "Checkin", text: "Checkin Successfully");
            }
          }
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20.h),
              const CommonTextWidget(
                title: 'Please fill the details below',
                fontWeight: FontWeight.w500,
                textColor: Colors.grey,
              ),
              const Divider(),
              ListTile(
                dense: false,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.person),
                title: Text(widget.customermodel.customerName ?? 'N/A', maxLines: 1),
              ),
              const Divider(),
              10.verticalSpace,
             const  CheckinEmployeDropdownWidget(),
              20.verticalSpace,
              CommonTextfield(
                textEditingController: _remarksController,
                textInputType: TextInputType.multiline,
                maxLines: 5,
                onChanged: (value) {},
                validator: (value) {},
                labelText: 'Remarks',
                hintText: 'Enter your remarks',
                autovalidateMode: AutovalidateMode.disabled,
              ),
              20.verticalSpace,
              context.watch<CheckinCubit>().state.isLoading
                  ? CustomLoadingWidget()
                  : CommonButton(
                      callback: () async {
                // Assuming lastCheckinTime is in a valid DateTime format, e.g., ISO 8601
          String? lastCheckinTimeString = locator.get<KeyValueStorage>().sharedPreferences.getString(KeyValueStrings.checkinTime);
          log(lastCheckinTimeString ?? 'No last check in time found');
           HapticFeedback.mediumImpact();
             final locationServicesss = locator.get<CommonLocationServices>();
                                Position position = await locationServicesss.getUserCurrentPosition();
                                double lat = position.latitude;
                                double long = position.longitude;
                        
          
                        CheckinPostModel checkInPostModel = CheckinPostModel(
                          inTime: DateTime.now().toString(),
                          userIds: context
                              .read<CheckinCubit>()
                              .state
                              .selectedEmployeList
                              .map((e) => e.id!)
                              .toList(),
                          remarks: _remarksController.text,
                          customerName: widget.customermodel.customerName,
                          farmId: widget.customermodel.farm!.farmId.toString(),
                          customerid:
                              int.tryParse(widget.customermodel.farm!.customerId!) ?? 0,
                          latitude: lat.toString(),
                          langitude: long.toString(),
                        );
          
                        if (context.mounted) {
                          await context
                              .read<CheckinCubit>()
                              .checkInLogic(checkInPostModel: checkInPostModel,successCallback: () async {
                                context.read<AllCustomerCubit>().getAllCustomer();
                              });
                        }
          
          // if (lastCheckinTimeString != null) {
          //   DateTime lastCheckinTime = DateTime.parse(lastCheckinTimeString);
          //   DateTime currentTime = DateTime.now();
          //   Duration difference = currentTime.difference(lastCheckinTime);
          // // CHANGING THE TIME TO 10 MINUTES
          //   if (difference.inMinutes > 10) {
          //     // checkin logic
          //            HapticFeedback.mediumImpact();
          //                       double langitude = 0.0;
          //                       double latitude = 0.0;
          
          //                       CheckinPostModel checkInPostModel = CheckinPostModel(
          //                         inTime: DateTime.now().toString(),
          //                         userIds: context
          //                             .read<CheckinCubit>()
          //                             .state
          //                             .selectedEmployeList
          //                             .map((e) => e.id!)
          //                             .toList(),
          //                         remarks: _remarksController.text,
          //                         customerName: widget.customermodel.custName,
          //                         customerCode:
          //                             int.parse(widget.customermodel.customerCode ?? '0'),
          //                         latitude: latitude.toString(),
          //                         langitude: langitude.toString(),
          //                       );
          
          //                       if (mounted) {
          //                         await context
          //                             .read<CheckinCubit>()
          //                             .checkInLogic(checkInPostModel: checkInPostModel);
          //                       }
              
          //   } else {
          //     log('Less than 5 minutes have passed since the last check-in.');
          //     // MINUTES PENDING
          //   int minutesPending = 1 - difference.inMinutes;
          //   QuickAlert.show(
          //     context: context, 
          //     disableBackBtn: true,
          //     onConfirmBtnTap: () {
          //       if(context.mounted) {
          //         Navigator.pop(context);
          //       }
          //     },
          //     type: QuickAlertType.warning, 
          //     title: "Warning", 
          //     text: "You still have $minutesPending minutes remaining before you can check in again. Please wait for the required time to elapse."
          //   );    // Add your logic here for when less than 5 minutes have passed
          //   }
          // } else {
          //   log('No last check in time found, possibly first check-in.');
          //   // Handle the case for no last check-in time found
          //    // checkin logic
          //            HapticFeedback.mediumImpact();
          //                       double langitude = 0.0;
          //                       double latitude = 0.0;
          
          //                       CheckinPostModel checkInPostModel = CheckinPostModel(
          //                         inTime: DateTime.now().toString(),
          //                         userIds: context
          //                             .read<CheckinCubit>()
          //                             .state
          //                             .selectedEmployeList
          //                             .map((e) => e.id!)
          //                             .toList(),
          //                         remarks: _remarksController.text,
          //                         customerName: widget.customermodel.custName,
          //                         customerCode:
          //                             int.parse(widget.customermodel.customerCode ?? '0'),
          //                         latitude: latitude.toString(),
          //                         langitude: langitude.toString(),
          //                       );
          
          //                       if (mounted) {
          //                         await context
          //                             .read<CheckinCubit>()
          //                             .checkInLogic(checkInPostModel: checkInPostModel);
          //                       }
          // }
                     
                      },
                      title: "Check In")
            ],
          ),
        ),
      ).withSymetricPadding(horizontalPadding: 10.w),
    );
  }
}
