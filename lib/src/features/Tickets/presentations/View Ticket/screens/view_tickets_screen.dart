import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/widgets/widgets.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Ticket/cubit/view_ticket_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Ticket/screens/widget/view_ticket_body_widget.dart';


class ViewTicketsScreen extends StatefulWidget {
  const ViewTicketsScreen({super.key});

  @override
  State<ViewTicketsScreen> createState() => _ViewTicketsScreenState();
}

class _ViewTicketsScreenState extends State<ViewTicketsScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((c)async {
      await context.read<ViewTicketCubit>().getTickets();
    });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: const Text('View Tickets'),actions: const [],),
      body:  SafeArea(
        child:   Visibility(
          visible: !context.watch<ViewTicketCubit>().state.isLoading,
          replacement: const CustomLoadingWidget(),
          child: const ViewTicketsBodyWidget()),
      ),
    );
  }
}