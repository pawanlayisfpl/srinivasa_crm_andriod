import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:srinivasa_crm_new/shared/widgets/common_drawer_widget.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/widgets/dashboard_body_widget.dart';
import 'package:srinivasa_crm_new/src/features/Location%20Tracking/presentations/native_screen.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/screens/mark_attendance_screen.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../../mark attendance/domain/domain.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
    static const platform = MethodChannel('com.example.srinivasa_crm_new');


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback( (time) async {
      context.read<AlertCubit>().getAlerts();

     
    });
  }
  @override
  Widget build(BuildContext context) {
    
  void _showLogoutDialog(BuildContext context) {
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
                // Handle LOGOUT button action
                // You can add your logout logic here
                final localstorge = locator.get<KeyValueStorage>();

                // await Workmanager().cancelAll();
                // TODO: IMPLEENTED FAKE LAT AND LONG
                PunchoutPostModel punchoutPostModel = PunchoutPostModel(latitude: 0.0.toString(), longitude: 0.0.toString());
                await context.read<MarkAttendanceCubit>().punchOutLogic(punchoutPostModel: punchoutPostModel);
              
                Fluttertoast.showToast(msg: "All Background services stopped");
              await  localstorge.sharedPreferences.clear();

              if(context.mounted) {
                Navigator.of(context).pop(); // Close the dialog

              }
                if(context.mounted) {
                   Navigator.pushNamedAndRemoveUntil(
                    context, Routes.loginScreen, (route) => false);
                }
              },
              child: const Text('Yes',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
    return PopScope(
      onPopInvoked: (bool? val) async{
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text("Do you want to exit?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("NO")),
                    TextButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: const Text("YES"))
                  ],
                ));
      },
      child: Scaffold(
        drawer: CommonDrawerWidget(),
        appBar: AppBar(
      
          title: const CustomAppBarTitleWidget(title: "Dashboard",),
          actions: [
             PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) async {
              if (value == "0") {
                Fluttertoast.showToast(msg: "App Permission clicked");
                Navigator.push(context, SlideRightRoute(screen: NativeScreen()));
              } else if (value == "1") {
                // await Workmanager().cancelAll();
                // Fluttertoast.showToast(msg: "Sync list clicked");
              
              } else if (value == "2") {
                _showLogoutDialog(context);
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: '0',
                child: Text('App Permission'),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: '1',
                child: Text('Sync List'),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: '2',
                child: Text('Signout'),
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
}