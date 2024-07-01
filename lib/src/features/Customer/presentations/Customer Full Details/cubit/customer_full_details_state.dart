
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/get/customer_full_details_model.dart';

part 'customer_full_details_state.freezed.dart';

@freezed
class CustomerFullDetailsState with _$CustomerFullDetailsState {

  factory CustomerFullDetailsState.initial() = Initial;
  factory CustomerFullDetailsState.loading() = Loading;
  factory CustomerFullDetailsState.loaded({required CustomerFullDetailsModel customerFullDetailsModel}) = Loaded;
  factory CustomerFullDetailsState.error({ String? error}) = Error;

}