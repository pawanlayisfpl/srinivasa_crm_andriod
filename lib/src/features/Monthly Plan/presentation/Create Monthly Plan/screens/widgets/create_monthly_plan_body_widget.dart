
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_custoemer_list_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_date_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_kilometer_textfield.dart';



class CreateMonthlyPlanBodyWidget extends StatelessWidget {
  const CreateMonthlyPlanBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        // DATE FIELD
        const MonthlyPlanDateTextFieldWidget(),
        20.verticalSpace,
        const MonthlyPlanKilometerTextField(),

        // EMPLOYEE DROPDOWN
        // const MonthlyPlanEmployeeDropDownWidget(),
        20.verticalSpace,
       const  MonthlyPlanCustomerListDropDownWidget(),

        // ROUTE LIST DROPDOWN
        // const MonthlyPlanRouteDropdownwidget(),
        20.verticalSpace,



        // CUSTOMER NAME DROPDOWN
        // const MonthlyCustomerDropdownWidget(),
        // 20.verticalSpace,
        20.verticalSpace,
   

         20.verticalSpace,
         Center(child: CommonButton(title: 'Submit', callback: () async {
          Navigator.pop(context);
          // context.read<CreateMonthlyPlanCubit>().onSubmit();
          // final String selectedDate = context.read<CreateMonthlyPlanCubit>().dateController.text.toString();
          // final EmployeeModel? selectedEmploye = context.read<CreateMonthlyPlanCubit>().state.selectedEmploye;
          // final List<Customermodel> selectedCustomers = context.read<CreateMonthlyPlanCubit>().state.selectedCustomerLists;
          // final RouteModel? selectedRoute = context.read<CreateMonthlyPlanCubit>().state.selectedRoute;


          // if(selectedDate.isEmpty ||  selectedCustomers.isEmpty || selectedRoute == null){
          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill all the fields')));
          // }else{
          //             final approxKilometer = context.read<CreateMonthlyPlanCubit>().approxKilometerController.text.toString();

          //   log('printing cusotmer lists ${selectedCustomers.map((e) => e.customerCode.toString()).toList()}');
          //   MonthlyPlanPostModel monthlyPlanPostModel = MonthlyPlanPostModel(
          //     monthlyPlans: [
          //       MonthlyPlans(createdDate: selectedDate, routeId: selectedRoute.id.toString(), approxKms : double.parse(approxKilometer), customerCodes: selectedCustomers.map((e) => CustomerCodes(customerCode: e.customerCode.toString())).toList(),),
               
          //     ], employeeId: selectedEmploye!.id.toString()
          //   );
            // log(monthlyPlanPostModel.toJson().toString());
            // context.read<CreateMonthlyPlanCubit>().createMonthlyPlan(monthlyPlanPostModel: monthlyPlanPostModel,context: context);
         
          
         }))





        // CUSTOMER ADDRESS DROP DOWN 
        // 
      ],
    ),);
  }
}