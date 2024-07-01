import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Search/presentation/screens/widgets/search_customer_list_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Search/presentation/screens/widgets/search_customer_loading_widget.dart';

import '../../cubit/search_customer_cubit.dart';
import '../../cubit/search_customer_state.dart';


class CustomerSearchBodyWidget extends StatefulWidget {
  const CustomerSearchBodyWidget({super.key});

  @override
  State<CustomerSearchBodyWidget> createState() => _CustomerSearchBodyWidgetState();
}

class _CustomerSearchBodyWidgetState extends State<CustomerSearchBodyWidget> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCustomerCubit,SearchCustomerState>(
      builder: (context,state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // 5.verticalSpace,
          state.isLoading ? const SearchCustomerLoadingWidget() :  const SearchCustomerListWidget(),
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