import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/screens/customer_search_new_screen.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/screens/widget/scrollable_customer_list_widget.dart';

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
        actions:  [
          // SEARCH NEEDS TO BE IMPLEMENTED
          IconButton(
            icon:  const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, ScaleRoute(screen:  CustomerSearchNewScreen(existingCustomerList: context.read<AllCustomerCubit>().customerList,)));
            },
          ),
          10.horizontalSpace,

      context.watch<AllCustomerCubit>().selectedIndex != -1 ?     IconButton(onPressed: () {
            context.read<AllCustomerCubit>().jumpToIndex();
          }, icon: const Icon(Icons.pin_drop_sharp,color: Colors.redAccent,)) : const SizedBox.shrink(),
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
// List<Customermodel> modifiableList = List<Customermodel>.from(data.customerLists);

// // Sort the new list.
// modifiableList.sort((a, b) {
//   // Handle null custName by treating it as the lowest value (sort to the beginning).
//   var nameA = a.customerName?.toLowerCase() ?? '';
//   var nameB = b.customerName?.toLowerCase() ?? '';
//   return nameA.compareTo(nameB);
// });

// // Use the sorted, modifiable list.
// List<Customermodel> sortedList = modifiableList;

               return    const CustomerScrollableListWidget();
              //  AllCustomerLoadedWidget(customerLists:sortedList);
             }, error: (error) => CommonErrorWidget(error: error.message.errorMessage.toString(),callback: () {
              context.read<AllCustomerCubit>().getAllCustomer();

             },), );
          },
        ).withSymetricPadding(horizontalPadding: 20.w),
      ),
    );
  }
}
