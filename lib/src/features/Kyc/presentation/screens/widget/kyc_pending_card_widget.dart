// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';

import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/customer_kyu_model.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/screens/kyc_upload_screen.dart';

class KycPendingCardWidget extends StatelessWidget {
  final CustomerKycModel customerKycModel;
   const KycPendingCardWidget({
    super.key,
    required this.customerKycModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      
      child: ListTile(
        // TODO: FOR TESTING != ADDED INPLACE OF ==
        onTap: customerKycModel.kycStatus.toString() == "PENDING" ? () {
          if(context.mounted) {
            Navigator.push(context, SlideRightRoute(screen: KycUploadScreen( customerKycModel: customerKycModel,)));
          }
        } : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        trailing: const Icon(Icons.arrow_forward_ios),
        title: CommonTextWidget(title: customerKycModel.customerName ?? "N/A",fontWeight: FontWeight.w600,textSize: 20.sp,),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextWidget(title: "Id : ${customerKycModel.customerId}"),
            4.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            const  CommonTextWidget(title: 'Kyc Status : ',)
      ,5.horizontalSpace,
            CommonTextWidget(title: customerKycModel.kycStatus ?? "Pending",textColor: customerKycModel.kycStatus.toString() == "PENDING" ? Colors.red :  customerKycModel.kycStatus.toString() == "APPROVED" ? Colors.green : Colors.orange,fontWeight: FontWeight.w500,)
            ],)
          ],
        ),
        
      ),
    );
  }
}
