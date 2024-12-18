// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_comment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddCommentState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  CommentsResponseModel? get commentsResponseModel =>
      throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;
  StringField get commentField => throw _privateConstructorUsedError;

  /// Create a copy of AddCommentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddCommentStateCopyWith<AddCommentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCommentStateCopyWith<$Res> {
  factory $AddCommentStateCopyWith(
          AddCommentState value, $Res Function(AddCommentState) then) =
      _$AddCommentStateCopyWithImpl<$Res, AddCommentState>;
  @useResult
  $Res call(
      {bool isSubmitting,
      CommentsResponseModel? commentsResponseModel,
      ApiFailedModel? apiFailedModel,
      StringField commentField});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$AddCommentStateCopyWithImpl<$Res, $Val extends AddCommentState>
    implements $AddCommentStateCopyWith<$Res> {
  _$AddCommentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddCommentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? commentsResponseModel = freezed,
    Object? apiFailedModel = freezed,
    Object? commentField = null,
  }) {
    return _then(_value.copyWith(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      commentsResponseModel: freezed == commentsResponseModel
          ? _value.commentsResponseModel
          : commentsResponseModel // ignore: cast_nullable_to_non_nullable
              as CommentsResponseModel?,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      commentField: null == commentField
          ? _value.commentField
          : commentField // ignore: cast_nullable_to_non_nullable
              as StringField,
    ) as $Val);
  }

  /// Create a copy of AddCommentState
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
abstract class _$$$_AddCommentStateImplCopyWith<$Res>
    implements $AddCommentStateCopyWith<$Res> {
  factory _$$$_AddCommentStateImplCopyWith(_$$_AddCommentStateImpl value,
          $Res Function(_$$_AddCommentStateImpl) then) =
      __$$$_AddCommentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSubmitting,
      CommentsResponseModel? commentsResponseModel,
      ApiFailedModel? apiFailedModel,
      StringField commentField});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$$_AddCommentStateImplCopyWithImpl<$Res>
    extends _$AddCommentStateCopyWithImpl<$Res, _$$_AddCommentStateImpl>
    implements _$$$_AddCommentStateImplCopyWith<$Res> {
  __$$$_AddCommentStateImplCopyWithImpl(_$$_AddCommentStateImpl _value,
      $Res Function(_$$_AddCommentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddCommentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? commentsResponseModel = freezed,
    Object? apiFailedModel = freezed,
    Object? commentField = null,
  }) {
    return _then(_$$_AddCommentStateImpl(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      commentsResponseModel: freezed == commentsResponseModel
          ? _value.commentsResponseModel
          : commentsResponseModel // ignore: cast_nullable_to_non_nullable
              as CommentsResponseModel?,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      commentField: null == commentField
          ? _value.commentField
          : commentField // ignore: cast_nullable_to_non_nullable
              as StringField,
    ));
  }
}

/// @nodoc

class _$$_AddCommentStateImpl implements _$_AddCommentState {
  const _$$_AddCommentStateImpl(
      {this.isSubmitting = false,
      this.commentsResponseModel = null,
      this.apiFailedModel = null,
      required this.commentField});

  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final CommentsResponseModel? commentsResponseModel;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailedModel;
  @override
  final StringField commentField;

  @override
  String toString() {
    return 'AddCommentState(isSubmitting: $isSubmitting, commentsResponseModel: $commentsResponseModel, apiFailedModel: $apiFailedModel, commentField: $commentField)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$_AddCommentStateImpl &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.commentsResponseModel, commentsResponseModel) ||
                other.commentsResponseModel == commentsResponseModel) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel) &&
            (identical(other.commentField, commentField) ||
                other.commentField == commentField));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSubmitting,
      commentsResponseModel, apiFailedModel, commentField);

  /// Create a copy of AddCommentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$_AddCommentStateImplCopyWith<_$$_AddCommentStateImpl> get copyWith =>
      __$$$_AddCommentStateImplCopyWithImpl<_$$_AddCommentStateImpl>(
          this, _$identity);
}

abstract class _$_AddCommentState implements AddCommentState {
  const factory _$_AddCommentState(
      {final bool isSubmitting,
      final CommentsResponseModel? commentsResponseModel,
      final ApiFailedModel? apiFailedModel,
      required final StringField commentField}) = _$$_AddCommentStateImpl;

  @override
  bool get isSubmitting;
  @override
  CommentsResponseModel? get commentsResponseModel;
  @override
  ApiFailedModel? get apiFailedModel;
  @override
  StringField get commentField;

  /// Create a copy of AddCommentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$_AddCommentStateImplCopyWith<_$$_AddCommentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
