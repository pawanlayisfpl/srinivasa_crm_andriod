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


class SalesPendingPaymentForm extends StatefulWidget {
  const SalesPendingPaymentForm({super.key});

  @override
  State<SalesPendingPaymentForm> createState() => _SalesPendingPaymentFormState();
}

class _SalesPendingPaymentFormState extends State<SalesPendingPaymentForm> {
  @override

  @override
  void initState() {
    super.initState();
    context.read<SalesOrderCreateCubit>().getTotalPendingAmountValue();
  }
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
          RichText(text: TextSpan(
            text: 'Total Pending Amount : ',
            style: TextStyle(color: Colors.black,fontSize: 16.sp),
            children: [
              TextSpan(text: context.watch<SalesOrderCreateCubit>().state.totalPendingAmountValue.toString(),style: TextStyle(color: Colors.red,fontSize: 16.sp))
            ]
          )),
          20.verticalSpace,
            //  20.verticalSpace,
//           RichText(text: TextSpan(
//             text: 'Total Remaining Amount Percentage : ',
//             style: TextStyle(color: Colors.black,fontSize: 16.sp),
//             children: [
// TextSpan(
//   text: (int.tryParse(context.watch<SalesOrderCreateCubit>().state.remainingPercentage.toString()) ?? 0).toString(),
//   style: TextStyle(color: Colors.red, fontSize: 16.sp),
// )              // TextSpan(text: int.parse(context.watch<SalesOrderCreateCubit>().state.remainingPercentage.toString()).toString(),style: TextStyle(color: Colors.red,fontSize: 16.sp))
//             ]
//           )),
          20.verticalSpace,
          const CustomHeadingTextWidget(title: 'Due Date'),
           2.verticalSpace,
           const PendingPaymentDueDateTextField(),
         20.verticalSpace,
          const CustomHeadingTextWidget(title: 'Due Amount'),
           2.verticalSpace,
           const PendingPaymentAmountTextfield(),
          20.verticalSpace,
           const CustomHeadingTextWidget(title: 'Due Amount Percentage'),
           2.verticalSpace,
           const PendingPaymentDuePercentageTextField(),
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