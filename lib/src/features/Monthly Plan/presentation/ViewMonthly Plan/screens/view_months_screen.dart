import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/extensions/month_extension.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_state.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/screens/view_monthly_plan_screen.dart';

class ViewMonthsScreen extends StatefulWidget {
  const ViewMonthsScreen({super.key});

  @override
  State<ViewMonthsScreen> createState() => _ViewMonthsScreenState();
}

class _ViewMonthsScreenState extends State<ViewMonthsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (t) {
          context.read<ViewMonthlyPlanCubit>().managerClickedFalse();
          context.read<ViewMonthlyPlanCubit>().resetAlertModelValue();
          context.read<CreateMonthlyPlanCubit>().getAllMonthsList();
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('View Monthly Plans'),
      ),
      body: SafeArea(
        child: BlocConsumer<CreateMonthlyPlanCubit, CreateMonthlyPlanState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return state.monthsList.isEmpty ? EmptyWidget(title: 'No Monthly Plans Found', callback: () {} ).withSymetricPadding(horizontalPadding: 20.w) : AnimationLimiter(child: ListView.builder(
              padding: EdgeInsets.only(top: 20.h),
              itemCount: state.monthsList.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(position: index, child: SlideAnimation(
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 500),
                  
                  child: FadeInAnimation(
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 300),
                    
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, SlideLeftRoute(screen: ViewMonthlyPlanScreen(selectedDate: state.monthsList[index].date.toString(),)));
                  },
                  child: Card(
                    elevation: 8,
                    child: Container(
                      height: 0.1.sh,
                      width: 0.9.sw,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(child: CommonTextWidget(title: state.monthsList[index].month.toString().toMonthName,textColor: Colors.white,fontWeight: FontWeight.bold,),)),
                  ),
                ),),));
              },
            ));
          },
        ).withSymetricPadding(horizontalPadding: 20.w),
      ),
    );
  }
}
