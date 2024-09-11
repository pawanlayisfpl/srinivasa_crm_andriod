import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/repo/kyc_repo.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/cubit/state/kyc_state.dart';

import '../../domain/model/customer_kyu_model.dart';

@injectable
class KycCubit extends Cubit<KycState> {
  KycCubit(this.kycRepo) : super(const KycState.initial());
  final KycRepo kycRepo;

    List<CustomerKycModel> approvedList = [];
    List<CustomerKycModel> inProcessList = [];
    List<CustomerKycModel> pendingList = [];
  

  void getKycListLogic() async {
    emit(const KycState.loading());
    await Future.delayed(const Duration(milliseconds: 800));
    final result = await kycRepo.getPendingKyuCustomers();
    result.fold((l) {
      emit(KycState.error(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
    }, (r) {
      emit(KycState.loaded(customerKycList: r));
      List<CustomerKycModel> list = r;
      pendingList = list.where((e) => e.kycStatus == 'PENDING').toList();

      approvedList = list.where((e) => e.kycStatus == 'APPROVED').toList();
      inProcessList = list.where((e) => e.kycStatus == 'IN_PROCESS').toList();
    });
  }
}