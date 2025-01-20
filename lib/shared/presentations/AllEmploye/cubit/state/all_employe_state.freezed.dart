// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_employe_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AllEmployeState {
  AllEmployesModel? get allEmployeModel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;

  /// Create a copy of AllEmployeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllEmployeStateCopyWith<AllEmployeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllEmployeStateCopyWith<$Res> {
  factory $AllEmployeStateCopyWith(
          AllEmployeState value, $Res Function(AllEmployeState) then) =
      _$AllEmployeStateCopyWithImpl<$Res, AllEmployeState>;
  @useResult
  $Res call(
      {AllEmployesModel? allEmployeModel,
      bool isLoading,
      ApiFailedModel? apiFailedModel});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$AllEmployeStateCopyWithImpl<$Res, $Val extends AllEmployeState>
    implements $AllEmployeStateCopyWith<$Res> {
  _$AllEmployeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllEmployeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allEmployeModel = freezed,
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
  }) {
    return _then(_value.copyWith(
      allEmployeModel: freezed == allEmployeModel
          ? _value.allEmployeModel
          : allEmployeModel // ignore: cast_nullable_to_non_nullable
              as AllEmployesModel?,
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

  /// Create a copy of AllEmployeState
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
abstract class _$$AllEmployeStateImplCopyWith<$Res>
    implements $AllEmployeStateCopyWith<$Res> {
  factory _$$AllEmployeStateImplCopyWith(_$AllEmployeStateImpl value,
          $Res Function(_$AllEmployeStateImpl) then) =
      __$$AllEmployeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AllEmployesModel? allEmployeModel,
      bool isLoading,
      ApiFailedModel? apiFailedModel});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$AllEmployeStateImplCopyWithImpl<$Res>
    extends _$AllEmployeStateCopyWithImpl<$Res, _$AllEmployeStateImpl>
    implements _$$AllEmployeStateImplCopyWith<$Res> {
  __$$AllEmployeStateImplCopyWithImpl(
      _$AllEmployeStateImpl _value, $Res Function(_$AllEmployeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllEmployeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allEmployeModel = freezed,
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
  }) {
    return _then(_$AllEmployeStateImpl(
      allEmployeModel: freezed == allEmployeModel
          ? _value.allEmployeModel
          : allEmployeModel // ignore: cast_nullable_to_non_nullable
              as AllEmployesModel?,
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

class _$AllEmployeStateImpl implements _AllEmployeState {
  const _$AllEmployeStateImpl(
      {this.allEmployeModel = null,
      this.isLoading = false,
      this.apiFailedModel = null});

  @override
  @JsonKey()
  final AllEmployesModel? allEmployeModel;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailedModel;

  @override
  String toString() {
    return 'AllEmployeState(allEmployeModel: $allEmployeModel, isLoading: $isLoading, apiFailedModel: $apiFailedModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllEmployeStateImpl &&
            (identical(other.allEmployeModel, allEmployeModel) ||
                other.allEmployeModel == allEmployeModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, allEmployeModel, isLoading, apiFailedModel);

  /// Create a copy of AllEmployeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllEmployeStateImplCopyWith<_$AllEmployeStateImpl> get copyWith =>
      __$$AllEmployeStateImplCopyWithImpl<_$AllEmployeStateImpl>(
          this, _$identity);
}

abstract class _AllEmployeState implements AllEmployeState {
  const factory _AllEmployeState(
      {final AllEmployesModel? allEmployeModel,
      final bool isLoading,
      final ApiFailedModel? apiFailedModel}) = _$AllEmployeStateImpl;

  @override
  AllEmployesModel? get allEmployeModel;
  @override
  bool get isLoading;
  @override
  ApiFailedModel? get apiFailedModel;

  /// Create a copy of AllEmployeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllEmployeStateImplCopyWith<_$AllEmployeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
