import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_amount_paid_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_balance_amount_due_date_field.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_balance_amount_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_customerCode_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_discount_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_order_amount_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_order_gst_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_order_remarks_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_payment_mode_dropdown_widget.dart';

class SalesOrderCreateBodyWidget extends StatelessWidget {
  const SalesOrderCreateBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        // CUSTOMER CODE NON EDIT
      
        // PROUDCT DETAILS DROPDOWN
        // ORDER AMOUNT TEXTFIELD
        // ORDER GST NUMBER TEXTFIELD
        // ORDER DISCOUNT TEXTFIELD
        // AMOUNT PAID TEXTFIELD
        // PAYMENT MODE DROPDOWN LSIT
        // BALANCE AMOUNT TEXTFIELD
        // BALANCE AMOUNT DUE DATE FIELD
        // ORDER REMAKRS TEXTAREA FIELD
        // EMPLOYEE OWN ID TEXTFIELD NOT EDITABLE
        // ASSIGNED TO REMAKRS FIELD
        // LIST OF PENDING PAYMENT DROPDOWNS
        // SUBMIT BUTTON

          const SocCustomerCodeTextField(),
        10.verticalSpace,
        const SocOrderAmountTextField(),
        10.verticalSpace,
        const SocOrderGstNumberTextField(),
        10.verticalSpace,
        const SocDiscountTextField(),
        10.verticalSpace,
        const SocAmountPaidController(),
        10.verticalSpace,
        const SocPaymentModeDropDownWidget(),
        10.verticalSpace,
        const SocBalanceAmountField( ),
        10.verticalSpace,
        const SocAmountDueDateField( ),
        10.verticalSpace,
        const SocOrderRemarksTextField(),
        10.verticalSpace,

        
      ],
      ).withSymetricPadding(horizontalPadding: 20.w),
    );
  }
}