import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/widgets/widgets.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/model/get/view_ticket_resposne_model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Ticket/cubit/view_ticket_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Ticket/cubit/view_ticket_state.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Ticket/screens/widget/view_ticket_loaded_widget.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Ticket/screens/widget/view_ticket_loading_widget.dart';

import '../../../../../../core/model/model.dart';

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
