// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order_particular_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesOrderParticularState {
  ParticularSalesOrderModel? get particularSalesModel =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;

  /// Create a copy of SalesOrderParticularState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesOrderParticularStateCopyWith<SalesOrderParticularState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderParticularStateCopyWith<$Res> {
  factory $SalesOrderParticularStateCopyWith(SalesOrderParticularState value,
          $Res Function(SalesOrderParticularState) then) =
      _$SalesOrderParticularStateCopyWithImpl<$Res, SalesOrderParticularState>;
  @useResult
  $Res call(
      {ParticularSalesOrderModel? particularSalesModel,
      bool isLoading,
      ApiFailedModel? apiFailedModel});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$SalesOrderParticularStateCopyWithImpl<$Res,
        $Val extends SalesOrderParticularState>
    implements $SalesOrderParticularStateCopyWith<$Res> {
  _$SalesOrderParticularStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderParticularState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? particularSalesModel = freezed,
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
  }) {
    return _then(_value.copyWith(
      particularSalesModel: freezed == particularSalesModel
          ? _value.particularSalesModel
          : particularSalesModel // ignore: cast_nullable_to_non_nullable
              as ParticularSalesOrderModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
    ) as $Val);
  }

  /// Create a copy of SalesOrderParticularState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel {
    if (_value.apiFailedModel == null) {
      return null;
    }

    return $ApiFailedModelCopyWith<$Res>(_value.apiFailedModel!, (value) {
      return _then(_value.copyWith(apiFailedModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalesOrderViewScreenStateImplCopyWith<$Res>
    implements $SalesOrderParticularStateCopyWith<$Res> {
  factory _$$SalesOrderViewScreenStateImplCopyWith(
          _$SalesOrderViewScreenStateImpl value,
          $Res Function(_$SalesOrderViewScreenStateImpl) then) =
      __$$SalesOrderViewScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ParticularSalesOrderModel? particularSalesModel,
      bool isLoading,
      ApiFailedModel? apiFailedModel});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$SalesOrderViewScreenStateImplCopyWithImpl<$Res>
    extends _$SalesOrderParticularStateCopyWithImpl<$Res,
        _$SalesOrderViewScreenStateImpl>
    implements _$$SalesOrderViewScreenStateImplCopyWith<$Res> {
  __$$SalesOrderViewScreenStateImplCopyWithImpl(
      _$SalesOrderViewScreenStateImpl _value,
      $Res Function(_$SalesOrderViewScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderParticularState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? particularSalesModel = freezed,
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
  }) {
    return _then(_$SalesOrderViewScreenStateImpl(
      particularSalesModel: freezed == particularSalesModel
          ? _value.particularSalesModel
          : particularSalesModel // ignore: cast_nullable_to_non_nullable
              as ParticularSalesOrderModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
    ));
  }
}

/// @nodoc

class _$SalesOrderViewScreenStateImpl implements _SalesOrderViewScreenState {
  _$SalesOrderViewScreenStateImpl(
      {this.particularSalesModel = null,
      this.isLoading = false,
      this.apiFailedModel = null});

  @override
  @JsonKey()
  final ParticularSalesOrderModel? particularSalesModel;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailedModel;

  @override
  String toString() {
    return 'SalesOrderParticularState(particularSalesModel: $particularSalesModel, isLoading: $isLoading, apiFailedModel: $apiFailedModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrderViewScreenStateImpl &&
            (identical(other.particularSalesModel, particularSalesModel) ||
                other.particularSalesModel == particularSalesModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, particularSalesModel, isLoading, apiFailedModel);

  /// Create a copy of SalesOrderParticularState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrderViewScreenStateImplCopyWith<_$SalesOrderViewScreenStateImpl>
      get copyWith => __$$SalesOrderViewScreenStateImplCopyWithImpl<
          _$SalesOrderViewScreenStateImpl>(this, _$identity);
}

abstract class _SalesOrderViewScreenState implements SalesOrderParticularState {
  factory _SalesOrderViewScreenState(
      {final ParticularSalesOrderModel? particularSalesModel,
      final bool isLoading,
      final ApiFailedModel? apiFailedModel}) = _$SalesOrderViewScreenStateImpl;

  @override
  ParticularSalesOrderModel? get particularSalesModel;
  @override
  bool get isLoading;
  @override
  ApiFailedModel? get apiFailedModel;

  /// Create a copy of SalesOrderParticularState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesOrderViewScreenStateImplCopyWith<_$SalesOrderViewScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
