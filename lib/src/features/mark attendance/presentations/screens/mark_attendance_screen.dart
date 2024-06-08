import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_state.dart';

import '../../../../config/config.dart';

class MarkAttendanceScreen extends StatefulWidget {
  const MarkAttendanceScreen({super.key});

  @override
  State<MarkAttendanceScreen> createState() => _MarkAttendanceScreenState();
}

class _MarkAttendanceScreenState extends State<MarkAttendanceScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((c) async {
      locator.get<MarkAttendanceCubit>().getLastPunchInOutData();
      //TODO: CALL THE LOCAL PROFILE LOAD FUNCITON ALSO HERE
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Mark Attendance'),),
      backgroundColor: Colors.white,
      body: BlocConsumer<MarkAttendanceCubit, MarkAttendanceState>(
  listener: (context, state) {
    // Handle state changes that don't require rebuilding the UI.
    // For example, showing a SnackBar, navigating to another screen, etc.
    state.maybeMap(null ,error : (failed) {
      // return Fluttertoast.showToast(msg: failed.toString());
      return QuickAlert.show(context: context, type: QuickAlertType.error,
      text: failed.message.toString()
      
      );
    }, orElse: () {});
   
  },
  builder: (context, state) {
    // Build your UI based on the state.
   return Column(children: [
    Expanded(
      child: Center(
        child: Lottie.asset('assets/lottie/map1.json',fit: BoxFit.fitHeight, ),
      ),
    ),
    20.verticalSpace,
CommonButton(
  callback: () async {
    await context.read<MarkAttendanceCubit>().getLastPunchInOutData();
  },
  title: state.map((value) {
    return "";
  }, initial: (i) => "", loaded: (loaded) => loaded.lastPunchInResponseModel.status == true ? "Punch In" : "Punch Out", loading: (l) => "Loading", error: (e) => "Error", punchInSuccess: (c) => "", punchInFailure: (c) => "", punchOutSuccess: (c) => "", punchOutFailure: (c) =>""),
).withSymetricPadding(horizontalPadding: 20.w), 

   SizedBox(height: 0.1.sh,)
   ],);
  },
),
    );
  }
}
