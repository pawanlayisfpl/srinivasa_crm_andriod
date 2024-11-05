// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_ticket_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewTicketState {
  bool get isLoading => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;
  List<ViewTicketModel> get viewTicketsList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewTicketStateCopyWith<ViewTicketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewTicketStateCopyWith<$Res> {
  factory $ViewTicketStateCopyWith(
          ViewTicketState value, $Res Function(ViewTicketState) then) =
      _$ViewTicketStateCopyWithImpl<$Res, ViewTicketState>;
  @useResult
  $Res call(
      {bool isLoading,
      ApiFailedModel? apiFailedModel,
      List<ViewTicketModel> viewTicketsList});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$ViewTicketStateCopyWithImpl<$Res, $Val extends ViewTicketState>
    implements $ViewTicketStateCopyWith<$Res> {
  _$ViewTicketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
    Object? viewTicketsList = null,
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
      viewTicketsList: null == viewTicketsList
          ? _value.viewTicketsList
          : viewTicketsList // ignore: cast_nullable_to_non_nullable
              as List<ViewTicketModel>,
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
abstract class _$$ViewTicketStateImplCopyWith<$Res>
    implements $ViewTicketStateCopyWith<$Res> {
  factory _$$ViewTicketStateImplCopyWith(_$ViewTicketStateImpl value,
          $Res Function(_$ViewTicketStateImpl) then) =
      __$$ViewTicketStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      ApiFailedModel? apiFailedModel,
      List<ViewTicketModel> viewTicketsList});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$ViewTicketStateImplCopyWithImpl<$Res>
    extends _$ViewTicketStateCopyWithImpl<$Res, _$ViewTicketStateImpl>
    implements _$$ViewTicketStateImplCopyWith<$Res> {
  __$$ViewTicketStateImplCopyWithImpl(
      _$ViewTicketStateImpl _value, $Res Function(_$ViewTicketStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? apiFailedModel = freezed,
    Object? viewTicketsList = null,
  }) {
    return _then(_$ViewTicketStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      viewTicketsList: null == viewTicketsList
          ? _value._viewTicketsList
          : viewTicketsList // ignore: cast_nullable_to_non_nullable
              as List<ViewTicketModel>,
    ));
  }
}

/// @nodoc

class _$ViewTicketStateImpl implements _ViewTicketState {
  _$ViewTicketStateImpl(
      {this.isLoading = false,
      this.apiFailedModel = null,
      final List<ViewTicketModel> viewTicketsList = const []})
      : _viewTicketsList = viewTicketsList;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailedModel;
  final List<ViewTicketModel> _viewTicketsList;
  @override
  @JsonKey()
  List<ViewTicketModel> get viewTicketsList {
    if (_viewTicketsList is EqualUnmodifiableListView) return _viewTicketsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewTicketsList);
  }

  @override
  String toString() {
    return 'ViewTicketState(isLoading: $isLoading, apiFailedModel: $apiFailedModel, viewTicketsList: $viewTicketsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewTicketStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel) &&
            const DeepCollectionEquality()
                .equals(other._viewTicketsList, _viewTicketsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, apiFailedModel,
      const DeepCollectionEquality().hash(_viewTicketsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewTicketStateImplCopyWith<_$ViewTicketStateImpl> get copyWith =>
      __$$ViewTicketStateImplCopyWithImpl<_$ViewTicketStateImpl>(
          this, _$identity);
}

abstract class _ViewTicketState implements ViewTicketState {
  factory _ViewTicketState(
      {final bool isLoading,
      final ApiFailedModel? apiFailedModel,
      final List<ViewTicketModel> viewTicketsList}) = _$ViewTicketStateImpl;

  @override
  bool get isLoading;
  @override
  ApiFailedModel? get apiFailedModel;
  @override
  List<ViewTicketModel> get viewTicketsList;
  @override
  @JsonKey(ignore: true)
  _$$ViewTicketStateImplCopyWith<_$ViewTicketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
