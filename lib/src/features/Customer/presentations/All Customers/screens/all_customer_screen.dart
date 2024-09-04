import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/screens/widget/all_customer_loaded_widget.dart';

import '../../../../../common/common.dart';
import '../cubit/all_customer_cubit.dart';
import '../cubit/all_customer_state.dart';

class AllCustomerScreen extends StatefulWidget {
  const AllCustomerScreen({super.key});

  @override
  State<AllCustomerScreen> createState() => _AllCustomerScreenState();
}

class _AllCustomerScreenState extends State<AllCustomerScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((c) async {
     await context.read<AllCustomerCubit>().getAllCustomer();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Customers'),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () {
          //     Navigator.pushNamed(context, Routes.customerSearchScreen);
          //   },
          // )
        ],
      ),
      
      body: SafeArea(
        child: BlocBuilder<AllCustomerCubit, AllCustomerState>(
          builder: (context, state) {
            return state.map(
              
              initial: (initial) => const Center(child: Text("Initial State"),) ,
              
               loading: (l) => const CustomLoadingWidget(),
             loaded: (data) {
              if(data.customerLists.isEmpty) {
                return EmptyWidget(title: 'No Customers Found', callback: () {});
              }
           // Create a new, modifiable list from `data.customerLists`.
List<Customermodel> modifiableList = List<Customermodel>.from(data.customerLists);

// Sort the new list.
modifiableList.sort((a, b) {
  // Handle null custName by treating it as the lowest value (sort to the beginning).
  var nameA = a.customerName?.toLowerCase() ?? '';
  var nameB = b.customerName?.toLowerCase() ?? '';
  return nameA.compareTo(nameB);
});

// Use the sorted, modifiable list.
List<Customermodel> sortedList = modifiableList;

               return   AllCustomerLoadedWidget(customerLists:sortedList);
             }, error: (error) => CommonErrorWidget(error: error.message.toString(),callback: () {

             },), );
          },
        ).withSymetricPadding(horizontalPadding: 20.w),
      ),
    );
  }
}
