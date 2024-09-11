// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/cubit/kyc_upload_cubit.dart';

import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/screens/widgets/kyc_upload_body_widget.dart';

import '../../../domain/model/customer_kyu_model.dart';

class KycUploadScreen extends StatefulWidget {
    final CustomerKycModel? customerKycModel;

  const KycUploadScreen({
    super.key,
     this.customerKycModel,
  });

  @override
  State<KycUploadScreen> createState() => _KycUploadScreenState();
}

class _KycUploadScreenState extends State<KycUploadScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback( (t) async {
      context.read<KycUploadCubit>().reset();
    });
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: context.watch<KycUploadCubit>().state.isSubmitting ? false : true,
        
      onPopInvoked: (value) async {
        
      },
       
      child: Scaffold(
        appBar: AppBar(
          leading:    IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context); // Closes the current screen
            },
          ),
          title: const Text('KYC Upload'),
        ),
        body:  SafeArea(
          child: KycUploadBodyWidget(customerKycModel: widget.customerKycModel,),
        ),
      ),
    );
  }
}