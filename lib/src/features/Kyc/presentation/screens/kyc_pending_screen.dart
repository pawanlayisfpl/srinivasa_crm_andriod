import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/cubit/kyc_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/screens/widget/kyc_pending_body_widget.dart';

import '../../../../config/constants/app_colors.dart';


class KycPendingScreen extends StatefulWidget {
  const KycPendingScreen({super.key});

  @override
  State<KycPendingScreen> createState() => _KycPendingScreenState();
}

class _KycPendingScreenState extends State<KycPendingScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<KycCubit>().getKycListLogic();
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text('KYC Pending List'),
           bottom: TabBar(
            isScrollable: true,
             

            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              
            ),
            tabAlignment: TabAlignment.center,
            enableFeedback: true,
            indicatorPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            unselectedLabelColor: Colors.black,
            labelColor: AppColors.primaryColor,
            labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),


            // labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
            
            tabs: const[
          Tab(
            child: Text('All'),
          ),
           Tab(
            child: Text('Pending'),
          ),
             Tab(
            child: Text('In Process'),
          ),
           Tab(
            child: Text('Approved'),
          ),
          

          ]),
        ),
        body: const SafeArea(
          child: KycPendingBodyWidget(),
        ),
      ),
    );
  }
}