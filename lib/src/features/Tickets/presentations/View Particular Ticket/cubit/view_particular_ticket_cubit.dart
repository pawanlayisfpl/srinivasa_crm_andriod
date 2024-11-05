// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import 'package:srinivasa_crm_new/src/features/Tickets/data/repo/tickers_repo_impl.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Particular%20Ticket/cubit/view_particular_ticket_state.dart';


@injectable
class ViewParticularTicketCubit extends Cubit<ViewParticularTicketState> {
  final TicketsRepo ticketsRepo;
  ViewParticularTicketCubit(
    this.ticketsRepo,
  ) : super(const ViewParticularTicketState.initial());



  Future<void> getParticularTicket(String ticketId) async {
    emit(const ViewParticularTicketState.loading());
    await Future.delayed(const Duration(milliseconds: 800));
    final results = await ticketsRepo.getTicketsById(ticketId: int.parse(ticketId));
    results.fold(
      (l) => emit(ViewParticularTicketState.error(ApiFailedModel.fromNetworkExceptions(l))),
      (r) => emit(ViewParticularTicketState.loaded(r)),
    );
  }



}
