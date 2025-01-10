import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/update_customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/cubit/update_customer_cubit.dart';

class CustomerUpdateForm extends StatelessWidget {
  final UpdateCustomerModel customer;
  final _formKey = GlobalKey<FormState>();

  CustomerUpdateForm({required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Customer'),
      ),
      body: BlocBuilder<UpdateCustomerCubit, UpdateCustomerModel>(
        builder: (context, state) {
          final cubit = context.read<UpdateCustomerCubit>();
    
          // Required and optional fields
          final requiredFields = ['farmName', 'customerName', 'customerPhone', 'email', 'mobile'];
          final optionalFields = ['alternateContact', 'address', 'faxNo',"farmCapacity"];
    
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                
                children: [
                  _buildTextField(
                    label: 'Farm Name',
                    initialValue: state.farmName,
                    isRequired: requiredFields.contains('farmName'),
                    onChanged: (value) => cubit.updateCustomerField('farmName', value),
                  ),
                  HeightBox(),
                  _buildTextField(
                    label: 'Customer Name',
                    initialValue: state.customerName,
                    isRequired: requiredFields.contains('customerName'),
                    onChanged: (value) => cubit.updateCustomerField('customerName', value),
                  ),
                        HeightBox(),
                  _buildTextField(
                    label: 'Customer Phone',
                    initialValue: state.customerPhone,
                    isRequired: requiredFields.contains('customerPhone'),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => cubit.updateCustomerField('customerPhone', value),
                  ),
                        HeightBox(),
                     _buildTextField(
                    label: 'Tite',
                    initialValue: state.customerPhone,
                    isRequired: requiredFields.contains('title'),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => cubit.updateCustomerField('title', value),
                  ),
                        HeightBox(),
                  _buildTextField(
                    label: 'Email',
                    initialValue: state.email,
                    isRequired: requiredFields.contains('email'),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => cubit.updateCustomerField('email', value),
                  ),
                        HeightBox(),
                        CommonTextWidget(title: 'Dropdown'),
                     _buildTextField(
                    label: 'Customer Typw',
                    initialValue: state.email,
                    isRequired: requiredFields.contains('customerType'),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => cubit.updateCustomerField('customerType', value),
                  ),
                        HeightBox(),
                   _buildTextField(
                    label: 'Address Line 2',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
                       _buildTextField(
                    label: 'Credit Limit',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
                           CommonTextWidget(title: 'Dropdown'),
                       _buildTextField(
                    label: 'Primary Source',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
                        _buildTextField(
                    label: 'Zone Id',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
                          _buildTextField(
                    label: 'Kyc Status',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
                           CommonTextWidget(title: 'Dropdown'),
                 _buildTextField(
                    label: 'Country Id',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
                           CommonTextWidget(title: 'Dropdown'),
                     _buildTextField(
                    label: 'State Id',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
                           CommonTextWidget(title: 'Dropdown'),
                        _buildTextField(
                    label: 'District Id',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                     CommonTextWidget(title: 'Dropdown'),
                        HeightBox(),
                        _buildTextField(
                    label: 'City Id',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
                           CommonTextWidget(title: 'Dropdown'),
                        _buildTextField(
                    label: 'Locality Id',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
                        _buildTextField(
                    label: 'Mandal',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
    
                        _buildTextField(
                    label: 'Postal Code',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
    
                        _buildTextField(
                    label: 'Address',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
                           CommonTextWidget(title: 'Dropdown'),
                         _buildTextField(
                    label: 'Is Individual',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
                         _buildTextField(
                    label: 'Address',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
                  _buildTextField(
                    label: 'Contact Person',
                    initialValue: state.mobile,
                    isRequired: requiredFields.contains('mobile'),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => cubit.updateCustomerField('mobile', value),
                  ),
                        HeightBox(),
    
                         _buildTextField(
                    label: 'Mobile',
                    initialValue: state.address,
                    isRequired: optionalFields.contains('address'),
                    onChanged: (value) => cubit.updateCustomerField('address', value),
                  ),
                        HeightBox(),
                  _buildTextField(
                    label: 'Alternate Contact',
                    initialValue: state.alternateContact,
                    isRequired: optionalFields.contains('alternateContact'),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => cubit.updateCustomerField('alternateContact', value),
                  ),
                        HeightBox(),
               
                   _buildTextField(
                    label: 'Farm Capacity',
                    initialValue: state.faxNo,
                    isRequired: optionalFields.contains('farmCapacity'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => cubit.updateCustomerField('farmCapacity', value),
                  ),
                        HeightBox(),
                  _buildTextField(
                    label: 'Fax No',
                    initialValue: state.faxNo,
                    isRequired: optionalFields.contains('faxNo'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => cubit.updateCustomerField('faxNo', value),
                  ),
                        HeightBox(),
                       _buildTextField(
                    label: 'Division Ids',
                    initialValue: state.faxNo,
                    isRequired: optionalFields.contains('faxNo'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => cubit.updateCustomerField('faxNo', value),
                  ),
                        HeightBox(),
                  
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission
                        final updatedCustomer = cubit.state;
                        print('Updated Customer: ${updatedCustomer.customerName}');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill required fields.')),
                        );
                      }
                    },
                    child: const Text('Update'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
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
    return SizedBox(height: 20,);
  }
}