import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:srinivasa_crm_new/src/common/widgets/loading/common_progress_dialog.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/sales_order_create_screen.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Order%20Pending/screens/pending_order_screen.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/sales_order_view_screen.dart';

import '../../../../shared/widgets/dashboard_card_widget.dart';

class SalesOrderDashboardScreen extends StatelessWidget {
  const SalesOrderDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> cardNames = [
      // 'Create Daily Plan',
      'Create Sales Order',
      'View Sales Orders',
      // 'Search Sales Plan',
      'Sales order\n Pending Requests',
      


    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Order'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05.sw), // 5% padding
        child: Center(
          child: ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 20.h),

              shrinkWrap: true,
              itemCount: context.watch<ProfileCubit>().state.maybeMap(orElse: () => cardNames.length,loadedLocal: (data) {
                log(data.profileResponseModel.userModel!.authorities!.first.roleId.toString());
                return data.profileResponseModel.userModel!.authorities!.first.roleId.toString() ==  AppStrings.salesRepRole ? cardNames.length -1 : cardNames.length;
              }),
              itemBuilder: (c, i) {
                return GestureDetector(
                    onTap: () {
                      switch (i) {
                        
                        case 0:
                        if(context.mounted) {
                          Navigator.push(context, SlideRightRoute(screen: const SalesOrderCreateScren()));
                        }
                       
                          break;
                        case 1:
                        if(context.mounted) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) =>  const SalesOrderViewScreen()));
                        }
                          break;

                          case 3:
                          Fluttertoast.showToast(msg: "Not discussed yet");
                          ProgressDialogUtils.showProgressDialog();
                      
                          break;

                       case 2: 
                       if(context.mounted) {
                        Navigator.pushReplacement(context, SlideRightRoute(screen: const  PendingOrderScreen()));
                       }
                          break;   
                      }
                    },
                    child: DashboardChildrenCardWidget(
                      title: cardNames[i],
                    ));
              }),
        ),
      ),
    );
  }
}
