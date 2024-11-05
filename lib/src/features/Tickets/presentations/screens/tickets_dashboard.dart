import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:srinivasa_crm_new/shared/widgets/dashboard_card_widget.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/Add%20ticket/screen/add_ticket_screen.dart';

import '../View Ticket/screens/view_tickets_screen.dart';

class TicketDashbaordScreen extends StatefulWidget {
  const TicketDashbaordScreen({super.key});

  @override
  State<TicketDashbaordScreen> createState() => _TicketDashbaordScreenState();
}

class _TicketDashbaordScreenState extends State<TicketDashbaordScreen> {

    List<String> cardNames = [
      'Add Tickets',
      'View Tickets',
      // 'Search All Customer ',
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tickets Dashboard Screen"),),
      body: SafeArea(child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: cardNames.length,
          itemBuilder: (c,i) {
          return InkWell(
            splashColor: Colors.grey.shade200,
            onTap: () {
              switch(i) {
                case 0:
                Fluttertoast.showToast(msg: 'Add ticket clicked');
                Navigator.push(context, SlideLeftRoute(screen: const AddTicketScreen()));
                break;
                case 1:
                // Fluttertoast.showToast(msg: 'View tickets clicked');
                Navigator.push(context, SlideLeftRoute(screen: const ViewTicketsScreen()));
                break;
                default:
                Fluttertoast.showToast(msg: 'case not defined yet');
                break;
              }
            },
            child: DashboardChildrenCardWidget(
              
              
              title: cardNames[i].toString()),
          );
        }),
      ),),
    );
  }
}