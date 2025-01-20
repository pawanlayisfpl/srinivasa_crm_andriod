import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/cubit/employee_update_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/screen/widget/up_gender_dropdown_widget.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/screen/widget/up_zones_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/widgets/text/common_textfield_heading_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/screen/update_customer_form_screen.dart';

import '../../../../src/features/Customer/presentations/Customer Update/presentation/cubit/update_customer_cubit.dart';
import 'widget/up_roles_dropdown_widget.dart';

class UpdateEmployeScreen extends StatefulWidget {
  const UpdateEmployeScreen({super.key});

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
                      .emailController,
                  hintText: 'select your state',
                  onChanged: (String? val) {
                    context
                        .read<EmployeUpdateCubit>()
                        .onChangeEmail(val);
                  }),
              const HeightBox(),
                         const CommonTextFieldHeadingWidget(title: 'City'),
              CommonTextFormFieldWidget(
                  textEditingController: context
                      .watch<EmployeUpdateCubit>()
                      .emailController,
                  hintText: 'select your state',
                  onChanged: (String? val) {
                    context
                        .read<EmployeUpdateCubit>()
                        .onChangeEmail(val);
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
                         const CommonTextFieldHeadingWidget(title: 'Gender'),
             const UeGenderDropdownWidget(),
              const HeightBox(),
                         const CommonTextFieldHeadingWidget(title: 'Divisions'),
              CommonTextFormFieldWidget(
                  textEditingController: context
                      .watch<EmployeUpdateCubit>()
                      .emailController,
                  hintText: 'select your state',
                  onChanged: (String? val) {
                    context
                        .read<EmployeUpdateCubit>()
                        .onChangeEmail(val);
                  }),
              const HeightBox(),
                         const CommonTextFieldHeadingWidget(title: 'Roles'),
             const UpRolesDropDownWidget(),
              const HeightBox(),
                         const CommonTextFieldHeadingWidget(title: 'Zones'),
           const UpZonesDropDownWidget(),
              const HeightBox(),

            ],
          ),
        ),
      )),
    );
  }
}
