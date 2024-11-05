import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/repo/tickers_repo_impl.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Ticket/cubit/view_ticket_state.dart';

@injectable
class ViewTicketCubit extends Cubit<ViewTicketState> {
  final TicketsRepo ticketsRepo;

  ViewTicketCubit(this.ticketsRepo) : super(ViewTicketState.initial());

  Future<void> getTickets() async {
    emit(state.copyWith(isLoading: true, apiFailedModel: null, viewTicketsList: []));
    await Future.delayed(const Duration(milliseconds: 800));
    final results = await ticketsRepo.getTickets();
    results.fold(
      (l) => emit(state.copyWith(isLoading: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
      (r) => emit(state.copyWith(isLoading: false, viewTicketsList: r.data!)),
    );
  }

  

  void resetState() {
    emit(ViewTicketState.initial());
  }
}