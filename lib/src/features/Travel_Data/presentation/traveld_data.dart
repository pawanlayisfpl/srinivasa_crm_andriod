import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Travel_Data/cubits/travel_data_cubit.dart';
import '../screens/travel_data_widget.dart';

class TravelDataScreen extends StatefulWidget {
  const TravelDataScreen({super.key});

  @override
  State<TravelDataScreen> createState() => _TravelDataScreenState();
}

class _TravelDataScreenState extends State<TravelDataScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((c)async {
      await context.read<TravelDataCubit>().getTickets();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: const Text('Travel Data'),actions: const [],),
      body: SafeArea(
        child: TravelDataWidget(),
      ),
    );
  }
}