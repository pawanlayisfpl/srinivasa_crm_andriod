import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:srinivasa_crm_new/src/core/connection/internet_checker.dart';
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/screens/dashboard_screen.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/screens/mark_attendance_screen.dart';

import '../../../config/locator/locator.dart';
enum  OfflinePages{
  dashboard,
  markattendance,

}
class NoInternetScreen extends StatelessWidget {
final OfflinePages offlinePage;

  const NoInternetScreen({super.key, required this.offlinePage});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.signal_wifi_off,size: MediaQuery.of(context).size.height * 0.2,),
            const SizedBox(height: 30),
            const Text(
              'Oops!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'No Internet Connection',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Check your connection and try again.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: ()  async{
                // Retry or navigate to the previous screen

              bool isAvailable = await locator.get<InternetChecker>().hasInternet();

              if(isAvailable) {
                // Navigator.pop(context);
                switch (offlinePage) {
                  case OfflinePages.dashboard:
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardScreen()),
                        (route) => false);
                    break;
                  case OfflinePages.markattendance:
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MarkAttendanceScreen(isCheckedInScreen: true,)),
                        (route) => false);
                    break;
                }
              }else {
                Fluttertoast.showToast(msg: 'No Internet Available');
              }

              //   InternetConnectionChecker checker = InternetConnectionChecker()
              // ;
              // final bool = await checker.isActivelyChecking;
              
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 40,
                ),
              ),
              child: const Text(
                'Retry',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
