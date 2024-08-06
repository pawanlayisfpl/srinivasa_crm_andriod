// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesOrderViewState {
  bool get isLoading => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;
  ViewSalesOrderModel get viewSalesOrderModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesOrderViewStateCopyWith<SalesOrderViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderViewStateCopyWith<$Res> {
  factory $SalesOrderViewStateCopyWith(
          SalesOrderViewState value, $Res Function(SalesOrderViewState) then) =
      _$SalesOrderViewStateCopyWithImpl<$Res, SalesOrderViewState>;
  @useResult
  $Res call(
      {bool isLoading,
      ApiFailedModel? apiFailedModel,
      ViewSalesOrderModel viewSalesOrderModel});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$SalesOrderViewStateCopyWithImpl<$Res, $Val extends SalesOrderViewState>
    implements $SalesOrderViewStateCopyWith<$Res> {
  _$SalesOrderViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
    Object? viewSalesOrderModel = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      viewSalesOrderModel: null == viewSalesOrderModel
          ? _value.viewSalesOrderModel
          : viewSalesOrderModel // ignore: cast_nullable_to_non_nullable
              as ViewSalesOrderModel,
    ) as $Val);
  }

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
abstract class _$$SalesOrderViewStateImplCopyWith<$Res>
    implements $SalesOrderViewStateCopyWith<$Res> {
  factory _$$SalesOrderViewStateImplCopyWith(_$SalesOrderViewStateImpl value,
          $Res Function(_$SalesOrderViewStateImpl) then) =
      __$$SalesOrderViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      ApiFailedModel? apiFailedModel,
      ViewSalesOrderModel viewSalesOrderModel});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$SalesOrderViewStateImplCopyWithImpl<$Res>
    extends _$SalesOrderViewStateCopyWithImpl<$Res, _$SalesOrderViewStateImpl>
    implements _$$SalesOrderViewStateImplCopyWith<$Res> {
  __$$SalesOrderViewStateImplCopyWithImpl(_$SalesOrderViewStateImpl _value,
      $Res Function(_$SalesOrderViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
    Object? viewSalesOrderModel = null,
  }) {
    return _then(_$SalesOrderViewStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      viewSalesOrderModel: null == viewSalesOrderModel
          ? _value.viewSalesOrderModel
          : viewSalesOrderModel // ignore: cast_nullable_to_non_nullable
              as ViewSalesOrderModel,
    ));
  }
}

/// @nodoc

class _$SalesOrderViewStateImpl implements _SalesOrderViewState {
  _$SalesOrderViewStateImpl(
      {required this.isLoading,
      this.apiFailedModel,
      required this.viewSalesOrderModel});

  @override
  final bool isLoading;
  @override
  final ApiFailedModel? apiFailedModel;
  @override
  final ViewSalesOrderModel viewSalesOrderModel;

  @override
  String toString() {
    return 'SalesOrderViewState(isLoading: $isLoading, apiFailedModel: $apiFailedModel, viewSalesOrderModel: $viewSalesOrderModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrderViewStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel) &&
            (identical(other.viewSalesOrderModel, viewSalesOrderModel) ||
                other.viewSalesOrderModel == viewSalesOrderModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, apiFailedModel, viewSalesOrderModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrderViewStateImplCopyWith<_$SalesOrderViewStateImpl> get copyWith =>
      __$$SalesOrderViewStateImplCopyWithImpl<_$SalesOrderViewStateImpl>(
          this, _$identity);
}

abstract class _SalesOrderViewState implements SalesOrderViewState {
  factory _SalesOrderViewState(
          {required final bool isLoading,
          final ApiFailedModel? apiFailedModel,
          required final ViewSalesOrderModel viewSalesOrderModel}) =
      _$SalesOrderViewStateImpl;

  @override
  bool get isLoading;
  @override
  ApiFailedModel? get apiFailedModel;
  @override
  ViewSalesOrderModel get viewSalesOrderModel;
  @override
  @JsonKey(ignore: true)
  _$$SalesOrderViewStateImplCopyWith<_$SalesOrderViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
