import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srinivasa_crm_new/shared/widgets/common_drawer_widget.dart';
import 'package:srinivasa_crm_new/src/common/services/notifications/common_notifications.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/widgets/dashboard_body_widget.dart';
import 'package:srinivasa_crm_new/src/features/Location%20Tracking/presentations/native_screen.dart';
import 'package:srinivasa_crm_new/src/features/No%20Internet/helper/connectivity_helper.dart';
import 'package:srinivasa_crm_new/src/features/No%20Internet/views/no_internet_screen.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/screens/mark_attendance_screen.dart';
import 'package:srinivasa_crm_new/src/features/offline_location_database_helper.dart';

import '../../../../../shared/presentations/Update Password/presentations/screens/update_password_screen.dart';
import '../../../../config/config.dart';
import '../../../../core/core.dart';
import 'package:http/http.dart' as http;




class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
    static const platform = MethodChannel('com.srinivasa.crm');
     final ConnectivityHelper _connectivityHelper = ConnectivityHelper();
  late StreamSubscription<ConnectivityResult> _subscription;










  @override
  void initState() {
    super.initState();
       _subscription = _connectivityHelper.onConnectivityChanged.listen((status) {
      if (status == ConnectivityResult.none) {
        if(context.mounted) {
        Navigator.pushAndRemoveUntil(context, ScaleRoute(screen:  const NoInternetScreen(offlinePage: OfflinePages.dashboard,)), (r) => false);

        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback( (time) async {
     await context.read<AlertCubit>().getAlerts();
     await startTracking();
      // await checkingPermissions();
      // await _handleScheduleNotificationsSetup();
      // await initializePushNotificationServices();
      

     
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
//   void showLogoutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           title: const Text('Are you sure you want to Logout?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // CANCEL button action
//               },
//               child: const Text(
//                 'CANCEL',
//                 style: TextStyle(color: AppColors.primaryColor),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                     Navigator.of(context).pop();


//                 if(Platform.isAndroid) {
//                    const platform = MethodChannel('com.srinivasa.crm');
//               await  platform.invokeMethod('stop');
//                 }
                      
               
//                 final localstorge = locator.get<KeyValueStorage>();
//                 final locationservices = locator.get<CommonLocationServices>();
//                 final postion = await locationservices.getUserCurrentPosition();
    
//                 // await Workmanager().cancelAll();
//                 PunchoutPostModel punchoutPostModel = PunchoutPostModel(latitude: postion.latitude.toString(), longitude: postion.longitude.toString());
//          await context.read<MarkAttendanceCubit>().punchOutLogic(punchoutPostModel: punchoutPostModel, isLogoutClicked: true);
//               await  localstorge.sharedPreferences.clear();
//            Fluttertoast.showToast(msg: "All Background services stopped");
//  await Navigator.pushNamedAndRemoveUntil(
//                     context, Routes.loginScreen, (route) => false);             
               
              
//               },
//               child: const Text('Yes',
//                   style: TextStyle(
//                       color: AppColors.primaryColor,
//                       fontWeight: FontWeight.bold)),
//             ),
//           ],
//         );
//       },
//     );
//   }

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Are you sure you want to Logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // CANCEL button action
            },
            child: const Text(
              'CANCEL',
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // Close the dialog immediately
              Navigator.of(context).pop();

              // Perform logout logic asynchronously
              if (Platform.isAndroid) {
                const platform = MethodChannel('com.srinivasa.crm');
                await platform.invokeMethod('stop');
              }

              final localStorage = locator.get<KeyValueStorage>();
             

              // Check if the context is still mounted before using it
              if (context.mounted) {
                await context.read<MarkAttendanceCubit>().punchOutLogic(
                 
                  isLogoutClicked: true,
                );
              }

              await localStorage.sharedPreferences.clear();
              Fluttertoast.showToast(msg: "All Background services stopped");

              // Check again if the context is still mounted before navigating
              if (context.mounted) {
                await Navigator.pushNamedAndRemoveUntil(
                  context, Routes.loginScreen, (route) => false,
                );
              }
            },
            child: const Text(
              'Yes',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
}

   
   
    return  DoubleTapToExit(
       snackBar: const SnackBar(
        content: Text('Tap again to exit !'),
      ),
      child: Scaffold(
        drawer: const CommonDrawerWidget(),
        appBar: AppBar(
      
          title: GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (c) => OfflineLocationScreen()));
              // Navigator.push(context, MaterialPageRoute(builder: (c) => SyncDataScreen()));
            },
            child: const CustomAppBarTitleWidget(title: "Dashboard",)),
          actions: [
             PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) async {
              if (value == "0") {
                Fluttertoast.showToast(msg: "App Permission clicked");
                Navigator.push(context, SlideRightRoute(screen: const NativeScreen()));
              } else if (value == "3") {
                // await Workmanager().cancelAll();
                // Fluttertoast.showToast(msg: "Sync list clicked");
                Navigator.push(context, SlideRightRoute(screen: const UpdatePasswordScreen()));
              
              } else if (value == "2") {
               if(context.mounted) {
                  QuickAlert.show(context: context, type: QuickAlertType.confirm, title: "Logout",text: "Are you sure?",confirmBtnText: "Yes",confirmBtnColor: Colors.black,onConfirmBtnTap: () {
                  context.read<ProfileCubit>().logout(context: context);
      
          });
               }
                // showLogoutDialog(context);
                                            // fetchLocationAndShowDialog(context);

                  //          if(Platform.isAndroid) {

                  //   // showDialog(context: context, builder: (c) => AlertSyncDialogScreen());


                  // }

          //          if(Platform.isIOS) {
                    
                    
          //         }

               
              
              }
            },
            itemBuilder: (BuildContext context) => [
              // const PopupMenuItem<String>(
              //   value: '0',
              //   child: Text('App Permission'),
              // ),
              // const PopupMenuDivider(),
              // const PopupMenuItem<String>(
              //   value: '1',
              //   child: Text('Sync List'),
              // ),
              // const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: '2',
                child: Text('Log Out'),
              ),
                 const PopupMenuDivider(),
                 const PopupMenuItem<String>(
                value: '3',
                child: Text('Update Password'),
              ),
            ],
            icon: const Icon(Icons.more_vert),
          ),
          ],
        ),
      
        body: const DashboardBodyWidget(),
      ),
      
    );
    
  }
  
  checkingPermissions() async  {
   await locator.get<CommonNotifications>().initNotifications();
   await locator.get<CommonNotifications>().requestNotificationPermission();

  Future<void> requestPermissions(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses;

  if (Platform.isIOS) {
    statuses = await [
      Permission.storage,
      // Permission.locationWhenInUse,
      // Permission.storage,
      // Add other iOS-specific permissions if needed
    ].request();
  } else {
    statuses = await [
      Permission.location,
      // Permission.storage,
      Permission.locationWhenInUse,
      Permission.ignoreBatteryOptimizations,
      // Add other Android-specific permissions if needed
    ].request();
  }
  // Check if all permissions are granted
  if (statuses.values.every((status) => status.isGranted)) {
    debugPrint("All permissions granted");
  } else {
    debugPrint("Not all permissions were granted");
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
    // await requestPermissions(context);
       // Request permissions before starting the service
      await platform.invokeMethod('start');
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
  
 Future<void> startTracking() async {
     if (Platform.isAndroid) {
                const platform = MethodChannel('com.srinivasa.crm');
                await platform.invokeMethod('start');
              }
 }

// Future<void> fetchLocationAndShowDialog(BuildContext context) async {
//   try {
//     // Fetch the location data from the native method
//     final String result = await MethodChannel('com.srinivasa.crm').invokeMethod("location-data");
//     final List<dynamic> data = json.decode(result);

//     // Prepare the locationsArray
//     final List<Map<String, dynamic>> locationsArray = [];
//     for (var location in data) {
//       locationsArray.add({
//         'latitude': location['latitude'],
//         'longitude': location['longitude'],
//         'userDateTime': location['userDateTime'],
//         'batteryStatus': location['batteryStatus'],
//       });
//     }

//     if(context.mounted) {
//       QuickAlert.show(context: context, type: QuickAlertType.info,
//       title: 'Sync Data',
//       text: "Please sync your data to ensure it is updated in the database.",
//       confirmBtnColor: Colors.black,
//       animType: QuickAlertAnimType.slideInUp,
//       cancelBtnText: 'Later',
//       confirmBtnText: 'Sync now',
//        showCancelBtn: true,
//       onCancelBtnTap: () async {
//         if(Navigator.canPop(context)) {
//           Navigator.pop(context);
//           if(context.mounted) {
//             QuickAlert.show(context: context, type: QuickAlertType.confirm,
//             title: "Logout",
//             confirmBtnColor: Colors.black,
//             confirmBtnText: 'Proceed',
//             onConfirmBtnTap: () async {
//             await  context.read<ProfileCubit>().logout(context: context);
              
//             }
//             );
//           }
//         }
//       },
//       onConfirmBtnTap: () async {
//         if(Navigator.canPop(context)) {
//           Navigator.pop(context);
//           if(context.mounted) {
//             QuickAlert.show(context: context, type: QuickAlertType.loading);
//             //! implement api code here
//              final SharedPreferences prefs = await SharedPreferences.getInstance();
//       final String? tokenValue = prefs.getString('token');
//        final Uri url = Uri.parse('https://crmapitest.srinivasa.co:8446/crm_sfpl/se/locations-list');

//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json; charset=utf-8',
//           'Authorization': 'Bearer $tokenValue',
//         },
//         body: jsonEncode({'locationsList': locationsArray}),
//       );

//       if(response.statusCode == 200 || response.statusCode == 201) {
//           if(context.mounted) {
//                   await platform.invokeMethod("deleteAllLocationData");

//            await context.read<ProfileCubit>().logout(context: context);

//           // if(Navigator.canPop(context)) {
//           //   Navigator.pop(context);
//           // }
          
//         }

//       }else {
//         if(context.mounted) {
//           if(Navigator.canPop(context)) {
//             Navigator.pop(context);
//             if(context.mounted) {
//               QuickAlert.show(context: context, type: QuickAlertType.error,title: 'Logout failed',text: 'please try after some time');
//             }
//           }
//         }

//       }
      
            
//           }
//         }
        
//       }
//     );
//     }

//     // Show AlertSyncDialogScreen as an AlertDialog
//     // showDialog(
//     //   context: context,
//     //   builder: (context) {
//     //     return AlertSyncDialogScreen(locationsArray: locationsArray);
//     //   },
//     // );
//   } catch (e) {
//     // Handle any errors by showing a Snackbar or an alert
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Failed to fetch location data: $e')),
//     );
//   }
// }


Future<void> fetchLocationAndShowDialog(BuildContext context) async {
  try {

    bool isIos = Platform.isIOS;

    if(isIos) {

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
            title: "Log out",
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
              QuickAlert.show(context: context, type: QuickAlertType.error,title: 'Log out failed',text: 'please try after some time');
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