// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_customer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchCustomerState {
  String get searchQuery => throw _privateConstructorUsedError;
  List<Customermodel> get customers => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSearchingAgain => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchCustomerStateCopyWith<SearchCustomerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCustomerStateCopyWith<$Res> {
  factory $SearchCustomerStateCopyWith(
          SearchCustomerState value, $Res Function(SearchCustomerState) then) =
      _$SearchCustomerStateCopyWithImpl<$Res, SearchCustomerState>;
  @useResult
  $Res call(
      {String searchQuery,
      List<Customermodel> customers,
      bool isLoading,
      bool isSearchingAgain,
      bool hasError});
}

/// @nodoc
class _$SearchCustomerStateCopyWithImpl<$Res, $Val extends SearchCustomerState>
    implements $SearchCustomerStateCopyWith<$Res> {
  _$SearchCustomerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? customers = null,
    Object? isLoading = null,
    Object? isSearchingAgain = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      customers: null == customers
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customermodel>,
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
abstract class _$$SearchCustomerStateImplCopyWith<$Res>
    implements $SearchCustomerStateCopyWith<$Res> {
  factory _$$SearchCustomerStateImplCopyWith(_$SearchCustomerStateImpl value,
          $Res Function(_$SearchCustomerStateImpl) then) =
      __$$SearchCustomerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery,
      List<Customermodel> customers,
      bool isLoading,
      bool isSearchingAgain,
      bool hasError});
}

/// @nodoc
class __$$SearchCustomerStateImplCopyWithImpl<$Res>
    extends _$SearchCustomerStateCopyWithImpl<$Res, _$SearchCustomerStateImpl>
    implements _$$SearchCustomerStateImplCopyWith<$Res> {
  __$$SearchCustomerStateImplCopyWithImpl(_$SearchCustomerStateImpl _value,
      $Res Function(_$SearchCustomerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? customers = null,
    Object? isLoading = null,
    Object? isSearchingAgain = null,
    Object? hasError = null,
  }) {
    return _then(_$SearchCustomerStateImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      customers: null == customers
          ? _value._customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customermodel>,
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

class _$SearchCustomerStateImpl implements _SearchCustomerState {
  const _$SearchCustomerStateImpl(
      {this.searchQuery = '',
      final List<Customermodel> customers = const [],
      this.isLoading = false,
      this.isSearchingAgain = false,
      this.hasError = false})
      : _customers = customers;

  @override
  @JsonKey()
  final String searchQuery;
  final List<Customermodel> _customers;
  @override
  @JsonKey()
  List<Customermodel> get customers {
    if (_customers is EqualUnmodifiableListView) return _customers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customers);
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
    return 'SearchCustomerState(searchQuery: $searchQuery, customers: $customers, isLoading: $isLoading, isSearchingAgain: $isSearchingAgain, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchCustomerStateImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality()
                .equals(other._customers, _customers) &&
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
      const DeepCollectionEquality().hash(_customers),
      isLoading,
      isSearchingAgain,
      hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCustomerStateImplCopyWith<_$SearchCustomerStateImpl> get copyWith =>
      __$$SearchCustomerStateImplCopyWithImpl<_$SearchCustomerStateImpl>(
          this, _$identity);
}

abstract class _SearchCustomerState implements SearchCustomerState {
  const factory _SearchCustomerState(
      {final String searchQuery,
      final List<Customermodel> customers,
      final bool isLoading,
      final bool isSearchingAgain,
      final bool hasError}) = _$SearchCustomerStateImpl;

  @override
  String get searchQuery;
  @override
  List<Customermodel> get customers;
  @override
  bool get isLoading;
  @override
  bool get isSearchingAgain;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$SearchCustomerStateImplCopyWith<_$SearchCustomerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
