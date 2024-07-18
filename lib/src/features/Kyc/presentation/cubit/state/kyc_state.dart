import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../domain/model/customer_kyu_model.dart';

part 'kyc_state.freezed.dart';

@freezed
class KycState with _$KycState {
  const factory KycState.initial() = Initial;
  const factory KycState.loading() = Loading;
  const factory KycState.loaded({required List<CustomerKycModel> customerKycList}) = Loaded;
  const factory KycState.error({required ApiFailedModel apiFailedModel}) = Error;
}