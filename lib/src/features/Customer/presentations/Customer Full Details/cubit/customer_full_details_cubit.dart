// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repo/customer_repo.dart';
import 'customer_full_details_state.dart';


@injectable
class CustomerFullDetailsCubit extends Cubit<CustomerFullDetailsState> {
  final CustomerRepo customerRepo;

  CustomerFullDetailsCubit({required this.customerRepo}) : super(CustomerFullDetailsState.initial());
 



  Future<void> loadCustomerByid({required String customerCode}) async {
    emit(CustomerFullDetailsState.loading());
    await Future.delayed(const Duration(milliseconds: 800));
    final results = await customerRepo.getCustomerFullDetails(customerCode: customerCode);
    results.fold(
      (l) => emit(CustomerFullDetailsState.error(error: l.toString())),
      (customerFullDetailsModel) {
        emit(CustomerFullDetailsState.loaded(customerFullDetailsModel: customerFullDetailsModel));
      },
    );

  }
}
