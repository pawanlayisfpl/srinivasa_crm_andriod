import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/customer_create_body_widget.dart';


class CustomerCreateScreen extends StatefulWidget {
  const CustomerCreateScreen({super.key});

  @override
  State<CustomerCreateScreen> createState() => _CustomerCreateScreenState();
}

class _CustomerCreateScreenState extends State<CustomerCreateScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback( (timeStamp)async {
    await  context.read<CustomerCreateCubit>().getAllInitialValues();
    });
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) async {
         context.read<CustomerCreateCubit>().clearAllFields();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Customer'),
        ),
        body: const CustomerCreateBodyWidget().withSymetricPadding(horizontalPadding: 15.w,verticalPadding: 10.h),
      ),
    );
  }
}