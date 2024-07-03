// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_paln_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonthlyPlanSearchState {
  String get searchQuery => throw _privateConstructorUsedError;
  List<EmployeeModel> get empolyesList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSearchingAgain => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MonthlyPlanSearchStateCopyWith<MonthlyPlanSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyPlanSearchStateCopyWith<$Res> {
  factory $MonthlyPlanSearchStateCopyWith(MonthlyPlanSearchState value,
          $Res Function(MonthlyPlanSearchState) then) =
      _$MonthlyPlanSearchStateCopyWithImpl<$Res, MonthlyPlanSearchState>;
  @useResult
  $Res call(
      {String searchQuery,
      List<EmployeeModel> empolyesList,
      bool isLoading,
      bool isSearchingAgain,
      bool hasError});
}

/// @nodoc
class _$MonthlyPlanSearchStateCopyWithImpl<$Res,
        $Val extends MonthlyPlanSearchState>
    implements $MonthlyPlanSearchStateCopyWith<$Res> {
  _$MonthlyPlanSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? empolyesList = null,
    Object? isLoading = null,
    Object? isSearchingAgain = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      empolyesList: null == empolyesList
          ? _value.empolyesList
          : empolyesList // ignore: cast_nullable_to_non_nullable
              as List<EmployeeModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchingAgain: null == isSearchingAgain
          ? _value.isSearchingAgain
          : isSearchingAgain // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyPlanSearchStateImplCopyWith<$Res>
    implements $MonthlyPlanSearchStateCopyWith<$Res> {
  factory _$$MonthlyPlanSearchStateImplCopyWith(
          _$MonthlyPlanSearchStateImpl value,
          $Res Function(_$MonthlyPlanSearchStateImpl) then) =
      __$$MonthlyPlanSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery,
      List<EmployeeModel> empolyesList,
      bool isLoading,
      bool isSearchingAgain,
      bool hasError});
}

/// @nodoc
class __$$MonthlyPlanSearchStateImplCopyWithImpl<$Res>
    extends _$MonthlyPlanSearchStateCopyWithImpl<$Res,
        _$MonthlyPlanSearchStateImpl>
    implements _$$MonthlyPlanSearchStateImplCopyWith<$Res> {
  __$$MonthlyPlanSearchStateImplCopyWithImpl(
      _$MonthlyPlanSearchStateImpl _value,
      $Res Function(_$MonthlyPlanSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? empolyesList = null,
    Object? isLoading = null,
    Object? isSearchingAgain = null,
    Object? hasError = null,
  }) {
    return _then(_$MonthlyPlanSearchStateImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      empolyesList: null == empolyesList
          ? _value._empolyesList
          : empolyesList // ignore: cast_nullable_to_non_nullable
              as List<EmployeeModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchingAgain: null == isSearchingAgain
          ? _value.isSearchingAgain
          : isSearchingAgain // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MonthlyPlanSearchStateImpl implements _MonthlyPlanSearchState {
  const _$MonthlyPlanSearchStateImpl(
      {this.searchQuery = '',
      final List<EmployeeModel> empolyesList = const [],
      this.isLoading = false,
      this.isSearchingAgain = false,
      this.hasError = false})
      : _empolyesList = empolyesList;

  @override
  @JsonKey()
  final String searchQuery;
  final List<EmployeeModel> _empolyesList;
  @override
  @JsonKey()
  List<EmployeeModel> get empolyesList {
    if (_empolyesList is EqualUnmodifiableListView) return _empolyesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_empolyesList);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSearchingAgain;
  @override
  @JsonKey()
  final bool hasError;

  @override
  String toString() {
    return 'MonthlyPlanSearchState(searchQuery: $searchQuery, empolyesList: $empolyesList, isLoading: $isLoading, isSearchingAgain: $isSearchingAgain, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyPlanSearchStateImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality()
                .equals(other._empolyesList, _empolyesList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSearchingAgain, isSearchingAgain) ||
                other.isSearchingAgain == isSearchingAgain) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchQuery,
      const DeepCollectionEquality().hash(_empolyesList),
      isLoading,
      isSearchingAgain,
      hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyPlanSearchStateImplCopyWith<_$MonthlyPlanSearchStateImpl>
      get copyWith => __$$MonthlyPlanSearchStateImplCopyWithImpl<
          _$MonthlyPlanSearchStateImpl>(this, _$identity);
}

abstract class _MonthlyPlanSearchState implements MonthlyPlanSearchState {
  const factory _MonthlyPlanSearchState(
      {final String searchQuery,
      final List<EmployeeModel> empolyesList,
      final bool isLoading,
      final bool isSearchingAgain,
      final bool hasError}) = _$MonthlyPlanSearchStateImpl;

  @override
  String get searchQuery;
  @override
  List<EmployeeModel> get empolyesList;
  @override
  bool get isLoading;
  @override
  bool get isSearchingAgain;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$MonthlyPlanSearchStateImplCopyWith<_$MonthlyPlanSearchStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
