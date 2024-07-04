
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_model.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_search_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/monthly_plan_search_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/state/monthly_paln_search_state.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/screens/view_monthly_plan_screen.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/screens/view_months_screen.dart';

import '../../../../../../config/animations/routes/all_animate_routes.dart';
import '../../../../../Customer/presentations/Customer Search/presentation/screens/widgets/search_customer_empty_widget.dart';
import '../monthly_plan_search_screen.dart';




class MonthlyPlanEmployeListWidget extends StatelessWidget {
  const MonthlyPlanEmployeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonthlyPlanSearchCubit, MonthlyPlanSearchState>(
      builder: (context, state) {
        return state.monthlyPlanSearchResponseModel  == null?  const SearchCustomerEmptyWidget(text: "No employes found",) :  Expanded(
          child: ListView.separated(itemBuilder: (c,i) {
            MonthlyPlanSearchUserModel model = state.monthlyPlanSearchResponseModel!.monthlyPlanSearchUserModel![i];
            return ListTile(
              onTap: () {

              
            
                if(context.mounted) {
                  Navigator.push(context, SlideLeftRoute(screen:   ViewMonthsScreen(id: model.id.toString(),
                  )));

                }
              },
              leading: const Icon(Icons.person),
            title: CommonTextWidget(title: model.userName ?? "No Name Found",fontWeight: FontWeight.w500,textColor: Colors.black,),
            subtitle: CommonTextWidget(title: model.id.toString(),fontWeight: FontWeight.w400,textColor: Colors.black,),
          );
          },itemCount: state.monthlyPlanSearchResponseModel == null ? 0 : state.monthlyPlanSearchResponseModel!.monthlyPlanSearchUserModel!.length, separatorBuilder: (BuildContext context, int index) { 
            return const Divider().withSymetricPadding(horizontalPadding: 20.w);
           },),
        );
      },
    );
  }
}
