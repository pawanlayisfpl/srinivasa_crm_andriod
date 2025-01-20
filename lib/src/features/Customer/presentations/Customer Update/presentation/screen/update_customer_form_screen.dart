import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/widgets/text/common_textfield_heading_widget.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/update_customer_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/cubit/update_customer_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/widgets/uc_city_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/widgets/uc_countries_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/widgets/uc_districts_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/widgets/uc_division_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/widgets/uc_employe_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/widgets/uc_localities_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/widgets/uc_states_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/widgets/uc_title_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/widgets/uc_zone_dropdown_widget.dart';

class CustomerUpdateForm extends StatefulWidget {
  final String? farmid;

  const CustomerUpdateForm({super.key, required this.farmid});

  @override
  State<CustomerUpdateForm> createState() => _CustomerUpdateFormState();
}

class _CustomerUpdateFormState extends State<CustomerUpdateForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((c) async {
      await context
          .read<UpdateCustomerCubit>()
          .getInitData(widget.farmid ?? 1.toString(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Customer'),
      ),
      bottomNavigationBar: FractionallySizedBox(
              widthFactor: 0.8,
              child: CommonButton(callback: () async {
                if(context.mounted) {
                  await context.read<UpdateCustomerCubit>().updateCustomerLogic(context);
                }
              }, title: "Update"))
          .withPadding(bottom: 10),
      body: BlocBuilder<UpdateCustomerCubit, UpdateCustomerState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  if(context.watch<UpdateCustomerCubit>().state.isIndividual)
                  //   _buildTextField(
                  //     textController: context.watch<UpdateCustomerCubit>().farmNameController,
                  //     label: 'Farm Name',
                  //     initialValue: state.farmName,
                  //     onChanged: (value) => cubit.updateCustomerField('farmName', value),
                  //   ),
                  //   const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'Customer Name'),
                  CommonTextFormFieldWidget(
                      textEditingController: context
                          .watch<UpdateCustomerCubit>()
                          .customerNameController,
                      hintText: 'Customer Name',
                      onChanged: (String? val) {
                        context
                            .read<UpdateCustomerCubit>()
                            .onChangeCustomerName(val);
                      }),

                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'Customer Phone'),
                  CommonTextFormFieldWidget(
                      textEditingController: context
                          .watch<UpdateCustomerCubit>()
                          .customerPhoneController,
                      hintText: 'Customer Phone',
                      onChanged: (String? val) {
                        context
                            .read<UpdateCustomerCubit>()
                            .onChangeCustomerPhone(val);
                      }),
                  const HeightBox(),

                  const CommonTextFieldHeadingWidget(title: 'Title'),
                  const UcTitleDropDownWidget(),
                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'Email'),
                  CommonTextFormFieldWidget(
                      textEditingController:
                          context.watch<UpdateCustomerCubit>().emailController,
                      hintText: 'Email',
                      onChanged: (String? val) {
                        context.read<UpdateCustomerCubit>().onChangeEmail(val);
                      }),
                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'Address Line 2'),

                  CommonTextFormFieldWidget(
                      textEditingController: context
                          .watch<UpdateCustomerCubit>()
                          .addressLine2Controller,
                          inputType: TextInputType.text,
                      hintText: 'Alternate Address',
                      onChanged: (String? val) {
                        context
                            .read<UpdateCustomerCubit>()
                            .onChangeAddressLine2(val);
                      }),
                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'Credit Limit'),

                  CommonTextFormFieldWidget(
                      textEditingController: context
                          .watch<UpdateCustomerCubit>()
                          .creditLimitController,
                      hintText: 'Credit Limit',
                      onChanged: (String? val) {
                        context
                            .read<UpdateCustomerCubit>()
                            .onChangeCreditLimit(val);
                      }),

                  const HeightBox(),
                         const CommonTextFieldHeadingWidget(title: 'Zone'),
                  const UcZoneDropDownWidget(),
                       const HeightBox(),
                         const CommonTextFieldHeadingWidget(title: 'Reporting Manager'),
                  const UcEmployeeDropDownWidget(),
                     const HeightBox(),
                         const CommonTextFieldHeadingWidget(title: 'Division'),
                  const UcDivisionDropDownWidget(),
                           const HeightBox(),

                    const CommonTextFieldHeadingWidget(title: 'Title'),
                  const UcTitleDropDownWidget(),
                  const HeightBox(),

                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'Countries'),
                  const UcCountriesDropDownWiget(),

                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'State'),
                  const UcStatesDropDownWidget(),
                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'District'),
                  const UcDistrictsDropDownWidget(),
                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'Mandal'),

                  CommonTextFormFieldWidget(
                      textEditingController:
                          context.watch<UpdateCustomerCubit>().mandalController,
                      hintText: 'Mandal name',
                      onChanged: (String? val) {
                        context.read<UpdateCustomerCubit>().onChangeMandal(val);
                      }),
                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'City'),
                  const UcCityDropDownWidget(),
                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'Locality'),
                  const UcLocalityDropDownWidget(),

                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'Pincode'),

                  CommonTextFormFieldWidget(
                      textEditingController: context
                          .watch<UpdateCustomerCubit>()
                          .postalCodeController,
                      hintText: 'Pincode',
                      onChanged: (String? val) {
                        context
                            .read<UpdateCustomerCubit>()
                            .onChangePostalCode(val);
                      }),
                  const HeightBox(),

                  const CommonTextFieldHeadingWidget(title: 'Address'),

                  CommonTextFormFieldWidget(
                      textEditingController: context
                          .watch<UpdateCustomerCubit>()
                          .addressController,
                      hintText: 'Address',
                      onChanged: (String? val) {
                        context
                            .read<UpdateCustomerCubit>()
                            .onChangeAddress(val);
                      }),

                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'Contact Name'),

                  CommonTextFormFieldWidget(
                      textEditingController: context
                          .watch<UpdateCustomerCubit>()
                          .contactNameController,
                      hintText: 'Contact Person Name',
                      onChanged: (String? val) {
                        context
                            .read<UpdateCustomerCubit>()
                            .onChangeContactName(val);
                      }),
                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'Contact Phone'),

                  CommonTextFormFieldWidget(
                      textEditingController:
                          context.watch<UpdateCustomerCubit>().contactPhoneController,
                      hintText: 'Mobile',
                      onChanged: (String? val) {
                        context.read<UpdateCustomerCubit>().onChangeContactPhone(val);
                      }),
                  const HeightBox(),
                  const CommonTextFieldHeadingWidget(title: 'Alterate mobile'),

                  CommonTextFormFieldWidget(
                      textEditingController: context
                          .watch<UpdateCustomerCubit>()
                          .alternativeMobileController,
                      hintText: 'Alternate mobile',
                      onChanged: (String? val) {
                        context
                            .read<UpdateCustomerCubit>()
                            .onChangeAlternativeMobile(val);
                      }),
                  const HeightBox(),

                  const CommonTextFieldHeadingWidget(title: 'Farm Capacity'),

                  CommonTextFormFieldWidget(
                      textEditingController: context
                          .watch<UpdateCustomerCubit>()
                          .farmCapacityController,
                      hintText: 'Farm capacity',
                      onChanged: (String? val) {
                        context.read<UpdateCustomerCubit>().onChangeFarm(val);
                      }),

                  const HeightBox(),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController textController,
    required String label,
    required String initialValue,
    required bool isRequired,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: isRequired
            ? (value) {
                if (value == null || value.trim().isEmpty) {
                  return '$label is required';
                }
                return null;
              }
            : null,
        onChanged: onChanged,
      ),
    );
  }
}

class HeightBox extends StatelessWidget {
  const HeightBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}
