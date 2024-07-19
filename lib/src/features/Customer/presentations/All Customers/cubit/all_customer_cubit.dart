import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../domain/repo/customer_repo.dart';
import 'all_customer_state.dart';

@injectable
class AllCustomerCubit extends Cubit<AllCustomerState> {
  final CustomerRepo customerRepo;

  AllCustomerCubit({
    required this.customerRepo,
  }) : super(const AllCustomerState.initial());

  Future<void> getAllCustomer() async {
    emit(const AllCustomerState.loading());
  final result = await customerRepo.getCustomers();
     result.fold(
      (l) {
        ApiFailedModel apiFailedModel = ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l), message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l));
        emit(AllCustomerState.error(apiFailedModel));
      },
      (r) => emit(AllCustomerState.loaded(r.customermodel ?? [])),
    );
  }

}