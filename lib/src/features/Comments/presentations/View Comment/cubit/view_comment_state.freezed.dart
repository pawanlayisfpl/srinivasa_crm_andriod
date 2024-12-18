// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_comment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewCommentState {
  bool get isLoading => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;
  List<CommentsModel> get commentsList => throw _privateConstructorUsedError;

  /// Create a copy of ViewCommentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViewCommentStateCopyWith<ViewCommentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewCommentStateCopyWith<$Res> {
  factory $ViewCommentStateCopyWith(
          ViewCommentState value, $Res Function(ViewCommentState) then) =
      _$ViewCommentStateCopyWithImpl<$Res, ViewCommentState>;
  @useResult
  $Res call(
      {bool isLoading,
      ApiFailedModel? apiFailedModel,
      List<CommentsModel> commentsList});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$ViewCommentStateCopyWithImpl<$Res, $Val extends ViewCommentState>
    implements $ViewCommentStateCopyWith<$Res> {
  _$ViewCommentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViewCommentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
    Object? commentsList = null,
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
      commentsList: null == commentsList
          ? _value.commentsList
          : commentsList // ignore: cast_nullable_to_non_nullable
              as List<CommentsModel>,
    ) as $Val);
  }

  /// Create a copy of ViewCommentState
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
abstract class _$$ViewCommentStateImplCopyWith<$Res>
    implements $ViewCommentStateCopyWith<$Res> {
  factory _$$ViewCommentStateImplCopyWith(_$ViewCommentStateImpl value,
          $Res Function(_$ViewCommentStateImpl) then) =
      __$$ViewCommentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      ApiFailedModel? apiFailedModel,
      List<CommentsModel> commentsList});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$ViewCommentStateImplCopyWithImpl<$Res>
    extends _$ViewCommentStateCopyWithImpl<$Res, _$ViewCommentStateImpl>
    implements _$$ViewCommentStateImplCopyWith<$Res> {
  __$$ViewCommentStateImplCopyWithImpl(_$ViewCommentStateImpl _value,
      $Res Function(_$ViewCommentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewCommentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
    Object? commentsList = null,
  }) {
    return _then(_$ViewCommentStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      commentsList: null == commentsList
          ? _value._commentsList
          : commentsList // ignore: cast_nullable_to_non_nullable
              as List<CommentsModel>,
    ));
  }
}

/// @nodoc

class _$ViewCommentStateImpl implements _ViewCommentState {
  const _$ViewCommentStateImpl(
      {this.isLoading = false,
      this.apiFailedModel = null,
      final List<CommentsModel> commentsList = const []})
      : _commentsList = commentsList;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailedModel;
  final List<CommentsModel> _commentsList;
  @override
  @JsonKey()
  List<CommentsModel> get commentsList {
    if (_commentsList is EqualUnmodifiableListView) return _commentsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentsList);
  }

  @override
  String toString() {
    return 'ViewCommentState(isLoading: $isLoading, apiFailedModel: $apiFailedModel, commentsList: $commentsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewCommentStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel) &&
            const DeepCollectionEquality()
                .equals(other._commentsList, _commentsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, apiFailedModel,
      const DeepCollectionEquality().hash(_commentsList));

  /// Create a copy of ViewCommentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewCommentStateImplCopyWith<_$ViewCommentStateImpl> get copyWith =>
      __$$ViewCommentStateImplCopyWithImpl<_$ViewCommentStateImpl>(
          this, _$identity);
}

abstract class _ViewCommentState implements ViewCommentState {
  const factory _ViewCommentState(
      {final bool isLoading,
      final ApiFailedModel? apiFailedModel,
      final List<CommentsModel> commentsList}) = _$ViewCommentStateImpl;

  @override
  bool get isLoading;
  @override
  ApiFailedModel? get apiFailedModel;
  @override
  List<CommentsModel> get commentsList;

  /// Create a copy of ViewCommentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewCommentStateImplCopyWith<_$ViewCommentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
