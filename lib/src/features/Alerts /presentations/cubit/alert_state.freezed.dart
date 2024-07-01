// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AlertState {
  List<AlertModel> get alertsList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlertStateCopyWith<AlertState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertStateCopyWith<$Res> {
  factory $AlertStateCopyWith(
          AlertState value, $Res Function(AlertState) then) =
      _$AlertStateCopyWithImpl<$Res, AlertState>;
  @useResult
  $Res call(
      {List<AlertModel> alertsList,
      bool isLoading,
      ApiFailedModel? apiFailedModel});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$AlertStateCopyWithImpl<$Res, $Val extends AlertState>
    implements $AlertStateCopyWith<$Res> {
  _$AlertStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alertsList = null,
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
  }) {
    return _then(_value.copyWith(
      alertsList: null == alertsList
          ? _value.alertsList
          : alertsList // ignore: cast_nullable_to_non_nullable
              as List<AlertModel>,
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
abstract class _$$AlertStateImplCopyWith<$Res>
    implements $AlertStateCopyWith<$Res> {
  factory _$$AlertStateImplCopyWith(
          _$AlertStateImpl value, $Res Function(_$AlertStateImpl) then) =
      __$$AlertStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AlertModel> alertsList,
      bool isLoading,
      ApiFailedModel? apiFailedModel});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$AlertStateImplCopyWithImpl<$Res>
    extends _$AlertStateCopyWithImpl<$Res, _$AlertStateImpl>
    implements _$$AlertStateImplCopyWith<$Res> {
  __$$AlertStateImplCopyWithImpl(
      _$AlertStateImpl _value, $Res Function(_$AlertStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alertsList = null,
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
  }) {
    return _then(_$AlertStateImpl(
      alertsList: null == alertsList
          ? _value._alertsList
          : alertsList // ignore: cast_nullable_to_non_nullable
              as List<AlertModel>,
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

class _$AlertStateImpl implements _AlertState {
  const _$AlertStateImpl(
      {final List<AlertModel> alertsList = const [],
      this.isLoading = false,
      this.apiFailedModel = null})
      : _alertsList = alertsList;

  final List<AlertModel> _alertsList;
  @override
  @JsonKey()
  List<AlertModel> get alertsList {
    if (_alertsList is EqualUnmodifiableListView) return _alertsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alertsList);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailedModel;

  @override
  String toString() {
    return 'AlertState(alertsList: $alertsList, isLoading: $isLoading, apiFailedModel: $apiFailedModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertStateImpl &&
            const DeepCollectionEquality()
                .equals(other._alertsList, _alertsList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_alertsList),
      isLoading,
      apiFailedModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertStateImplCopyWith<_$AlertStateImpl> get copyWith =>
      __$$AlertStateImplCopyWithImpl<_$AlertStateImpl>(this, _$identity);
}

abstract class _AlertState implements AlertState {
  const factory _AlertState(
      {final List<AlertModel> alertsList,
      final bool isLoading,
      final ApiFailedModel? apiFailedModel}) = _$AlertStateImpl;

  @override
  List<AlertModel> get alertsList;
  @override
  bool get isLoading;
  @override
  ApiFailedModel? get apiFailedModel;
  @override
  @JsonKey(ignore: true)
  _$$AlertStateImplCopyWith<_$AlertStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
