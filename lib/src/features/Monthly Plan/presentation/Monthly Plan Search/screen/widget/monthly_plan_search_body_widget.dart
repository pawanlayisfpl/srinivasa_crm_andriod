import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Search/presentation/screens/widgets/search_customer_loading_widget.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/monthly_plan_search_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/state/monthly_paln_search_state.dart';

import 'monthly_plan_search_list_widget.dart';



class MonthlyPlanSearchBodyWidget extends StatefulWidget {
  const MonthlyPlanSearchBodyWidget({super.key});

  @override
  State<MonthlyPlanSearchBodyWidget> createState() => _MonthlyPlanSearchBodyWidgetState();
}

class _MonthlyPlanSearchBodyWidgetState extends State<MonthlyPlanSearchBodyWidget> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonthlyPlanSearchCubit,MonthlyPlanSearchState>(
      builder: (context,state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // 5.verticalSpace,
          state.isLoading ? const SearchCustomerLoadingWidget() :  const MonthlyPlanEmployeListWidget(),
          ],
        );
      }
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}