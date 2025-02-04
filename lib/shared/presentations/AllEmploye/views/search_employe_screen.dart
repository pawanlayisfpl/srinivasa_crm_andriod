import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/presentations/AllEmploye/cubit/all_employe_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/AllEmploye/cubit/state/all_employe_state.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/screen/employe_screen.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';

class SearchEmployeScreen extends StatefulWidget {
  const SearchEmployeScreen({super.key});

  @override
  State<SearchEmployeScreen> createState() => _SearchEmployeScreenState();
}

class _SearchEmployeScreenState extends State<SearchEmployeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Employees"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search by name...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<AllEmployeCubit, AllEmployeState>(
              builder: (context, state) {
                final employees = state.allEmployeModel?.data?.users ?? [];
                final filteredEmployees = employees.where((emp) {
                  return emp.userName?.toLowerCase().contains(_searchQuery) ?? false;
                }).toList();

                return ListView.builder(
                  itemCount: filteredEmployees.length,
                  itemBuilder: (context, index) {
                    final employee = filteredEmployees[index];
                    return ListTile(
                      title: Text(employee.userName ?? "N/A"),
                      subtitle: Text(employee.designation!.join(",")),
                      onTap: () {
                        Navigator.push(
                          context,
                          ScaleRoute(
                            screen: EmployeScreen(
                              empId: employee.id.toString(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
