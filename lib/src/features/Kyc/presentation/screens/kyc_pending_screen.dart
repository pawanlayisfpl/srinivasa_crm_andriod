import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/cubit/kyc_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/screens/widget/kyc_pending_body_widget.dart';


class KycPendingScreen extends StatefulWidget {
  const KycPendingScreen({super.key});

  @override
  State<KycPendingScreen> createState() => _KycPendingScreenState();
}

class _KycPendingScreenState extends State<KycPendingScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<KycCubit>().getKycListLogic();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('KYC Pending List'),
      ),
      body: const SafeArea(
        child: KycPendingBodyWidget(),
      ),
    );
  }
}