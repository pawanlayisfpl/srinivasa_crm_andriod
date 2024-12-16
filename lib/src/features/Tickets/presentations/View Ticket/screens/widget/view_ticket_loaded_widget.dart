// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:srinivasa_crm_new/src/common/widgets/widgets.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Ticket/cubit/view_ticket_cubit.dart';

import '../../../../data/model/get/view_ticket_resposne_model.dart';

class ViewTicketLoadedWidget extends StatelessWidget {
  final List<ViewTicketModel> viewTicketsList;

  const ViewTicketLoadedWidget({
    super.key,
    required this.viewTicketsList,
  });

  @override
  Widget build(BuildContext context) {
    if (viewTicketsList.isEmpty) {
      return EmptyWidget(title: "No tickets found", callback: () async {
       await context.read<ViewTicketCubit>().getTickets();
      });
    }

    return ListView.builder(
      itemCount: viewTicketsList.length,
      itemBuilder: (context, index) {
        return Column(
          children: viewTicketsList.map((ticket) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              elevation: 4.0,
              child: ListTile(
                
                leading: const Icon(Icons.airplane_ticket, color: Colors.blue),
                title: Text(
                  ticket.description ?? 'No Description',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID : ${ticket.ticketId}'),
                    Text('Created Date: ${DateFormat.yMMMd().format(DateTime.parse(ticket.createdDate.toString()))}'),
                    Text('Priority: ${ticket.priority?.priorityName ?? 'N/A'}'),
                    Text('Status: ${ticket.statusDTO?.statusName ?? 'N/A'}'),
                    Text('Service Request Type: ${ticket.serviceRequestTypeDTO?.serviceRequestTypeName ?? 'N/A'}'),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                    if(context.mounted) {
                // Navigator.push(context, ScaleRoute(screen: ViewParticularTicketScreen(ticketId: ticket.ticketId.toString())));

                    }
                  // Handle ticket tap
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
