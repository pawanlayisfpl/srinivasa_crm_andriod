
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_model.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/monthly_plan_search_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/state/monthly_paln_search_state.dart';

import '../../../../../Customer/presentations/Customer Search/presentation/screens/widgets/search_customer_empty_widget.dart';




class SearchCustomerListWidget extends StatelessWidget {
  const SearchCustomerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonthlyPlanSearchCubit, MonthlyPlanSearchState>(
      builder: (context, state) {
        return state.empolyesList.isEmpty ?  const SearchCustomerEmptyWidget(text: "No employes found",) :  Expanded(
          child: ListView.separated(itemBuilder: (c,i) {
            EmployeeModel employeeModel = state.empolyesList[i];
            return ListTile(
              onTap: () {
                // customercode,zone,contact name,custoemr details
              
            
                if(context.mounted) {

                }
              },
              leading: const Icon(Icons.person),
            title: CommonTextWidget(title: employeeModel.userName ?? "No Name Found",fontWeight: FontWeight.w500,textColor: Colors.black,),
            subtitle: CommonTextWidget(title: employeeModel.designation ?? "No Designation Found",fontWeight: FontWeight.w400,textColor: Colors.black,),
          );
          },itemCount: state.empolyesList.length, separatorBuilder: (BuildContext context, int index) { 
            return const Divider().withSymetricPadding(horizontalPadding: 20.w);
           },),
        );
      },
    );
  }
}
