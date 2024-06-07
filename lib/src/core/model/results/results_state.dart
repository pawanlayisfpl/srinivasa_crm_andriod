import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../network exception/network_exception.dart';

part 'results_state.freezed.dart';

@freezed
abstract class ResultState<T> with _$ResultState<T> {
  const factory ResultState.initial() = Idle<T>;

  const factory ResultState.loading() = Loading<T>;

  const factory ResultState.loaded({required T data}) = Data<T>;

  const factory ResultState.failed({required NetworkExceptions error}) =
      Error<T>;
}


// how to use this results state example 
// class MovieBloc extends Bloc<MovieEvent, ResultState<List<Movie>>> {
//   final APIRepository apiRepository;

//   MovieBloc({this.apiRepository})
//       : assert(apiRepository != null),
//         super(Idle());

//   @override
//   Stream<ResultState<List<Movie>>> mapEventToState(MovieEvent event) {

//   }
// }
