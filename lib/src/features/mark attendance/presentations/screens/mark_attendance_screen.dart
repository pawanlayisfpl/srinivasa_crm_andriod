// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quickalert/quickalert.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/config/locator/locator.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/screens/dashboard_screen.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart';
import 'package:srinivasa_crm_new/src/features/login/presentation/screens/login_screen.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/domain.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_state.dart';

import '../../../Profile/presentations/cubit/profile_state.dart';

class MarkAttendanceScreen extends StatefulWidget {
    final bool? isCheckedInScreen;

  const MarkAttendanceScreen({
    Key? key,
    this.isCheckedInScreen,
  }) : super(key: key);

  @override
  State<MarkAttendanceScreen> createState() => _MarkAttendanceScreenState();
}

class _MarkAttendanceScreenState extends State<MarkAttendanceScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((c) async {
      context.read<MarkAttendanceCubit>().getLastPunchInOutData();
      context.read<ProfileCubit>().getLocalProfile();
      // checkingPermissions();
  
    });
  }
   checkingPermissions() async  {
  
  Future<void> requestPermissions(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses;

  if (Platform.isIOS) {
    statuses = await [
      Permission.location,
      // Permission.locationWhenInUse,
      // Permission.storage,
      // Add other iOS-specific permissions if needed
    ].request();
  } else if(Platform.isAndroid) {
 statuses = await [
      Permission.storage,

      Permission.location,
      Permission.locationWhenInUse,
      Permission.ignoreBatteryOptimizations,
      // Add other Android-specific permissions if needed
    ].request();
  }
  else {
    statuses = {};
   
  }

  // Check if all permissions are granted
  if (statuses.values.every((status) => status.isGranted)) {
    log("All permissions granted");
  } else {
    log("Not all permissions were granted");


  // Log which permissions were not granted
  statuses.forEach((permission, status) {
    if (!status.isGranted) {
      log('Permission not granted: $permission');
    }
  });
    // Handle the case where permissions are not granted

    // Show a dialog to request permissions
   if(Platform.isAndroid) {
     showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: const Text('Permissions Required'),
          content: const Text('This app needs location and storage permissions to function properly. Please grant the required permissions.'),
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
      if(Platform.isAndroid) {
    await requestPermissions(context);
       // Request permissions before starting the service
      // await platform.invokeMethod('start');
      }else if(Platform.isIOS) {
        await requestPermissions(context);

      }
      
      else {
//         // / Periodic task registration
// Workmanager().registerPeriodicTask(
//     fetchBackground, 
//    fetchBackground, 
//     // When no frequency is provided the default 15 minutes is set.
//     // Minimum frequency is 15 min. Android will automatically change your frequency to 15 min if you have configured a lower frequency.
//     frequency: Duration(hours: 1),
// );
      }
  
      print('Service started');
    } on PlatformException catch (e) {
      print('Failed to start service: ${e.message}');
    }
  
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomAppBarTitleWidget(title: 'Mark Attendance',),
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
                  );                },
                text: "You have successfully punched in");

          } else if (state.punchOutSuccess) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                onConfirmBtnTap:  () async {
                     const platform = MethodChannel('com.example.srinivasa_crm_new');
                platform.invokeMethod('stop');
                  Navigator.pop(context);
                  if(context.mounted) {
                    Navigator.pushAndRemoveUntil(context, ScaleRoute(screen: const LoginScreen()),(route) => false);
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
                title: "${state.apiFailModel!.statusCode} ${state.apiFailModel!.message}",
                text: state.apiFailModel!.errorMessage.toString());
          } else if (state.punchOutFailure) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                title: "${state.apiFailModel!.statusCode} ${state.apiFailModel!.message}",
                text: state.apiFailModel!.errorMessage.toString());
          }else if(state.loaded) {
            // Handle loaded state
            bool value = state.lastPunchInResponseModel != null &&
                state.lastPunchInResponseModel!.status == false;

                if(value  && widget.isCheckedInScreen == true) {
                  if(context.mounted) {
                    Navigator.pushAndRemoveUntil(context, ScaleRoute(screen: const DashboardScreen()),(route) => false);
                  }
                }
            
          }
        },
        builder: (context, state) {
          if (state.loading) {
            // Show loading indicator
            return const CustomLoadingWidget();
          } else {
            // Show other widgets
            return Column(
              children: [
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
                    : GestureDetector(
                        onDoubleTap: () async {
                          // await context.read<MarkAttendanceCubit>().getLastPunchInOutData();
                        },
                        child: CommonButton(
                          callback: () async {
                            await HapticFeedback.mediumImpact();
                            if (state.lastPunchInResponseModel!.status ==
                                true) {
                              // PUNCH IN LOGIC
                              final locationServicesss = locator.get<CommonLocationServices>();
                              await locationServicesss.determinePosition();
                              Position position = await locationServicesss.getUserCurrentPosition();
                              double lat = position.latitude;
                              double long = position.longitude;
                          

                              PunchInPostModel punchInPostModel =
                                  PunchInPostModel(
                                latitude: lat.toString(),
                                longitude: long.toString(),
                              );
                           if(context.mounted) {
                               await context
                                  .read<MarkAttendanceCubit>()
                                  .punchInLogic(
                                      punchInPostModel: punchInPostModel);
                           }
                            } else {
                                  PermissionStatus status = await Permission.location.request();

                                  if(status.isGranted) {
  final locationServicesss = locator.get<CommonLocationServices>();
                              Position position = await locationServicesss.getUserCurrentPosition();
                              double lat = position.latitude;
                              double long = position.longitude;
                              log(lat.toString());
                              log(long.toString());
                               PunchoutPostModel punchoutPostModel =
                                  PunchoutPostModel(
                                      latitude: lat.toString(), longitude:long.toString());
                              if(context.mounted) {
                                await context
                                  .read<MarkAttendanceCubit>()
                                  .punchOutLogic(
                                      punchoutPostModel: punchoutPostModel);
                              }

                                  }else {
                                    await Permission.location.request();
                                  }



                             
                             
                            }
                          },
                          title: state.lastPunchInResponseModel != null &&
                                  state.lastPunchInResponseModel?.status == true
                              ? "Punch In"
                              : "Punch Out",
                        ).withSymetricPadding(horizontalPadding: 20.w),
                      ),
                SizedBox(
                  height: 0.1.sh,
                )
              ],
            );
          }
          // Build your UI based on the state.
//    return  state.loading == true ? CustomLoadingWidget() :
        },
      ),
    );
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
         CommonTextWidget(title: title,textColor: Colors.white,fontWeight: FontWeight.w500,),
       Expanded(flex: 6,
         child: BlocBuilder<ProfileCubit, ProfileState>(
           builder: (context, state) {
             return state.map(initial: (l) => const CustomLoadingWidget(), loading: (l) => const CustomLoadingWidget(), loadedLocal: (value) => CommonTextWidget(title: value.profileResponseModel.userModel!.username?.toCapitalize() ?? "",maxLines: 1,align: TextAlign.right,textColor: Colors.white,fontWeight: FontWeight.w500), error: (e) => const Text('No name found'), logout: (l) =>  const Text(""));
           },
         ),
       )
      ],
    );
  }
}
