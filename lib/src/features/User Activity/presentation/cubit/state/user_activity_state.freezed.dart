// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_activity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserActivityState {
  bool get isLoading => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;
  UserActivityModel? get userActivityModel =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserActivityStateCopyWith<UserActivityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActivityStateCopyWith<$Res> {
  factory $UserActivityStateCopyWith(
          UserActivityState value, $Res Function(UserActivityState) then) =
      _$UserActivityStateCopyWithImpl<$Res, UserActivityState>;
  @useResult
  $Res call(
      {bool isLoading,
      ApiFailedModel? apiFailedModel,
      UserActivityModel? userActivityModel});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$UserActivityStateCopyWithImpl<$Res, $Val extends UserActivityState>
    implements $UserActivityStateCopyWith<$Res> {
  _$UserActivityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
    Object? userActivityModel = freezed,
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
      userActivityModel: freezed == userActivityModel
          ? _value.userActivityModel
          : userActivityModel // ignore: cast_nullable_to_non_nullable
              as UserActivityModel?,
    ) as $Val);
  }

  /// Create a copy of UserActivityState
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
abstract class _$$UserActivityStateImplCopyWith<$Res>
    implements $UserActivityStateCopyWith<$Res> {
  factory _$$UserActivityStateImplCopyWith(_$UserActivityStateImpl value,
          $Res Function(_$UserActivityStateImpl) then) =
      __$$UserActivityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      ApiFailedModel? apiFailedModel,
      UserActivityModel? userActivityModel});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$UserActivityStateImplCopyWithImpl<$Res>
    extends _$UserActivityStateCopyWithImpl<$Res, _$UserActivityStateImpl>
    implements _$$UserActivityStateImplCopyWith<$Res> {
  __$$UserActivityStateImplCopyWithImpl(_$UserActivityStateImpl _value,
      $Res Function(_$UserActivityStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
    Object? userActivityModel = freezed,
  }) {
    return _then(_$UserActivityStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      userActivityModel: freezed == userActivityModel
          ? _value.userActivityModel
          : userActivityModel // ignore: cast_nullable_to_non_nullable
              as UserActivityModel?,
    ));
  }
}

/// @nodoc

class _$UserActivityStateImpl implements _UserActivityState {
  _$UserActivityStateImpl(
      {this.isLoading = false,
      this.apiFailedModel = null,
      this.userActivityModel = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailedModel;
  @override
  @JsonKey()
  final UserActivityModel? userActivityModel;

  @override
  String toString() {
    return 'UserActivityState(isLoading: $isLoading, apiFailedModel: $apiFailedModel, userActivityModel: $userActivityModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserActivityStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel) &&
            (identical(other.userActivityModel, userActivityModel) ||
                other.userActivityModel == userActivityModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, apiFailedModel, userActivityModel);

  /// Create a copy of UserActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserActivityStateImplCopyWith<_$UserActivityStateImpl> get copyWith =>
      __$$UserActivityStateImplCopyWithImpl<_$UserActivityStateImpl>(
          this, _$identity);
}

abstract class _UserActivityState implements UserActivityState {
  factory _UserActivityState(
      {final bool isLoading,
      final ApiFailedModel? apiFailedModel,
      final UserActivityModel? userActivityModel}) = _$UserActivityStateImpl;

  @override
  bool get isLoading;
  @override
  ApiFailedModel? get apiFailedModel;
  @override
  UserActivityModel? get userActivityModel;

  /// Create a copy of UserActivityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserActivityStateImplCopyWith<_$UserActivityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
