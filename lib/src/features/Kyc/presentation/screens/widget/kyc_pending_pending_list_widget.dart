// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/customer_kyu_model.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/cubit/kyc_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/screens/widget/kyc_pending_card_widget.dart';

class KycPendingPendingListWidget extends StatelessWidget {
  final List<CustomerKycModel> customersList;
  const KycPendingPendingListWidget({
    super.key,
    required this.customersList,
  });

  @override
  Widget build(BuildContext context) {
    return context.watch<KycCubit>().pendingList.isEmpty ? EmptyWidget(title: 'No pending kyc users found', callback: () {
      context.read<KycCubit>().getKycListLogic();
    }) : AnimationLimiter(child: 
    ListView.builder(
      addAutomaticKeepAlives: false,
      padding: EdgeInsets.only(top: 10.h,left: 2.w,right: 2.w),
      
      itemBuilder: (c,i) => AnimationConfiguration.staggeredList(
  position: i,
  child: SlideAnimation(
    verticalOffset: 50.0,
    duration: const Duration(milliseconds: 375), // Duration for SlideAnimation
    child: FadeInAnimation(
      duration: const Duration(milliseconds: 375), // Duration for FadeInAnimation
      child: KycPendingCardWidget(customerKycModel: context.watch<KycCubit>().pendingList[i]),
    ),
  ),),itemCount: context.watch<KycCubit>().pendingList.length,));
  }
}
