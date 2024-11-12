import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Ticket/cubit/view_ticket_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Ticket/cubit/view_ticket_state.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Ticket/screens/widget/view_ticket_loaded_widget.dart';


class ViewTicketsBodyWidget extends StatelessWidget {
  const ViewTicketsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewTicketCubit, ViewTicketState>(
      builder: (context, state) {
        return ViewTicketLoadedWidget(viewTicketsList: state.viewTicketsList,);
      },
    );
  }
}
