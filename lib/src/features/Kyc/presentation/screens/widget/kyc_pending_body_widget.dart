
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Search/presentation/screens/widgets/search_customer_loading_widget.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/screens/widget/kyc_pending_approve_list_widget.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/screens/widget/kyc_pending_inprocess_list_widget.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/screens/widget/kyc_pending_list_widget.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/screens/widget/kyc_pending_pending_list_widget.dart';
import '../../cubit/kyc_cubit.dart'; // Import your KycCubit
import '../../cubit/state/kyc_state.dart';

class KycPendingBodyWidget extends StatelessWidget {
  const KycPendingBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<KycCubit, KycState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Column(
            children: [
              SearchCustomerLoadingWidget(),
            ],
          );
        } else if (state is Loaded) {
          return TabBarView(children: [
            KycPendingListWidget(customersList: state.customerKycList),
            KycPendingPendingListWidget(customersList: state.customerKycList),
            KycPendingInProcessListWidget(customersList: state.customerKycList),
            KycPendingApproveListWidget(customersList: state.customerKycList),

          ]);
          
           
        } else if (state is Initial) {
          return const Text('Please initiate KYC loading.');
        } else {
          return EmptyWidget(title: state.maybeMap(
              orElse: () => '', // Provide a default return value for other states
              error: (value) {
                debugPrint(value.toString());
                return value.apiFailedModel.message.toString();
              },
            ), callback: () {
              context.read<KycCubit>().getKycListLogic();

            });
         
        }
      },
      listener: (context, state) {
        // if (state is Error) {
        //   if(context.mounted) {
        //     QuickAlert.show(
        //       context: context,
        //       type: QuickAlertType.error,
        //       title: 'Error',
        //       text: state.apiFailedModel.message,
        //       barrierDismissible: false,
        //       confirmBtnColor: Colors.black,
        //       onConfirmBtnTap: () {
        //         Navigator.pop(context);

        //   //         if(Navigator.canPop(context)) {
        //   //   Navigator.pop(context);
        //   // }
        //   // 
        //       },
        //       confirmBtnText: 'Ok',
        //     );
        //   }
      
        // }
      },
    );
  }
}