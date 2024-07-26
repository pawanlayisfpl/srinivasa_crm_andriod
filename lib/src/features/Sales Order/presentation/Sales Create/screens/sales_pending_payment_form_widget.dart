import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/pending_payment_amount_controller.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/pending_payment_amount_percentage_controller.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/pending_payment_duedate_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_amount_paid_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_balance_amount_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_customerCode_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_product_details_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_uom_dropdown.dart';


class SalesPendingPaymentForm extends StatefulWidget {
  const SalesPendingPaymentForm({super.key});

  @override
  State<SalesPendingPaymentForm> createState() => _SalesPendingPaymentFormState();
}

class _SalesPendingPaymentFormState extends State<SalesPendingPaymentForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending payment form'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
        children: [
          20.verticalSpace,
          CustomHeadingTextWidget(title: 'Due Date'),
           2.verticalSpace,
           PendingPaymentDueDateTextField(),
         20.verticalSpace,
          CustomHeadingTextWidget(title: 'Due Amount'),
           2.verticalSpace,
           PendingPaymentAmountTextfield(),
          20.verticalSpace,
           CustomHeadingTextWidget(title: 'Due Amount Percentage'),
           2.verticalSpace,
           PendingPaymentDuePercentageTextField(),
          20.verticalSpace,
         
          CommonButton(callback: () {
            context.read<SalesOrderCreateCubit>().submitPendingProductForm(successCallback: () { 
              Fluttertoast.showToast(msg: 'Pending details are saved',backgroundColor: Colors.green,textColor: Colors.white);
              if(context.mounted)  {
            Navigator.pop(context);

              }
             }, failedCallback: () { 
              Fluttertoast.showToast(msg: 'Please fill all the details to proceed');
              });
          }, title: "Submit"),
          20.verticalSpace
          

        ],).withSymetricPadding(horizontalPadding: 15.w)),
      ),
    );
  }
}