// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/screens/dashboard_screen.dart';
import 'package:srinivasa_crm_new/src/features/No%20Internet/helper/connectivity_helper.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart';
import 'package:srinivasa_crm_new/src/features/login/presentation/screens/login_screen.dart';
import 'package:srinivasa_crm_new/src/features/offline_location_database_helper.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../Customer/presentations/Customer Create/presentation/screen/widget/cc_market_odometer.dart';
import '../../../Kyc/presentation/Kyc Upload/screens/image_full_screen.dart';
import '../../../No Internet/screens/no_internet_screen.dart';
import '../../../Profile/presentations/cubit/profile_state.dart';
import 'package:http/http.dart' as http;
import '../../domain/models/vechile_type_model.dart';
import '../cubit/cubit/mark_attendance_cubit.dart';
import '../cubit/cubit/mark_attendance_state.dart';

class MarkAttendanceScreen extends StatefulWidget {
  final bool? isCheckedInScreen;

  const MarkAttendanceScreen({
    super.key,
    this.isCheckedInScreen,
  });

  @override
  State<MarkAttendanceScreen> createState() => _MarkAttendanceScreenState();
}

class _MarkAttendanceScreenState extends State<MarkAttendanceScreen> {
  late StreamSubscription<ConnectivityResult> _subscription;
  final ConnectivityHelper _connectivityHelper = ConnectivityHelper();
  static const platform = MethodChannel('com.srinivasa.crm');

  @override
  void initState() {
    super.initState();
    context.read<MarkAttendanceCubit>().preInKMSNum = 0;
    context.read<MarkAttendanceCubit>().isPreDropDown = 0;
    _subscription = _connectivityHelper.onConnectivityChanged.listen((status) {
      if (status == ConnectivityResult.none) {
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
              context,
              ScaleRoute(
                  screen: const NoInternetScreen(
                      offlinePage: OfflinePages.markattendance)),
              (r) => false);
        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((c) async {
      await context.read<MarkAttendanceCubit>().getLastPunchInOutData();
      Future.delayed(const Duration(milliseconds: 100));
      await context.read<ProfileCubit>().getLocalProfile();
      context.read<MarkAttendanceCubit>().loadVehicles();
      //  showVersionUpdateBar(context);
      // await  checkingPermissions();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _connectivityHelper.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Add your custom logic here

    // if(widget != oldWidget) {
    //   Fluttertoast.showToast(msg: 'New Widget');
    // }
  }

  checkingPermissions() async {
    Future<void> requestPermissions(BuildContext context) async {
      Map<Permission, PermissionStatus> statuses;

      if (Platform.isIOS) {
        statuses = await [
          Permission.location,
          // Permission.locationWhenInUse,
          // Permission.storage,
          // Add other iOS-specific permissions if needed
        ].request();
      } else if (Platform.isAndroid) {
        statuses = await [
          // Permission.storage,

          Permission.location,
          Permission.locationWhenInUse,
          Permission.ignoreBatteryOptimizations,
          // Add other Android-specific permissions if needed
        ].request();
      } else {
        statuses = {};
      }

      // Check if all permissions are granted
      if (statuses.values.every((status) => status.isGranted)) {
        debugPrint("All permissions granted");
      } else {
        debugPrint("Not all permissions were granted");

        // Log which permissions were not granted
        statuses.forEach((permission, status) {
          if (!status.isGranted) {
            debugPrint('Permission not granted: $permission');
          }
        });
        // Handle the case where permissions are not granted

        // Show a dialog to request permissions
        if (Platform.isAndroid) {
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Permissions Required'),
                content: const Text(
                    'This app needs location and storage permissions to function properly. Please grant the required permissions.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Grant Permissions'),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await openAppSettings();
                    },
                  ),
                ],
              );
            },
          );
        }
      }
    }

    try {
      if (Platform.isAndroid) {
        await requestPermissions(context);
        // Request permissions before starting the service
        // await platform.invokeMethod('start');
      } else if (Platform.isIOS) {
        await requestPermissions(context);
      } else {
//         // / Periodic task registration
// Workmanager().registerPeriodicTask(
//     fetchBackground,
//    fetchBackground,
//     // When no frequency is provided the default 15 minutes is set.
//     // Minimum frequency is 15 min. Android will automatically change your frequency to 15 min if you have configured a lower frequency.
//     frequency: Duration(hours: 1),
// );
      }

      debugPrint('Service started');
    } on PlatformException catch (e) {
      debugPrint('Failed to start service: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const CustomAppBarTitleWidget(
            title: 'Mark Attendance',
          ),
        ),
        backgroundColor: Colors.white,
        body: BlocConsumer<MarkAttendanceCubit, MarkAttendanceState>(
            listener: (context, state) {
          if (state.punchInSuccess) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                title: "Punch In Success",
                showConfirmBtn: true,
                confirmBtnText: "Go to Dashboard",
                onConfirmBtnTap: () {
                  Navigator.pop(context);
                  HapticFeedback.vibrate();

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (c) => const DashboardScreen()),
                    (route) => false,
                  );
                },
                text: "You have successfully punched in");
          } else if (state.punchOutSuccess) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                onConfirmBtnTap: () async {
                  const platform = MethodChannel('com.srinivasa.crm');
                  platform.invokeMethod('stop');
                  Navigator.pop(context);
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        ScaleRoute(screen: const LoginScreen()),
                        (route) => false);
                  }
                },
                title: "Punch Out Success",
                text: "You have successfully punched out");
          } else if (state.loading) {
            // Handle loading state
          } else if (state.punchInFailure) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                title:
                    "${state.apiFailModel!.statusCode} ${state.apiFailModel!.message}",
                text: state.apiFailModel!.errorMessage.toString());
          } else if (state.punchOutFailure) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                title:
                    "${state.apiFailModel!.statusCode} ${state.apiFailModel!.message}",
                text: state.apiFailModel!.errorMessage.toString());
          } else if (state.loaded) {
            // Handle loaded state
            bool value = state.lastPunchInResponseModel != null &&
                state.lastPunchInResponseModel!.status == false;

            if (value && widget.isCheckedInScreen == true) {
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                    context,
                    ScaleRoute(screen: const DashboardScreen()),
                    (route) => false);
              }
            }
          }
        }, builder: (context, state) {
          if (state.loading) {
            // Show loading indicator
            return const CustomLoadingWidget();
          } else {
            // return Column(
            //     children: [
            //       Expanded(
            //         child: Center(
            //           child: Lottie.asset(
            //             'assets/lottie/map1.json',
            //             fit: BoxFit.fitHeight,
            //           ),
            //         ),
            //       ),
            //       20.verticalSpace,
            //       state.isSubmitting == true
            //           ? const CustomLoadingWidget()
            //           : CommonButton(
            //               callback: () async {
            //                 await HapticFeedback.mediumImpact();
            //                 if (state.lastPunchInResponseModel != null) {
            //                   if (state.lastPunchInResponseModel!.status ==
            //                       true) {
            //                     // PUNCH IN LOGIC

            //                     if (context.mounted) {
            //                       await context.read<MarkAttendanceCubit>().punchInLogic();
            //                     }

            //                   } else {
            //                     if (context.mounted) {
            //                       QuickAlert.show(
            //                           context: context,
            //                           type: QuickAlertType.confirm,
            //                           title: "Punch Out",
            //                           text: "Are you sure?",
            //                           confirmBtnText: "Yes",
            //                           confirmBtnColor: Colors.black,
            //                           onConfirmBtnTap: () {
            //                             context.read<ProfileCubit>().logout(context: context);
            //                           });
            //                     }

            //                     //  if(Platform.isAndroid) {
            //                     //    if(context.mounted) {
            //                     //     fetchLocationAndShowDialog(context);
            //                     //  }

            //                     //  if(Platform.isIOS) {
            //                     //    await context
            //                     //       .read<MarkAttendanceCubit>()
            //                     //       .punchOutLogic(
            //                     //           );

            //                     //  }

            //                     //   }
            //                     // PermissionStatus status = await Permission.location.request();

            //                     // if(status.isGranted) {

            //                     // }else {
            //                     //   await Permission.location.request();
            //                     // }
            //                   }
            //                 } else {
            //                   print("we dont find your last punch in values");
            //                 }
            //               },
            //               title: state.lastPunchInResponseModel != null &&
            //                       state.lastPunchInResponseModel?.status == true
            //                   ? "Punch In"
            //                   : "Punch Out",
            //             ).withSymetricPadding(horizontalPadding: 20.w),
            //       SizedBox(
            //         height: 0.1.sh,
            //       )
            //     ],
            //   );
            // Show other widgets

            /// odometer start
            if (state.dataState == 3) {
              return Column(
                children: [
                  //  Text(state.showInputError),
                  Expanded(
                    child: Center(
                      child: Lottie.asset(
                        'assets/lottie/map1.json',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  state.isSubmitting == true
                      ? const CustomLoadingWidget()
                      : CommonButton(
                          callback: () async {
                            await HapticFeedback.mediumImpact();
                            if (state.lastPunchInResponseModel != null) {
                              if (state.lastPunchInResponseModel!.status ==
                                  true) {
                                // PUNCH IN LOGIC

                                if (context.mounted) {
                                  await context
                                      .read<MarkAttendanceCubit>()
                                      .punchInLogic();
                                }
                              } else {
                                if (context.mounted) {
                                  QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.confirm,
                                      title: "Punch Out",
                                      text: "Are you sure?",
                                      confirmBtnText: "Yes",
                                      confirmBtnColor: Colors.black,
                                      onConfirmBtnTap: () {
                                        context
                                            .read<ProfileCubit>()
                                            .logout(context: context);
                                      });
                                }

                                //  if(Platform.isAndroid) {
                                //    if(context.mounted) {
                                //     fetchLocationAndShowDialog(context);
                                //  }

                                //  if(Platform.isIOS) {
                                //    await context
                                //       .read<MarkAttendanceCubit>()
                                //       .punchOutLogic(
                                //           );

                                //  }

                                //   }
                                // PermissionStatus status = await Permission.location.request();

                                // if(status.isGranted) {

                                // }else {
                                //   await Permission.location.request();
                                // }
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                      "We couldn't find your last punch-in record.");
                              print(
                                  "We couldn't find your last punch-in record.");
                            }
                          },
                          title: state.lastPunchInResponseModel != null &&
                                  state.lastPunchInResponseModel?.status == true
                              ? "Punch In"
                              : "Punch Out",
                        ).withSymetricPadding(horizontalPadding: 20.w),
                  SizedBox(
                    height: 0.1.sh,
                  )
                ],
              );
            } else if (state.dataState == 48) {
              return Container();
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  // color: Colors.red,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CustomHeadingTextWidget(
                            title: 'Vehicle Type',
                            textColor: AppColors.primaryColor,
                          ),
                          Text(
                            ' *',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Container(
                        width: double.infinity, // Responsive full width
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 2), // subtle shadow
                            ),
                          ],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<VechileItemsModel>(
                            isExpanded: true,
                            value: state.selectedVehicle,
                            hint: const Text("Select a vehicle"),
                            items: state.vehicleItems
                                .map((VechileItemsModel item) {
                              return DropdownMenuItem<VechileItemsModel>(
                                value: item,
                                child: Text(
                                  item.name,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              );
                            }).toList(),
                            onChanged: (context
                                        .read<MarkAttendanceCubit>()
                                        .isPreDropDown ==
                                    0)
                                ? (VechileItemsModel? selectedItem) {
                                    if (selectedItem != null) {
                                      context
                                          .read<MarkAttendanceCubit>()
                                          .selectVehicle(selectedItem);
                                    }
                                  }
                                : null,
                          ),
                        ),
                      ),

                      /// Image upload

                      Visibility(
                        visible: state.dataState == 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.verticalSpace,
                            Row(
                              children: [
                                const CustomHeadingTextWidget(
                                  title: 'Attachment',
                                  textColor: AppColors.primaryColor,
                                ),
                                Text(
                                  ' *',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            10.verticalSpace,
                            InkWell(
                              onTap: () {
                                HapticFeedback.lightImpact();
                              },
                              splashColor: Colors.grey[200],
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: ListTile(
                                  onTap: () {
                                    final isEmpty = context
                                        .read<MarkAttendanceCubit>()
                                        .state
                                        .imageLists
                                        .isEmpty;
                                    if (isEmpty) {
                                      pickImages(context);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: 'Single File Upload',
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white);
                                    }
                                  },
                                  dense: false,
                                  contentPadding: EdgeInsets.only(left: 10.w),
                                  leading: const Icon(Icons.image),
                                  title: const Text('Click to Open Camera',
                                      maxLines: 1),
                                ),
                              ),
                            ),
                            15.verticalSpace,
                            context
                                    .watch<MarkAttendanceCubit>()
                                    .state
                                    .imageLists
                                    .isEmpty
                                ? const SizedBox.shrink()
                                : IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 5,
                                            child: CommonTextWidget(
                                                title: context
                                                        .watch<
                                                            MarkAttendanceCubit>()
                                                        .state
                                                        .imageLists
                                                        .isEmpty
                                                    ? 'No files selected'
                                                    : 'Selected files: ${context.watch<MarkAttendanceCubit>().state.imageLists.length}',
                                                textColor: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                textSize: 12.sp)),
                                        Expanded(
                                            flex: 5,
                                            child: GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<
                                                          MarkAttendanceCubit>()
                                                      .clearImageLists();
                                                },
                                                child: CommonTextWidget(
                                                  title: 'Clear All',
                                                  textColor: Colors.red,
                                                  textSize: 12.sp,
                                                  align: TextAlign.end,
                                                  fontWeight: FontWeight.bold,
                                                )))
                                      ],
                                    ),
                                  ),
                            context
                                    .watch<MarkAttendanceCubit>()
                                    .state
                                    .imageLists
                                    .isEmpty
                                ? const SizedBox.shrink()
                                : 10.verticalSpace,
                            context
                                    .watch<MarkAttendanceCubit>()
                                    .state
                                    .imageLists
                                    .isEmpty
                                ? const SizedBox.shrink()
                                : SizedBox(
                                    height: 0.25.sh,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (c, i) {
                                        return InkWell(
                                          splashColor: Colors.grey[200],
                                          onTap: () {
                                            HapticFeedback.lightImpact();
                                            Navigator.push(
                                                context,
                                                ScaleRoute(
                                                    screen: ImageFullScreen(
                                                  bytes: context
                                                      .read<
                                                          MarkAttendanceCubit>()
                                                      .state
                                                      .imageLists[i]
                                                      .imageByes,
                                                )));
                                          },
                                          child: Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                                child: Image.memory(
                                                  context
                                                      .watch<
                                                          MarkAttendanceCubit>()
                                                      .state
                                                      .imageLists[i]
                                                      .imageByes,
                                                  height: 0.25.sh,
                                                  width: 0.45.sw,
                                                  fit: BoxFit.cover,
                                                ),
                                              ).withSymetricPadding(
                                                  horizontalPadding: 8.w),
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<
                                                          MarkAttendanceCubit>()
                                                      .removeImage(
                                                          image: context
                                                              .read<
                                                                  MarkAttendanceCubit>()
                                                              .state
                                                              .imageLists[i]);
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 15.w, top: 10.h),
                                                  height: 30.h,
                                                  width: 30.w,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                      child: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                    size: 20.sp,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      itemCount: context
                                          .watch<MarkAttendanceCubit>()
                                          .state
                                          .imageLists
                                          .length,
                                    ),
                                  ),
                          ],
                        ),
                      ),

                      /// image completed
                      Visibility(
                        visible: state.dataState == 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                             Row(
                              children: [
                                const CustomHeadingTextWidget(
                                  title: 'Odometer Reading',
                                  textColor: AppColors.primaryColor,
                                ),
                                Text(
                                  ' *',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ), 
                            // const CommonTextFieldHeadingWidget(
                            //   title: "Odometer Reading",
                            //   isRequired: true,
                            // ),
                            const CCOdometerTextFieldWidget(),
                          ],
                        ),
                      ),
                      10.verticalSpace,
                      Visibility(
                          visible: context.read<MarkAttendanceCubit>().preInKMSNum !=
                                0 &&
                              context
                                      .read<MarkAttendanceCubit>()
                                      .pinchinTimeOdometerValue
                                      .toString() !=
                                  "null",
                          child: Row(
                            children: [
                              CommonTextWidget(
                                title: "Distance Travelled : ",
                                fontWeight: FontWeight.bold,
                                textSize: 14.sp,
                                textColor: AppColors.hintHeadingColor,
                                letterSpacing: 1,
                              ),
                              Expanded(
                                child: CommonTextWidget(
                                  over: TextOverflow.visible,
                                  title:
                                      "${context.read<MarkAttendanceCubit>().pinchinTimeOdometerValue.toString()} KMS",
                                  fontWeight: FontWeight.bold,
                                  textSize: 16.sp,
                                  textColor: AppColors.primaryColor,
                                  letterSpacing: 1,
                                  maxLines: null,
                                ),
                              )
                            ],
                          )),
                          10.verticalSpace,
                      Visibility(
                        visible:
                            context.read<MarkAttendanceCubit>().preInKMSNum !=
                                0,
                        child: Row(
                          children: [
                            CommonTextWidget(
                              title: "Punch In-time Odometer Reading : ",
                              fontWeight: FontWeight.bold,
                              textSize: 14.sp,
                              textColor: AppColors.hintHeadingColor,
                              letterSpacing: 1,
                            ),
                            Expanded(
                              child: CommonTextWidget(
                                over: TextOverflow.visible,
                                title: context
                                    .read<MarkAttendanceCubit>()
                                    .preInKMSNum
                                    .toString(),
                                fontWeight: FontWeight.bold,
                                textSize: 16.sp,
                                textColor: AppColors.primaryColor,
                                letterSpacing: 1,
                                maxLines: null,
                              ),
                            )
                          ],
                        ),
                      ),
                      (context.read<MarkAttendanceCubit>().preInKMSNum != 0)
                          ? 20.verticalSpace
                          : const SizedBox(),
                      state.isSubmitting
                          ? const CustomLoadingWidget()
                          : (state.dataState == 1)
                              ? CommonButton(
                                  callback: () async {
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.info,
                                      title: "Warning",
                                      text:
                                          "Are you sure want to Submit Vehicle Details?",
                                      showCancelBtn: true,
                                      confirmBtnText: 'Yes',
                                      onConfirmBtnTap: () async {
                                        if (context.mounted) {
                                          bool isNextShow = context
                                              .read<MarkAttendanceCubit>()
                                              .vehicleSubmiting(context);
                                          (isNextShow)
                                              ? {Navigator.pop(context)}
                                              : null;
                                        //  (isNextShow)
                                        //       ? ScaffoldMessenger.of(context)
                                        //       .showSnackBar(
                                        //     SnackBar(
                                        //       backgroundColor: Colors.red,
                                        //       content: Text(
                                        //           'Ensure the Punch-in odometer reading is not less than the Punch-out reading.',style: TextStyle(color: Colors.white,fontSize: 18)),
                                        //       duration: Duration(seconds: 10),
                                        //     ),
                                        //   ):null;
                                        }
                                      },
                                      onCancelBtnTap: () {
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                  title: "Next")
                              : SizedBox(),
                      10.verticalSpace,
                    ],
                  ),
                ),
              );
            }

            /// odometer end
            // Build your UI based on the state.
            //    return  state.loading == true ? CustomLoadingWidget() :
          }
        }));
  }

  void pickImages(BuildContext context) {
    HapticFeedback.lightImpact();
    if (context.mounted) {
      showDialog(
          context: context,
          builder: (c) => AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

                // title: CommonTextWidget(title: 'Pick image from ',align: TextAlign.center,),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        context
                            .read<MarkAttendanceCubit>()
                            .pickFromCameraLogic();
                      },
                      title: const CommonTextWidget(title: 'Camera'),
                      leading: const Icon(Icons.camera_alt),
                    ),
                    // const Divider(),
                    // ListTile(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //     // context.read<CheckinCubit>().pickSingleImageFromGallery();
                    //     context.read<MarkAttendanceCubit>().pickAllImages();
                    //   },
                    //   title: const CommonTextWidget(title: 'Gallery'),
                    //   leading: const Icon(Icons.image),
                    // ),
                    const Divider(),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close"),
                    )
                  ],
                ),
              ));
    }
  }

  Future<void> fetchLocationAndShowDialog(BuildContext context) async {
    try {
      bool isIosDevice = Platform.isIOS;
      if (isIosDevice) {
        List<Map<String, dynamic>> locations =
            await OfflineLocationDatabaseHelper.instance.fetchAllLocations();
        final List<Map<String, dynamic>> iosLocationArray = [];
        for (var iosLocaitn in locations) {
          iosLocationArray.add({
            'latitude': iosLocaitn['latitude'],
            'longitude': iosLocaitn['longitude'],
            'userDateTime': iosLocaitn['userDateTime'],
            'batteryStatus': iosLocaitn['batteryStatus'],
          });
        }
        if (context.mounted) {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.info,
              title: 'Sync Data',
              text:
                  "Please sync your data to ensure it is updated in the database.",
              confirmBtnColor: Colors.black,
              animType: QuickAlertAnimType.slideInUp,
              cancelBtnText: 'Later',
              confirmBtnText: 'Sync now',
              showCancelBtn: true,
              onCancelBtnTap: () async {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                  if (context.mounted) {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.confirm,
                        title: "Punch Out",
                        confirmBtnColor: Colors.black,
                        confirmBtnText: 'Proceed',
                        onConfirmBtnTap: () async {
                          await context
                              .read<ProfileCubit>()
                              .logout(context: context);
                        });
                  }
                }
              },
              onConfirmBtnTap: () async {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                  if (context.mounted) {
                    QuickAlert.show(
                        context: context, type: QuickAlertType.loading);
                    //! implement api code here
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final String? tokenValue = prefs.getString('token');
                    final Uri url = Uri.parse(
                        'https://crmapitest.srinivasa.co:8446/crm_sfpl/se/locations-list');

                    final response = await http.post(
                      url,
                      headers: {
                        'Content-Type': 'application/json; charset=utf-8',
                        'Authorization': 'Bearer $tokenValue',
                      },
                      body: jsonEncode({'locationsList': iosLocationArray}),
                    );

                    if (response.statusCode == 200 ||
                        response.statusCode == 201) {
                      if (context.mounted) {
                        await OfflineLocationDatabaseHelper.instance
                            .deleteAllLocations();
                        Fluttertoast.showToast(
                            msg: 'All location updated to server successfully',
                            backgroundColor: Colors.green,
                            textColor: Colors.white);
                        await context
                            .read<ProfileCubit>()
                            .logout(context: context);
                      }
                    } else {
                      if (context.mounted) {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                          if (context.mounted) {
                            QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                title: 'Punch out failed',
                                text: 'please try after some time');
                          }
                        }
                      }
                    }
                  }
                }
              });
        }
      } else {
        // android logic
        final String result = await const MethodChannel('com.srinivasa.crm')
            .invokeMethod("location-data");
        final List<dynamic> data = json.decode(result);

        // Prepare the locationsArray
        final List<Map<String, dynamic>> locationsArray = [];
        for (var location in data) {
          locationsArray.add({
            'latitude': location['latitude'],
            'longitude': location['longitude'],
            'userDateTime': location['userDateTime'],
            'batteryStatus': location['batteryStatus'],
          });
        }

        if (context.mounted) {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.info,
              title: 'Sync Data',
              text:
                  "Please sync your data to ensure it is updated in the database.",
              confirmBtnColor: Colors.black,
              animType: QuickAlertAnimType.slideInUp,
              cancelBtnText: 'Later',
              confirmBtnText: 'Sync now',
              showCancelBtn: true,
              onCancelBtnTap: () async {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                  if (context.mounted) {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.confirm,
                        title: "Punch Out",
                        confirmBtnColor: Colors.black,
                        confirmBtnText: 'Proceed',
                        onConfirmBtnTap: () async {
                          await context
                              .read<ProfileCubit>()
                              .logout(context: context);
                        });
                  }
                }
              },
              onConfirmBtnTap: () async {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                  if (context.mounted) {
                    QuickAlert.show(
                        context: context, type: QuickAlertType.loading);
                    //! implement api code here
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final String? tokenValue = prefs.getString('token');
                    final Uri url = Uri.parse(
                        'https://crmapitest.srinivasa.co:8446/crm_sfpl/se/locations-list');

                    final response = await http.post(
                      url,
                      headers: {
                        'Content-Type': 'application/json; charset=utf-8',
                        'Authorization': 'Bearer $tokenValue',
                      },
                      body: jsonEncode({'locationsList': locationsArray}),
                    );

                    if (response.statusCode == 200 ||
                        response.statusCode == 201) {
                      if (context.mounted) {
                        await platform.invokeMethod("deleteAllLocationData");

                        await context
                            .read<ProfileCubit>()
                            .logout(context: context);

                        // if(Navigator.canPop(context)) {
                        //   Navigator.pop(context);
                        // }
                      }
                    } else {
                      if (context.mounted) {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                          if (context.mounted) {
                            QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                title: 'Punch out failed',
                                text: 'please try after some time');
                          }
                        }
                      }
                    }
                  }
                }
              });
        }
      }

      // Fetch the location data from the native method

      // Show AlertSyncDialogScreen as an AlertDialog
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return AlertSyncDialogScreen(locationsArray: locationsArray);
      //   },
      // );
    } catch (e) {
      // Handle any errors by showing a Snackbar or an alert
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch location data: $e')),
      );
    }
  }
}

class CustomAppBarTitleWidget extends StatelessWidget {
  final String title;
  const CustomAppBarTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonTextWidget(
          title: title,
          textColor: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        Expanded(
          flex: 6,
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return state.map(
                  initial: (l) => const CustomLoadingWidget(),
                  loading: (l) => const CustomLoadingWidget(),
                  loadedLocal: (value) => CommonTextWidget(
                      title: value.profileResponseModel.userModel!.username
                              ?.toCapitalize() ??
                          "",
                      maxLines: 1,
                      align: TextAlign.right,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w500),
                  error: (e) => const Text('No name found'),
                  logout: (l) => const Text(""));
            },
          ),
        )
      ],
    );
  }
}
