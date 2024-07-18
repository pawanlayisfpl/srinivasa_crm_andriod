// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';

import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/customer_kyu_model.dart';

class KycPendingCardWidget extends StatelessWidget {
  final CustomerKycModel customerKycModel;
  const KycPendingCardWidget({
    Key? key,
    required this.customerKycModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(8),
      
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        trailing: Icon(Icons.arrow_forward_ios),
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
            CommonTextWidget(title: 'Kyc Status : ',)
      ,5.horizontalSpace,
            CommonTextWidget(title: "Pending",textColor: Colors.red,fontWeight: FontWeight.w500,)
            ],)
          ],
        ),
        
      ),
    );
  }
}
