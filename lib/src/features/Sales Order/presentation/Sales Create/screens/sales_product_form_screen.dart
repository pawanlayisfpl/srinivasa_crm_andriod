import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/widgets/text/common_textfield_heading_widget.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_amount_paid_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_balance_amount_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_customerCode_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_product_chdate_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_product_details_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_product_discountPerQty_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_product_discount_per_percentage_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_product_rate_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_product_selling_rate_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_product_shippment_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_product_total_amount_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/soc_uom_dropdown.dart';

import '../cubit/state/sales_order_create_state.dart';
import 'widgets/soc_product_qty_textfield.dart';

class SalesProductFormScreen extends StatefulWidget {
  const SalesProductFormScreen({super.key});

  @override
  State<SalesProductFormScreen> createState() => _SalesProductFormScreenState();
}

class _SalesProductFormScreenState extends State<SalesProductFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Product Form'),
      ),
      body: SafeArea(
        child: BlocConsumer<SalesOrderCreateCubit, SalesOrderCreateState>(
          listenWhen: (previous, current) => previous.apiFailedModel != current.apiFailedModel,
          listener: (context, state) {
            if(state.apiFailedModel != null) {
              if(Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              QuickAlert.show(context: context, type: QuickAlertType.error, title: 'Error', text: state.apiFailedModel!.message,confirmBtnColor: Colors.black,barrierDismissible: false);  
            }
          },
          builder: (context, state) {
            return Scrollbar(
              radius: const Radius.circular(10),
              thickness: 2,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  20.verticalSpace,
                  const CommonTextFieldHeadingWidget(title: 'Product Name',isRequired: true,)
 ,                 2.verticalSpace,
               context.watch<SalesOrderCreateCubit>().state.isCustomerLoading ? const DropdownLoadingWidget() :   const  SocProductDropDown(),
                  20.verticalSpace,
                        
                 
                   const CommonTextFieldHeadingWidget(title: 'Rate',isRequired: true,),
                  2.verticalSpace,
                  const SocProductRateTextField(),
                  20.verticalSpace,
                   const CommonTextFieldHeadingWidget(title: 'Selling Rate',isRequired: true,),
                  2.verticalSpace,
                  const SocProductSellingRateTextField(),
                  20.verticalSpace,
                         const CommonTextFieldHeadingWidget(title: 'Quantity',isRequired: true,),
                  2.verticalSpace,
                  const SocProductQtyTextFieldWidget(),
                  20.verticalSpace,
                    const CommonTextFieldHeadingWidget(title: 'Total Amount',isRequired: false,),
                  2.verticalSpace,
                  const SocProductTotalAmountTextField(),
                  // 20.verticalSpace,
                  // const CustomHeadingTextWidget(title: 'Discount per Qty'),
                  // 2.verticalSpace,
                  // const SocProductDiscountPerQtyTextFieldWidget(),
                  // 20.verticalSpace,
                  // const CustomHeadingTextWidget(title: 'Discount per Percentage'),
                  // 2.verticalSpace,
                  // const SocProductDiscountPerPercentageTextField(),
                  20.verticalSpace,
                
                  // const CustomHeadingTextWidget(title: 'Gst Amount'),
                  //  2.verticalSpace,
                  //  const SocAmountPaidController(),
                  //   20.verticalSpace,
                                    const CommonTextFieldHeadingWidget(title: 'UOM type',isRequired: true,),

                  2.verticalSpace,
                  const SocUomDropDownWidget(),
                  20.verticalSpace,
                                                    const CommonTextFieldHeadingWidget(title: 'Shipping date',isRequired: true,),

                  2.verticalSpace,
                  const SocProductShipmentTextField(),
                  20.verticalSpace,
                                                                     const CommonTextFieldHeadingWidget(title: 'CH Hatching date(optional)',isRequired: false,),

                  2.verticalSpace,
                  const SocProductChDateTextField(),
                  20.verticalSpace,
                  CommonButton(
                      callback: () async {
                        context.read<SalesOrderCreateCubit>().submitProductForm(
                            successCallback: () {
                          Fluttertoast.showToast(
                              msg: 'Product saved',
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
                          Navigator.pop(context);
                        }, failedCallback: () {
                          Fluttertoast.showToast(
                              msg: 'Please fill all the details',
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        });
                      },
                      title: "Submit"),
                  20.verticalSpace
                ],
              ).withSymetricPadding(horizontalPadding: 15.w)),
            );
          },
        ),
      ),
    );
  }
}
