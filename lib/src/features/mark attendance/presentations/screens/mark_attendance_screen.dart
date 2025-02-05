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
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_state.dart';
import 'package:srinivasa_crm_new/src/features/offline_location_database_helper.dart';

import '../../../No Internet/screens/no_internet_screen.dart';
import '../../../Profile/presentations/cubit/profile_state.dart';
import 'package:http/http.dart' as http;


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
       _subscription = _connectivityHelper.onConnectivityChanged.listen((status) {
      if (status == ConnectivityResult.none) {
        if(context.mounted) {
        Navigator.pushAndRemoveUntil(context, ScaleRoute(screen: const  NoInternetScreen(offlinePage: OfflinePages.markattendance,)), (r) => false);

        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((c) async {
     await context.read<MarkAttendanceCubit>().getLastPunchInOutData();
     await context.read<ProfileCubit>().getLocalProfile();
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
  void didUpdateWidget(covariant  oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Add your custom logic here

    // if(widget != oldWidget) {
    //   Fluttertoast.showToast(msg: 'New Widget');
    // }
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
      // Permission.storage,

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
                     const platform = MethodChannel('com.srinivasa.crm');
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
                    : CommonButton(
                      callback: () async {
                        await HapticFeedback.mediumImpact();
                        if (state.lastPunchInResponseModel!.status ==
                            true) {
                          // PUNCH IN LOGIC
                        
                       if(context.mounted) {
                           await context
                              .read<MarkAttendanceCubit>()
                              .punchInLogic(
                                );
                       }
                        } else {
    
                         if(Platform.isAndroid) {
                           if(context.mounted) {
                            fetchLocationAndShowDialog(context);
                         }

                         if(Platform.isIOS) {
                           await context
                              .read<MarkAttendanceCubit>()
                              .punchOutLogic(
                                  );

                         }
                           
                          }
                              // PermissionStatus status = await Permission.location.request();
                    
                              // if(status.isGranted) {
                   
                    
                              // }else {
                              //   await Permission.location.request();
                              // }
                    
                    
                    
                         
                         
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
          }
          // Build your UI based on the state.
    //    return  state.loading == true ? CustomLoadingWidget() :
        },
      ),
    );
  }

Future<void> fetchLocationAndShowDialog(BuildContext context) async {
  try {
    bool isIosDevice = Platform.isIOS;
    if(isIosDevice) {

      List<Map<String, dynamic>>locations = await OfflineLocationDatabaseHelper.instance.fetchAllLocations();
            final List<Map<String, dynamic>> iosLocationArray = [];
              for(var iosLocaitn in locations) {
        iosLocationArray.add({
           'latitude': iosLocaitn['latitude'],
          'longitude': iosLocaitn['longitude'],
          'userDateTime': iosLocaitn['userDateTime'],
          'batteryStatus': iosLocaitn['batteryStatus'],
        }
        );
      } 
       if(context.mounted) {
      QuickAlert.show(context: context, type: QuickAlertType.info,
      title: 'Sync Data',
      text: "Please sync your data to ensure it is updated in the database.",
      confirmBtnColor: Colors.black,
      animType: QuickAlertAnimType.slideInUp,
      cancelBtnText: 'Later',
      confirmBtnText: 'Sync now',
       showCancelBtn: true,
      onCancelBtnTap: () async {
        if(Navigator.canPop(context)) {
          Navigator.pop(context);
          if(context.mounted) {
            QuickAlert.show(context: context, type: QuickAlertType.confirm,
            title: "Punch Out",
            confirmBtnColor: Colors.black,
            confirmBtnText: 'Proceed',
            onConfirmBtnTap: () async {
            await  context.read<ProfileCubit>().logout(context: context);
              
            }
            );
          }
        }
      },
      onConfirmBtnTap: () async {
        if(Navigator.canPop(context)) {
          Navigator.pop(context);
          if(context.mounted) {
            QuickAlert.show(context: context, type: QuickAlertType.loading);
            //! implement api code here
             final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? tokenValue = prefs.getString('token');
       final Uri url = Uri.parse('https://crmapitest.srinivasa.co:8446/crm_sfpl/se/locations-list');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Bearer $tokenValue',
        },
        body: jsonEncode({'locationsList': iosLocationArray}),
      );

      if(response.statusCode == 200 || response.statusCode == 201) {
          if(context.mounted) {
             await OfflineLocationDatabaseHelper.instance.deleteAllLocations();
           Fluttertoast.showToast(msg: 'All location updated to server successfully',backgroundColor: Colors.green,textColor: Colors.white)
;
           await context.read<ProfileCubit>().logout(context: context);

          
        }

      }else {
        if(context.mounted) {
          if(Navigator.canPop(context)) {
            Navigator.pop(context);
            if(context.mounted) {
              QuickAlert.show(context: context, type: QuickAlertType.error,title: 'Punch out failed',text: 'please try after some time');
            }
          }
        }

      }
      
            
          }
        }
        
      }
    );
    }
      
      
      
         }else {
          // android logic
           final String result = await const MethodChannel('com.srinivasa.crm').invokeMethod("location-data");
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

    if(context.mounted) {
      QuickAlert.show(context: context, type: QuickAlertType.info,
      title: 'Sync Data',
      text: "Please sync your data to ensure it is updated in the database.",
      confirmBtnColor: Colors.black,
      animType: QuickAlertAnimType.slideInUp,
      cancelBtnText: 'Later',
      confirmBtnText: 'Sync now',
       showCancelBtn: true,
      onCancelBtnTap: () async {
        if(Navigator.canPop(context)) {
          Navigator.pop(context);
          if(context.mounted) {
            QuickAlert.show(context: context, type: QuickAlertType.confirm,
            title: "Punch Out",
            confirmBtnColor: Colors.black,
            confirmBtnText: 'Proceed',
            onConfirmBtnTap: () async {
            await  context.read<ProfileCubit>().logout(context: context);
              
            }
            );
          }
        }
      },
      onConfirmBtnTap: () async {
        if(Navigator.canPop(context)) {
          Navigator.pop(context);
          if(context.mounted) {
            QuickAlert.show(context: context, type: QuickAlertType.loading);
            //! implement api code here
             final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? tokenValue = prefs.getString('token');
       final Uri url = Uri.parse('https://crmapitest.srinivasa.co:8446/crm_sfpl/se/locations-list');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Bearer $tokenValue',
        },
        body: jsonEncode({'locationsList': locationsArray}),
      );

      if(response.statusCode == 200 || response.statusCode == 201) {
          if(context.mounted) {
                  await platform.invokeMethod("deleteAllLocationData");

           await context.read<ProfileCubit>().logout(context: context);

          // if(Navigator.canPop(context)) {
          //   Navigator.pop(context);
          // }
          
        }

      }else {
        if(context.mounted) {
          if(Navigator.canPop(context)) {
            Navigator.pop(context);
            if(context.mounted) {
              QuickAlert.show(context: context, type: QuickAlertType.error,title: 'Punch out failed',text: 'please try after some time');
            }
          }
        }

      }
      
            
          }
        }
        
      }
    );
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
