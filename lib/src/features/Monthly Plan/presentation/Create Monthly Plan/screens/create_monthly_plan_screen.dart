import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/create_monthly_plan_new_body_widget.dart';

import '../cubit/create_monthly_plan_cubit.dart';
import '../cubit/create_monthly_plan_state.dart';

class CreateMonthlyPlanScreen extends StatefulWidget {
  const CreateMonthlyPlanScreen({super.key});

  @override
  State<CreateMonthlyPlanScreen> createState() =>
      _CreateMonthlyPlanScreenState();
}

class _CreateMonthlyPlanScreenState extends State<CreateMonthlyPlanScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      await context.read<CreateMonthlyPlanCubit>().getAllInitialValues();
    
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Monthly Plan'),
           actions: const [
          // IconButton(
          //   onPressed: () {
          //     if(context.mounted) {
          //       QuickAlert.show(
          //         context: context, 
          //         type: QuickAlertType.info, 
          //         text: 'Can only possible to create monthly plan for upcoming month only, and that will goes into approval to your reporting manager. Once approval is done, you can check monthly plan in the monthly plan dashboard.'
          //       );
          //     }
          //   },
          //   icon: const Icon(Icons.info),
          // )
          
        ],
      ),
      body: SafeArea(
        child: BlocListener<CreateMonthlyPlanCubit, CreateMonthlyPlanState>(
          listener: (context, state) {

            if(state.apiFailedModel != null) {
              QuickAlert.show(
                context: context,
                animType: QuickAlertAnimType.rotate,
                type: QuickAlertType.error,
                text: state.apiFailedModel!.message,
                // autoCloseDuration: const Duration(seconds: 2),
                showConfirmBtn: true,
                confirmBtnText: 'Ok',
              );
            }

            if(state.isSuccess == true) {

              if(Navigator.canPop(context)) {
              Navigator.pop(context);

              }
              if(context.mounted) {
                 QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Plan Created Successfully!',
                // autoCloseDuration: const Duration(seconds: 2),
                showConfirmBtn: true,
                confirmBtnText: 'Ok',
              );

              }
             
            }

    //         if(state.isCreationFailed == true) {
    // QuickAlert.show(
    //       context: context,
    //       type: QuickAlertType.error,
    //       text: 'Plan failed to create!',
    //       autoCloseDuration: const Duration(seconds: 2),
    //       showConfirmBtn: false,
    //     );
    //         }

    //         if(state.isCreationSuccess == true) {
    //           QuickAlert.show(
    //       context: context,
    //       type: QuickAlertType.success,
    //       text: 'Plan Created Successfully!',
    //       autoCloseDuration: const Duration(seconds: 2),
    //       showConfirmBtn: false,
    //     );
            // }
          },
          // child: const CreateMonthlyPlanBodyWidget(),
          child: const CreateMonthlyPlanNewBodyWidget(),
        ).withSymetricPadding(horizontalPadding: 10.w, verticalPadding: 10.h),
      ),
    );
  }
}
