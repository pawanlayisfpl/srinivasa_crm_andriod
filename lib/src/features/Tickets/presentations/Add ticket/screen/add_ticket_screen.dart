import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/widgets/text/common_textfield_heading_widget.dart';
import 'package:srinivasa_crm_new/src/common/widgets/widgets.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/Add%20ticket/screen/widget/ticket_description_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/Add%20ticket/screen/widget/ticket_service_request_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/cubit/add_ticket_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/cubit/state/add_ticket_state.dart';

import 'widget/ticket_priority_dropdown_widget.dart';

class AddTicketScreen extends StatefulWidget {
  const AddTicketScreen({super.key});

  @override
  State<AddTicketScreen> createState() => _AddTicketScreenState();
}

class _AddTicketScreenState extends State<AddTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Ticket Scree"),
      ),
      body: PopScope(
        onPopInvoked: (c) {
          context.read<AddTicketCubit>().resetState();
        } ,
        child: SingleChildScrollView(
          child: BlocBuilder<AddTicketCubit, AddTicketState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,
                  const CommonTextFieldHeadingWidget(title: 'Description',isRequired: true,),
                  TicketDespTextFieldWidget(),
                 
                   10.verticalSpace,
                  const CommonTextFieldHeadingWidget(title: 'Priority',isRequired: true,),
                  const TicketPriorityDropDownWidget(),
                   10.verticalSpace,
                  const CommonTextFieldHeadingWidget(title: 'Service Request Type',isRequired: true,),
                  const TicketServiceRequestDropDownWidget(),
                  30.verticalSpace,
                  CommonButton(callback: () => submitbtnFunction(context), title: "Submit"),
        
        
                ],
              ).withSymetricPadding(horizontalPadding: 20.w);
            },
          ),
        ),
      ),
    );
  }
}

submitbtnFunction(BuildContext context)  async {
  if(context.mounted) {
    context.read<AddTicketCubit>().onSubmit(context);
  }
  
}
