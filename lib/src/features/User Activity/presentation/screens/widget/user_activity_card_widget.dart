// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../../data/model/get/user_activity_model.dart';

class UserActivityCardWidget extends StatelessWidget {
  final RepTravelLogsData repTravelLogsData;
  const UserActivityCardWidget({
    super.key,
    required this.repTravelLogsData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      color: Colors.white,
      child: SizedBox(
        height: 0.16.sh,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10.w),
            Expanded(
              flex: 1,
              child: Transform.scale(
                scale: 2.0,
                child: const Icon(
                  Icons.location_on,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              flex: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextWidget(
                    title: repTravelLogsData.customerName ?? '',
                    fontWeight: FontWeight.w500,
                  ),
                  CommonTextWidget(
                    title: repTravelLogsData.customerAddress ?? "",
                    textSize: 14.sp,
                  ),
                  CommonTextWidget(
                    title: "Checkin Time: ${DateFormat.yMd().add_jm().format(DateTime.parse(repTravelLogsData.checkInTime.toString()))}",
                    textSize: 14.sp,
                    maxLines: 2,
                  ),
                  CommonTextWidget(
                    title: "Checkout Time: ${DateFormat.yMd().add_jm().format(DateTime.parse(repTravelLogsData.checkOutTime.toString()))}",
                    textSize: 14.sp,
                    maxLines: 2,
                  ),
                ],
              ).withSymetricPadding(horizontalPadding: 10.w, verticalPadding: 10.h),
            ),
          ],
        ),
      ),
    );
  }
}