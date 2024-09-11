import 'package:flutter/material.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/customer_kyu_model.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/screens/kyc_upload_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
      body:  Center(
        child: ElevatedButton(onPressed: () {
          Navigator.push(context, SlideRightRoute(screen: KycUploadScreen(customerKycModel: CustomerKycModel(
            customerId: '1234',
            customerName: 'Test Customer',
            kycStatus: "PENDING"
          ),)));

        }, child: const Text('Test Screen')),
      ),
    );
  }
}