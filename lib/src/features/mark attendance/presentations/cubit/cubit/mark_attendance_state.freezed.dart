// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark_attendance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MarkAttendanceState {
  LastPunchInResponseModel? get lastPunchInResponseModel =>
      throw _privateConstructorUsedError;
  bool get punchInFailure => throw _privateConstructorUsedError;
  bool get punchOutFailure => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get punchInSuccess => throw _privateConstructorUsedError;
  bool get punchOutSuccess => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailModel => throw _privateConstructorUsedError;
  bool get loaded => throw _privateConstructorUsedError;

  /// Create a copy of MarkAttendanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarkAttendanceStateCopyWith<MarkAttendanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkAttendanceStateCopyWith<$Res> {
  factory $MarkAttendanceStateCopyWith(
          MarkAttendanceState value, $Res Function(MarkAttendanceState) then) =
      _$MarkAttendanceStateCopyWithImpl<$Res, MarkAttendanceState>;
  @useResult
  $Res call(
      {LastPunchInResponseModel? lastPunchInResponseModel,
      bool punchInFailure,
      bool punchOutFailure,
      bool loading,
      bool isSubmitting,
      bool punchInSuccess,
      bool punchOutSuccess,
      ApiFailedModel? apiFailModel,
      bool loaded});

  $ApiFailedModelCopyWith<$Res>? get apiFailModel;
}

/// @nodoc
class _$MarkAttendanceStateCopyWithImpl<$Res, $Val extends MarkAttendanceState>
    implements $MarkAttendanceStateCopyWith<$Res> {
  _$MarkAttendanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarkAttendanceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastPunchInResponseModel = freezed,
    Object? punchInFailure = null,
    Object? punchOutFailure = null,
    Object? loading = null,
    Object? isSubmitting = null,
    Object? punchInSuccess = null,
    Object? punchOutSuccess = null,
    Object? apiFailModel = freezed,
    Object? loaded = null,
  }) {
    return _then(_value.copyWith(
      lastPunchInResponseModel: freezed == lastPunchInResponseModel
          ? _value.lastPunchInResponseModel
          : lastPunchInResponseModel // ignore: cast_nullable_to_non_nullable
              as LastPunchInResponseModel?,
      punchInFailure: null == punchInFailure
          ? _value.punchInFailure
          : punchInFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      punchOutFailure: null == punchOutFailure
          ? _value.punchOutFailure
          : punchOutFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      punchInSuccess: null == punchInSuccess
          ? _value.punchInSuccess
          : punchInSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      punchOutSuccess: null == punchOutSuccess
          ? _value.punchOutSuccess
          : punchOutSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailModel: freezed == apiFailModel
          ? _value.apiFailModel
          : apiFailModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      loaded: null == loaded
          ? _value.loaded
          : loaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of MarkAttendanceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiFailedModelCopyWith<$Res>? get apiFailModel {
    if (_value.apiFailModel == null) {
      return null;
    }

    return $ApiFailedModelCopyWith<$Res>(_value.apiFailModel!, (value) {
      return _then(_value.copyWith(apiFailModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MarkAttendanceStateImplCopyWith<$Res>
    implements $MarkAttendanceStateCopyWith<$Res> {
  factory _$$MarkAttendanceStateImplCopyWith(_$MarkAttendanceStateImpl value,
          $Res Function(_$MarkAttendanceStateImpl) then) =
      __$$MarkAttendanceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LastPunchInResponseModel? lastPunchInResponseModel,
      bool punchInFailure,
      bool punchOutFailure,
      bool loading,
      bool isSubmitting,
      bool punchInSuccess,
      bool punchOutSuccess,
      ApiFailedModel? apiFailModel,
      bool loaded});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailModel;
}

/// @nodoc
class __$$MarkAttendanceStateImplCopyWithImpl<$Res>
    extends _$MarkAttendanceStateCopyWithImpl<$Res, _$MarkAttendanceStateImpl>
    implements _$$MarkAttendanceStateImplCopyWith<$Res> {
  __$$MarkAttendanceStateImplCopyWithImpl(_$MarkAttendanceStateImpl _value,
      $Res Function(_$MarkAttendanceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarkAttendanceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastPunchInResponseModel = freezed,
    Object? punchInFailure = null,
    Object? punchOutFailure = null,
    Object? loading = null,
    Object? isSubmitting = null,
    Object? punchInSuccess = null,
    Object? punchOutSuccess = null,
    Object? apiFailModel = freezed,
    Object? loaded = null,
  }) {
    return _then(_$MarkAttendanceStateImpl(
      lastPunchInResponseModel: freezed == lastPunchInResponseModel
          ? _value.lastPunchInResponseModel
          : lastPunchInResponseModel // ignore: cast_nullable_to_non_nullable
              as LastPunchInResponseModel?,
      punchInFailure: null == punchInFailure
          ? _value.punchInFailure
          : punchInFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      punchOutFailure: null == punchOutFailure
          ? _value.punchOutFailure
          : punchOutFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      punchInSuccess: null == punchInSuccess
          ? _value.punchInSuccess
          : punchInSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      punchOutSuccess: null == punchOutSuccess
          ? _value.punchOutSuccess
          : punchOutSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailModel: freezed == apiFailModel
          ? _value.apiFailModel
          : apiFailModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      loaded: null == loaded
          ? _value.loaded
          : loaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MarkAttendanceStateImpl implements _MarkAttendanceState {
  const _$MarkAttendanceStateImpl(
      {this.lastPunchInResponseModel = null,
      this.punchInFailure = false,
      this.punchOutFailure = false,
      this.loading = false,
      this.isSubmitting = false,
      this.punchInSuccess = false,
      this.punchOutSuccess = false,
      this.apiFailModel = null,
      this.loaded = false});

  @override
  @JsonKey()
  final LastPunchInResponseModel? lastPunchInResponseModel;
  @override
  @JsonKey()
  final bool punchInFailure;
  @override
  @JsonKey()
  final bool punchOutFailure;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool punchInSuccess;
  @override
  @JsonKey()
  final bool punchOutSuccess;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailModel;
  @override
  @JsonKey()
  final bool loaded;

  @override
  String toString() {
    return 'MarkAttendanceState(lastPunchInResponseModel: $lastPunchInResponseModel, punchInFailure: $punchInFailure, punchOutFailure: $punchOutFailure, loading: $loading, isSubmitting: $isSubmitting, punchInSuccess: $punchInSuccess, punchOutSuccess: $punchOutSuccess, apiFailModel: $apiFailModel, loaded: $loaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAttendanceStateImpl &&
            (identical(
                    other.lastPunchInResponseModel, lastPunchInResponseModel) ||
                other.lastPunchInResponseModel == lastPunchInResponseModel) &&
            (identical(other.punchInFailure, punchInFailure) ||
                other.punchInFailure == punchInFailure) &&
            (identical(other.punchOutFailure, punchOutFailure) ||
                other.punchOutFailure == punchOutFailure) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.punchInSuccess, punchInSuccess) ||
                other.punchInSuccess == punchInSuccess) &&
            (identical(other.punchOutSuccess, punchOutSuccess) ||
                other.punchOutSuccess == punchOutSuccess) &&
            (identical(other.apiFailModel, apiFailModel) ||
                other.apiFailModel == apiFailModel) &&
            (identical(other.loaded, loaded) || other.loaded == loaded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      lastPunchInResponseModel,
      punchInFailure,
      punchOutFailure,
      loading,
      isSubmitting,
      punchInSuccess,
      punchOutSuccess,
      apiFailModel,
      loaded);

  /// Create a copy of MarkAttendanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAttendanceStateImplCopyWith<_$MarkAttendanceStateImpl> get copyWith =>
      __$$MarkAttendanceStateImplCopyWithImpl<_$MarkAttendanceStateImpl>(
          this, _$identity);
}

abstract class _MarkAttendanceState implements MarkAttendanceState {
  const factory _MarkAttendanceState(
      {final LastPunchInResponseModel? lastPunchInResponseModel,
      final bool punchInFailure,
      final bool punchOutFailure,
      final bool loading,
      final bool isSubmitting,
      final bool punchInSuccess,
      final bool punchOutSuccess,
      final ApiFailedModel? apiFailModel,
      final bool loaded}) = _$MarkAttendanceStateImpl;

  @override
  LastPunchInResponseModel? get lastPunchInResponseModel;
  @override
  bool get punchInFailure;
  @override
  bool get punchOutFailure;
  @override
  bool get loading;
  @override
  bool get isSubmitting;
  @override
  bool get punchInSuccess;
  @override
  bool get punchOutSuccess;
  @override
  ApiFailedModel? get apiFailModel;
  @override
  bool get loaded;

  /// Create a copy of MarkAttendanceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkAttendanceStateImplCopyWith<_$MarkAttendanceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
