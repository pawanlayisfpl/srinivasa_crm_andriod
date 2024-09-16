import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/screens/customer_details_screen.dart';

import '../../../domain/model/get/customer_model.dart';


class CustomerSearchNewScreen extends StatefulWidget {
  const CustomerSearchNewScreen({super.key});

  @override
  _CustomerSearchNewScreenState createState() => _CustomerSearchNewScreenState();
}

class _CustomerSearchNewScreenState extends State<CustomerSearchNewScreen> {
  bool isSearching = true; // To track if search mode is active
  TextEditingController searchController = TextEditingController(); // Controller for search input
  List<Customermodel> filteredCustomers = []; // Local filtered list

  @override
  void initState() {
    super.initState();
    // Load all customers initially
    context.read<AllCustomerCubit>().getAllCustomer();
  }

  // Filter function that works locally on the fetched data
  void filterCustomers(String query, List<Customermodel> allCustomers) {
    if (query.isEmpty) {
      setState(() {
        filteredCustomers = allCustomers;
      });
    } else {
      setState(() {
        filteredCustomers = allCustomers.where((customer) {
          final customerName = customer.customerName?.toLowerCase() ?? '';
          final farmName = customer.farm?.farmName?.toLowerCase() ?? '';
          return customerName.contains(query.toLowerCase()) ||
                 farmName.contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FractionallySizedBox(
          widthFactor: 1,
          child: CommonTextfield(textEditingController: searchController,    onChanged: (query) {
                    // Access the current loaded state to filter the list
                    final state = context.read<AllCustomerCubit>().state;
                    if (state is Loaded) {
                      filterCustomers(query, state.customerLists); // Filter based on query
                    }
                  }, validator: (v) {}, hintText: "search by name or farm", autovalidateMode: AutovalidateMode.disabled),
        ),
        actions: [
          IconButton(
            icon: Icon( Icons.close),
            onPressed: () {
              setState(() {
                if (isSearching) {
                  // Reset search when closed
                  searchController.clear();
                  final state = context.read<AllCustomerCubit>().state;
                  if (state is Loaded) {
                    filteredCustomers = state.customerLists; // Reset to full list
                  }
                }
                // isSearching = !isSearching;
              });
            },
          ),
        ],
      ),
      body: BlocBuilder<AllCustomerCubit, AllCustomerState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: Text('Error: ${state.message.errorMessage}'));
          } else if (state is Loaded) {
            // If no search query, show full list; otherwise show filtered list
            final displayList = isSearching ? filteredCustomers : state.customerLists;

            return ListView.builder(
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    // Navigate to customer details screen
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerDetailsScreen(customermodel: displayList[index])));
                  },
                  trailing: displayList[index].farm!.checkInStatus! ? const Icon(Icons.location_pin,color: Colors.red,) : null,
                 title: Text(displayList[index].farm?.isOrganization == true 
    ? displayList[index].customerName ?? "" 
    : displayList[index].farm?.farmName ?? ''),
                  subtitle: Text(displayList[index].farm?.isOrganization == true ? "Organization" : displayList[index].customerName ?? "N/A"),
                );
              },
            );
          } else {
            return const Center(child: Text('No customers available.'));
          }
        },
      ),
    );
  }
}
