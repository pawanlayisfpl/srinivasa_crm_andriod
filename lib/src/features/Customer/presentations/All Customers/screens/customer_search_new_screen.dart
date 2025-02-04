import 'package:flutter/material.dart';
import '../../../domain/model/get/customer_model.dart';
import 'customer_details_screen.dart';

class CustomerSearchNewScreen extends StatefulWidget {
  final List<Customermodel> existingCustomerList;

  const CustomerSearchNewScreen({super.key, required this.existingCustomerList});

  @override
  _CustomerSearchNewScreenState createState() => _CustomerSearchNewScreenState();
}

class _CustomerSearchNewScreenState extends State<CustomerSearchNewScreen> {
  TextEditingController searchController = TextEditingController();
  List<Customermodel> filteredCustomers = [];

  @override
  void initState() {
    super.initState();
    filteredCustomers = widget.existingCustomerList;
  }

  void filterCustomers(String query) {
    setState(() {
      filteredCustomers = query.isEmpty
          ? widget.existingCustomerList
          : widget.existingCustomerList.where((customer) {
              final customerName = customer.customerName?.toLowerCase() ?? '';
              final farmName = customer.farm?.farmName?.toLowerCase() ?? '';
              return customerName.contains(query.toLowerCase()) ||
                  farmName.contains(query.toLowerCase());
            }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          onChanged: filterCustomers,
          decoration: const InputDecoration(
            hintText: "Search by name or farm",
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              searchController.clear();
              filterCustomers('');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredCustomers.length,
        itemBuilder: (context, index) {
          final customer = filteredCustomers[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerDetailsScreen(customermodel: customer),
                ),
              );
            },
            trailing: customer.farm?.checkInStatus == true
                ? const Icon(Icons.location_pin, color: Colors.red)
                : null,
            title: Text(customer.farm?.isOrganization == true
                ? customer.customerName ?? ""
                : customer.farm?.farmName ?? ''),
            subtitle: Text(customer.farm?.isOrganization == true
                ? "Organization"
                : customer.customerName ?? "N/A"),
          );
        },
      ),
    );
  }
}
