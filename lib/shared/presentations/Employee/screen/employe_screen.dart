// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:srinivasa_crm_new/shared/domain/model/Employe/single_employe_model.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/cubit/employee_update_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/cubit/state/single_employe_state.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/screen/update_employe_screen.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';

class EmployeScreen extends StatefulWidget {
  final String? empId;
  const EmployeScreen({
    super.key,
    this.empId,
  });

  @override
  State<EmployeScreen> createState() => _EmployeScreenState();
}

class _EmployeScreenState extends State<EmployeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((c) async {
      await context.read<EmployeUpdateCubit>().getEmployesDetails(context,widget.empId ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Details"),),
      body: BlocBuilder<EmployeUpdateCubit, SingleEmployeState>(
        builder: (context, state) {
          return SafeArea(child: 

          state.isSingleEmployeModelLoading ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) : EmployeDetailsWidget(singleEmployeModel: state.singleEmployeModel,empIdvalue: widget.empId.toString(),)


            );
        },
      ),
    );
  }
}



class EmployeDetailsWidget extends StatelessWidget {
  final SingleEmployeModel? singleEmployeModel;
  final String empIdvalue;

  

  const EmployeDetailsWidget({
    super.key,
    this.singleEmployeModel,
    required this.empIdvalue,
  });
  
  
  @override
  Widget build(BuildContext context) {
    return singleEmployeModel == null ? const Center(child: Text("No details found, please try again later"),) : SingleChildScrollView(
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          ProfileRowWidget(title: 'Employee Id ', value: singleEmployeModel?.id.toString() ?? "N/A"),
          const Divider(),
            const SizedBox(height: 12,),
          ProfileRowWidget(title: 'Employee Name ', value: singleEmployeModel?.username.toString() ?? "N/A"),
             const Divider(),
                ProfileRowWidget(title: 'Employee Number ', value: singleEmployeModel?.contactNo.toString() ?? "N/A"),
             const Divider(),
            const SizedBox(height: 12,),
             ProfileRowWidget(title: 'Email', value: singleEmployeModel?.email.toString() ?? "N/A"),
                          const Divider(),
            const SizedBox(height: 12,),
             ProfileRowWidget(title: 'State', value: singleEmployeModel?.state.toString() ?? "N/A"),
                          const Divider(),
            const SizedBox(height: 12,),
             ProfileRowWidget(title: 'City', value: singleEmployeModel?.city.toString() ?? "N/A"),
                          const Divider(),
            const SizedBox(height: 12,),
             ProfileRowWidget(title: 'Pincode', value: singleEmployeModel?.pincode.toString() ?? "N/A"),
                          const Divider(),
            const SizedBox(height: 12,),
             ProfileRowWidget(title: 'Reporting Manager', value: singleEmployeModel?.repostingManagerName.toString() ?? "N/A"),
                          const Divider(),
            const SizedBox(height: 12,),
             ProfileRowWidget(title: 'Gender', value: singleEmployeModel?.gender.toString() ?? "N/A"),
                          const Divider(),
            const SizedBox(height: 12,),
             ProfileRowWidget(title: 'OB Vendor Code', value: singleEmployeModel?.obempVendorCode.toString() ?? "N/A"),
                          const Divider(),
            const SizedBox(height: 12,),
            CommonButton(callback: () async {
              if(context.mounted) {
                if(Navigator.canPop(context)) {
                  Navigator.pop(context);
                  if(context.mounted) {
                      Navigator.push(context, MaterialPageRoute(builder: (c) =>  UpdateEmployeScreen(
                
                empId: empIdvalue,
              )));
                  }
                }
              }
            }, title: "Click to update details")
            
          ],
        ),
      ),
    );
  }
}

class ProfileRowWidget extends StatelessWidget {
  final String title;
  final String value;
  const ProfileRowWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
              Expanded(
                flex: 3,
                child: CommonTextWidget(title: title,maxLines: 2,)),
                const CommonTextWidget(title: " : ",textSize: 26,),
              Expanded(
                flex: 6,
                child: CommonTextWidget(title:value,maxLines: 2,)),
            ],);
  }
}
