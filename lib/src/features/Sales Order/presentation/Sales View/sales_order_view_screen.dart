import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/cubit/sales_order_view_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/widget/sales_order_view_body_widget.dart';

class SalesOrderViewScreen extends StatefulWidget {
  const SalesOrderViewScreen({super.key});

  @override
  State<SalesOrderViewScreen> createState() => _SalesOrderViewScreenState();
}

class _SalesOrderViewScreenState extends State<SalesOrderViewScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
       context.read<SalesOrderViewCubit>().getSalesOrder();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Order View Screen'),
      ),
      body: SafeArea(child: SalesOrderViewBodyWidget(),),
    );
  }
}