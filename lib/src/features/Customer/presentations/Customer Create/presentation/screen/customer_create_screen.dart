import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/customer_create_body_widget.dart';

import '../cubit/state/customer_create_state.dart';

class CustomerCreateScreen extends StatefulWidget {
  const CustomerCreateScreen({super.key});

  @override
  State<CustomerCreateScreen> createState() => _CustomerCreateScreenState();
}

class _CustomerCreateScreenState extends State<CustomerCreateScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<CustomerCreateCubit>().getAllInitialValues();
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
          title: CommonTextWidget(
            title:
                context.read<CustomerCreateCubit>().state.isBusinessPartner ==
                        true
                    ? 'Add Business Partner'
                    : "Add Individual",
            textColor: Colors.white,
            textSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: BlocConsumer<CustomerCreateCubit, CustomerCreateState>(
          listenWhen: (previous,current) => current.isSuccess || current.apiFailedModel != null,
          listener: (context, state) {
            if(state.isSuccess) {
              Navigator.canPop(context) ? Navigator.pop(context) : null;
              QuickAlert.show(context: context, type: QuickAlertType.success,text: "Customer Created Successfully");
            }

            if(state.apiFailedModel != null) {
                            Navigator.canPop(context) ? Navigator.pop(context) : null;

              QuickAlert.show(context: context,
              animType: QuickAlertAnimType.scale,

              
               type: QuickAlertType.error,text: state.apiFailedModel!.message,);
            }
          },
          builder: (context, state) {
            return const CustomerCreateBodyWidget();
          },
        ).withSymetricPadding(horizontalPadding: 15.w, verticalPadding: 10.h),
      ),
    );
  }
}
