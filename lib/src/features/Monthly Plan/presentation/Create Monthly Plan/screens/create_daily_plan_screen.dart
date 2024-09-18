import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_custoemer_list_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_date_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_kilometer_textfield.dart';


class CreateDailyScreen extends StatefulWidget {
  const CreateDailyScreen({super.key});

  @override
  State<CreateDailyScreen> createState() => _CreateDailyScreenState();
}

class _CreateDailyScreenState extends State<CreateDailyScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) async {
      context.read<CreateMonthlyPlanCubit>().getAllInitialValues();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Daily Plan'),
      ),  
      body: SafeArea(child: SingleChildScrollView(child: Column(
        children: [
          20.verticalSpace,
          const MonthlyPlanDateTextFieldWidget(isClickEnabled: true,),
          20.verticalSpace,
          const MonthlyPlanKilometerTextField(),
          20.verticalSpace,
          const MonthlyPlanCustomerListDropDownWidget(),
          20.verticalSpace,
          CommonButton(callback: () async {}, title: "Submit")
        ],
      ).withSymetricPadding(horizontalPadding: 20.w),),),
    );
  }
}