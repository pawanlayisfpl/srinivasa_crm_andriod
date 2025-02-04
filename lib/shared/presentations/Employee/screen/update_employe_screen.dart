// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:srinivasa_crm_new/shared/presentations/Employee/cubit/employee_update_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/screen/widget/up_division_dropdown_widget.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/screen/widget/up_gender_dropdown_widget.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/screen/widget/up_zones_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/widgets/text/common_textfield_heading_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/screen/update_customer_form_screen.dart';

import 'widget/up_employe_dropdown_widget.dart';
import 'widget/up_roles_dropdown_widget.dart';

class UpdateEmployeScreen extends StatefulWidget {
  final String? empId;
  const UpdateEmployeScreen({
    super.key,
    this.empId,
  });

  @override
  State<UpdateEmployeScreen> createState() => _UpdateEmployeScreenState();
}

class _UpdateEmployeScreenState extends State<UpdateEmployeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((c) async {
      await context.read<EmployeUpdateCubit>().getAllInitialValues();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                   const HeightBox(),
                         const CommonTextFieldHeadingWidget(title: 'Gender'),
             const UeGenderDropdownWidget(),
                   const HeightBox(),
              const CommonTextFieldHeadingWidget(title: 'User name'),
              CommonTextFormFieldWidget(
                  textEditingController:
                      context.watch<EmployeUpdateCubit>().userNameController,
                  hintText: 'User Name',
                  onChanged: (String? val) {
                    context.read<EmployeUpdateCubit>().onChangeUserName(val);
                  }),
                     const HeightBox(),
                    
              const CommonTextFieldHeadingWidget(title: 'Contact No'),
              CommonTextFormFieldWidget(
                  textEditingController: context
                      .watch<EmployeUpdateCubit>()
                      .contactNumberController,
                  hintText: 'Enter your contact no',
                  onChanged: (String? val) {
                    context
                        .read<EmployeUpdateCubit>()
                        .onChangeContactNumber(val);
                  }),
              const HeightBox(),
                const CommonTextFieldHeadingWidget(title: 'State'),
              CommonTextFormFieldWidget(
                  textEditingController: context
                      .watch<EmployeUpdateCubit>()
                      .stateController,
                  hintText: 'Enter your state',
                  onChanged: (String? val) {
                    context
                        .read<EmployeUpdateCubit>()
                        .onChangeState(val);
                  }),
              const HeightBox(),
                         const CommonTextFieldHeadingWidget(title: 'City'),
              CommonTextFormFieldWidget(
                  textEditingController: context
                      .watch<EmployeUpdateCubit>()
                      .cityController,
                  hintText: 'Enter your state',
                  onChanged: (String? val) {
                    context
                        .read<EmployeUpdateCubit>()
                        .onChangeCity(val);
                  }),
              const HeightBox(),
                         const CommonTextFieldHeadingWidget(title: 'Pincode'),
              CommonTextFormFieldWidget(
                  textEditingController: context
                      .watch<EmployeUpdateCubit>()
                      .pincodeController,
                  hintText: 'Enter your pincode',
                  inputType: TextInputType.number,
                  onChanged: (String? val) {
                    context
                        .read<EmployeUpdateCubit>()
                        .onChangeEmail(val);
                  }),
   
              const HeightBox(),
                         const CommonTextFieldHeadingWidget(title: 'Divisions'),
             const UpDivisionDropDownWiget(),
              const HeightBox(),
                         const CommonTextFieldHeadingWidget(title: 'Roles'),
             const UpRolesDropDownWidget(),
              const HeightBox(),
                         const CommonTextFieldHeadingWidget(title: 'Zones'),
           const UpZonesDropDownWidget(),
              const HeightBox(),
                                const CommonTextFieldHeadingWidget(title: 'Reporting Manger'),
           const UEmployeeDropDownWidget(),
              const HeightBox(),

            ],
          ),
        ),
      )),
      bottomNavigationBar:  FractionallySizedBox(
        widthFactor: 0.7,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CommonButton(callback: () {
            context.read<EmployeUpdateCubit>().updateEmployeLogic(context,widget.empId!);
          }, title: "Update Employee"),
        ),
      ),
    );
  }
}
