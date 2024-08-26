import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/cubit/sales_order_view_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/widget/sales_order_view_body_widget.dart';

class SalesOrderViewScreen extends StatefulWidget {
  const SalesOrderViewScreen({super.key});

  @override
  State<SalesOrderViewScreen> createState() => _SalesOrderViewScreenState();
}

class _SalesOrderViewScreenState extends State<SalesOrderViewScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
       context.read<SalesOrderViewCubit>().getSalesOrder();
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
       length: 3,
          //  animationDuration: Duration(milliseconds: 800),

           initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sales Order View Screen'),
          bottom: TabBar(
            isScrollable: false,

            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              
            ),
            enableFeedback: true,
            unselectedLabelColor: Colors.black,
            labelColor: AppColors.primaryColor,
            labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp),
            indicatorPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),

            // labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
            
            tabs: [
          Tab(
            child: Text('All'),
          ),
           Tab(
            child: Text('To Deliver'),
          ),
           Tab(
            child: Text('To Approve'),
          ),

          ]),
        ),
        
        
        body: SafeArea(child: SalesOrderViewBodyWidget(),),
      ),
    );
  }
}