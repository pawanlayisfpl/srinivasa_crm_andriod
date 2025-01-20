import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/presentations/AllEmploye/cubit/all_employe_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/AllEmploye/cubit/state/all_employe_state.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/screen/employe_screen.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';

class AllEmployeScreen extends StatefulWidget {
  const AllEmployeScreen({super.key});

  @override
  State<AllEmployeScreen> createState() => _AllEmployeScreenState();
}

class _AllEmployeScreenState extends State<AllEmployeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((c) async {
      context.read<AllEmployeCubit>().getEmployesData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Employess"),
      ),
      body: BlocBuilder<AllEmployeCubit, AllEmployeState>(
        builder: (context, state) {
          return state.isLoading  ? CustomLoadingWidget() : 
         ListView.builder(itemBuilder: (c,i) {
            return ListTile(
              onTap: () {
                if(context.mounted) {
                  Navigator.push(context, ScaleRoute(screen: EmployeScreen(
                    empId: state.allEmployeModel?.data?.users?[i].id.toString() ,

                  )));
                }
              },
              title: Text(state.allEmployeModel?.data?.users?[i].userName ?? "N/A"),
              subtitle: Text(state.allEmployeModel?.data?.users?[i].designation.toString() ?? "N/A"),
            );
          },itemCount: state.allEmployeModel?.data?.users?.length,);
        },
      ),
    );
  }
}
