import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/widgets/sales_order_create_body_widget.dart';


class SalesOrderCreateScren extends StatefulWidget {
  const SalesOrderCreateScren({super.key});

  @override
  State<SalesOrderCreateScren> createState() => _SalesOrderCreateScrenState();
}

class _SalesOrderCreateScrenState extends State<SalesOrderCreateScren> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((t) async  {
       context.read<SalesOrderCreateCubit>().resetForm();
    await  context.read<SalesOrderCreateCubit>().getAllInitialValues();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Order Create'),
      ),
      body: const SafeArea(child: SalesOrderCreateBodyWidget(),),
    );
  }
}