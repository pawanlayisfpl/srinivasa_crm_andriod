import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';

import '../../../../shared/widgets/dashboard_card_widget.dart';
import '../../../config/config.dart';
import 'Customer Create/presentation/cubit/customer_create_cubit.dart';
import 'Customer Create/presentation/cubit/state/customer_create_state.dart';

class CustomerDashbaordScreen extends StatelessWidget {
  const CustomerDashbaordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> cardNames = [
      'View Customers List',
      'Add Customers',
      'Search Customer ',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05.sw), // 5% padding
        child: Center(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: cardNames.length,
              itemBuilder: (c, i) {
                return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
                  builder: (context, state) {
                    return GestureDetector(
                        onTap: () {
                          switch (i) {
                            case 1:
                              //  Navigator.pushNamed(
                              //     context, Routes.addCustomerScreen);

                              showDialog(
                                  barrierDismissible: false,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (c) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        title:
                                            const Text('Choose Customer Type?'),
                                        content: BlocBuilder<CustomerCreateCubit,
                                            CustomerCreateState>(
                                          builder: (context, state) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                20.verticalSpace,
                                                SizedBox(
                                                    width: 0.8.sw,
                                                    child: OutlinedButton(
                                                        onPressed: () {
                                                          context
                                                              .read<
                                                                  CustomerCreateCubit>()
                                                              .setBusinessPartnerBoolValue(
                                                                  true);
                                                        },
                                                        child: CommonTextWidget(
                                                          title:
                                                              'Add Business Partner',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          textColor: 
                                                                  state
                                                                  .isBusinessPartner
                                                              ? AppColors
                                                                  .primaryColor
                                                              : Colors.grey,
                                                        ))),
                                                10.verticalSpace,
                                                SizedBox(
                                                    width: 0.8.sw,
                                                    child: OutlinedButton(
                                                        onPressed: () {
                                                          context
                                                              .read<
                                                                  CustomerCreateCubit>()
                                                              .setBusinessPartnerBoolValue(
                                                                  false);
                                                        },
                                                        child: CommonTextWidget(
                                                          title:
                                                              'Add Individuals',
                                                          textColor: context
                                                                      .watch<
                                                                          CustomerCreateCubit>()
                                                                      .state
                                                                      .isBusinessPartner ==
                                                                  false
                                                              ? AppColors
                                                                  .primaryColor
                                                              : Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )))
                                              ],
                                            );
                                          },
                                        ),
                                        actions: [
                                          CommonButton(
                                               callback: () {
                                                Navigator.pop(context);
                                                Navigator.pushNamed(
                                                    context, Routes.addCustomerScreen);
                                              },
                                              title: "Proceed",),
                                              10.verticalSpace,
                                                  CommonButton(
                                                    isRejectButton: true,
                                               callback: () {
                                                Navigator.pop(context);
                                              },
                                              title: "Cancel",),


                                              
                                        ],
                                      ));

                              break;
                            case 0:
                              // Fluttertoast.showToast(msg: "Add Customer Feature is disabled");
                              Navigator.pushNamed(context, Routes.customer);

                              break;
                            case 2:
                              // Fluttertoast.showToast(msg: "View Customer Full Details Feature is disabled");
                              Navigator.pushNamed(
                                  context, Routes.customerSearchScreen);
                              break;
                          }
                        },
                        child: DashboardChildrenCardWidget(
                          title: cardNames[i],
                        ));
                  },
                );
              }),
        ),
      ),
    );
  }
}
