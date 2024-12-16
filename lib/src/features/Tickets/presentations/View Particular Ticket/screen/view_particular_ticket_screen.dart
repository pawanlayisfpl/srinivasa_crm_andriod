// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/widgets/widgets.dart';

import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Particular%20Ticket/cubit/view_particular_ticket_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Particular%20Ticket/cubit/view_particular_ticket_state.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Particular%20Ticket/screen/ticket_details_screen.dart';

class ViewParticularTicketScreen extends StatefulWidget {
  final String ticketId;
  const ViewParticularTicketScreen({
    super.key,
    required this.ticketId,
  });

  @override
  State<ViewParticularTicketScreen> createState() =>
      _ViewParticularTicketScreenState();
}

class _ViewParticularTicketScreenState
    extends State<ViewParticularTicketScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((c) async {
      await context
          .read<ViewParticularTicketCubit>()
          .getParticularTicket(widget.ticketId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ticket Details"),
      ),
      body: BlocBuilder<ViewParticularTicketCubit, ViewParticularTicketState>(
        builder: (context, state) {
          return SafeArea(
            child: state.when(initial: () => const CustomLoadingWidget(), loading: () => const CustomLoadingWidget(), loaded: (data) {
              return TicketDetailsScreen(ticket: data);
            }, error: (data) {
              return CommonErrorWidget(error: "Something went wrong", callback: () {
                context.read<ViewParticularTicketCubit>().getParticularTicket(widget.ticketId);
              });
            }),
          );
        },
      ),
    );
  }
}
