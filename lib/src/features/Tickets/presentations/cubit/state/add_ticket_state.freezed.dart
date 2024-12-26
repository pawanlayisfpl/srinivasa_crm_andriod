// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_ticket_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddTicketState {
  TicketResponseModel? get ticketResponseModel =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSubmiting => throw _privateConstructorUsedError;
  bool get showInputError => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;
  ImageModel? get imageModel => throw _privateConstructorUsedError;
  List<ImageModel> get imageList => throw _privateConstructorUsedError;
  StringField get descriptionField => throw _privateConstructorUsedError;
  PriorityModel? get selectedPriorityModel =>
      throw _privateConstructorUsedError;
  ServiceRequestModel? get selectedServiceRequestModel =>
      throw _privateConstructorUsedError;

  /// Create a copy of AddTicketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddTicketStateCopyWith<AddTicketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTicketStateCopyWith<$Res> {
  factory $AddTicketStateCopyWith(
          AddTicketState value, $Res Function(AddTicketState) then) =
      _$AddTicketStateCopyWithImpl<$Res, AddTicketState>;
  @useResult
  $Res call(
      {TicketResponseModel? ticketResponseModel,
      bool isLoading,
      bool isSubmiting,
      bool showInputError,
      ApiFailedModel? apiFailedModel,
      ImageModel? imageModel,
      List<ImageModel> imageList,
      StringField descriptionField,
      PriorityModel? selectedPriorityModel,
      ServiceRequestModel? selectedServiceRequestModel});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$AddTicketStateCopyWithImpl<$Res, $Val extends AddTicketState>
    implements $AddTicketStateCopyWith<$Res> {
  _$AddTicketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddTicketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketResponseModel = freezed,
    Object? isLoading = null,
    Object? isSubmiting = null,
    Object? showInputError = null,
    Object? apiFailedModel = freezed,
    Object? imageModel = freezed,
    Object? imageList = null,
    Object? descriptionField = null,
    Object? selectedPriorityModel = freezed,
    Object? selectedServiceRequestModel = freezed,
  }) {
    return _then(_value.copyWith(
      ticketResponseModel: freezed == ticketResponseModel
          ? _value.ticketResponseModel
          : ticketResponseModel // ignore: cast_nullable_to_non_nullable
              as TicketResponseModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmiting: null == isSubmiting
          ? _value.isSubmiting
          : isSubmiting // ignore: cast_nullable_to_non_nullable
              as bool,
      showInputError: null == showInputError
          ? _value.showInputError
          : showInputError // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      imageModel: freezed == imageModel
          ? _value.imageModel
          : imageModel // ignore: cast_nullable_to_non_nullable
              as ImageModel?,
      imageList: null == imageList
          ? _value.imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      descriptionField: null == descriptionField
          ? _value.descriptionField
          : descriptionField // ignore: cast_nullable_to_non_nullable
              as StringField,
      selectedPriorityModel: freezed == selectedPriorityModel
          ? _value.selectedPriorityModel
          : selectedPriorityModel // ignore: cast_nullable_to_non_nullable
              as PriorityModel?,
      selectedServiceRequestModel: freezed == selectedServiceRequestModel
          ? _value.selectedServiceRequestModel
          : selectedServiceRequestModel // ignore: cast_nullable_to_non_nullable
              as ServiceRequestModel?,
    ) as $Val);
  }

  /// Create a copy of AddTicketState
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
abstract class _$$AddTicketStateImplCopyWith<$Res>
    implements $AddTicketStateCopyWith<$Res> {
  factory _$$AddTicketStateImplCopyWith(_$AddTicketStateImpl value,
          $Res Function(_$AddTicketStateImpl) then) =
      __$$AddTicketStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TicketResponseModel? ticketResponseModel,
      bool isLoading,
      bool isSubmiting,
      bool showInputError,
      ApiFailedModel? apiFailedModel,
      ImageModel? imageModel,
      List<ImageModel> imageList,
      StringField descriptionField,
      PriorityModel? selectedPriorityModel,
      ServiceRequestModel? selectedServiceRequestModel});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$AddTicketStateImplCopyWithImpl<$Res>
    extends _$AddTicketStateCopyWithImpl<$Res, _$AddTicketStateImpl>
    implements _$$AddTicketStateImplCopyWith<$Res> {
  __$$AddTicketStateImplCopyWithImpl(
      _$AddTicketStateImpl _value, $Res Function(_$AddTicketStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddTicketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketResponseModel = freezed,
    Object? isLoading = null,
    Object? isSubmiting = null,
    Object? showInputError = null,
    Object? apiFailedModel = freezed,
    Object? imageModel = freezed,
    Object? imageList = null,
    Object? descriptionField = null,
    Object? selectedPriorityModel = freezed,
    Object? selectedServiceRequestModel = freezed,
  }) {
    return _then(_$AddTicketStateImpl(
      ticketResponseModel: freezed == ticketResponseModel
          ? _value.ticketResponseModel
          : ticketResponseModel // ignore: cast_nullable_to_non_nullable
              as TicketResponseModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmiting: null == isSubmiting
          ? _value.isSubmiting
          : isSubmiting // ignore: cast_nullable_to_non_nullable
              as bool,
      showInputError: null == showInputError
          ? _value.showInputError
          : showInputError // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      imageModel: freezed == imageModel
          ? _value.imageModel
          : imageModel // ignore: cast_nullable_to_non_nullable
              as ImageModel?,
      imageList: null == imageList
          ? _value._imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      descriptionField: null == descriptionField
          ? _value.descriptionField
          : descriptionField // ignore: cast_nullable_to_non_nullable
              as StringField,
      selectedPriorityModel: freezed == selectedPriorityModel
          ? _value.selectedPriorityModel
          : selectedPriorityModel // ignore: cast_nullable_to_non_nullable
              as PriorityModel?,
      selectedServiceRequestModel: freezed == selectedServiceRequestModel
          ? _value.selectedServiceRequestModel
          : selectedServiceRequestModel // ignore: cast_nullable_to_non_nullable
              as ServiceRequestModel?,
    ));
  }
}

/// @nodoc

class _$AddTicketStateImpl implements _AddTicketState {
  const _$AddTicketStateImpl(
      {this.ticketResponseModel,
      this.isLoading = false,
      this.isSubmiting = false,
      this.showInputError = false,
      this.apiFailedModel = null,
      this.imageModel = null,
      final List<ImageModel> imageList = const [],
      required this.descriptionField,
      this.selectedPriorityModel,
      this.selectedServiceRequestModel})
      : _imageList = imageList;

  @override
  final TicketResponseModel? ticketResponseModel;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSubmiting;
  @override
  @JsonKey()
  final bool showInputError;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailedModel;
  @override
  @JsonKey()
  final ImageModel? imageModel;
  final List<ImageModel> _imageList;
  @override
  @JsonKey()
  List<ImageModel> get imageList {
    if (_imageList is EqualUnmodifiableListView) return _imageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageList);
  }

  @override
  final StringField descriptionField;
  @override
  final PriorityModel? selectedPriorityModel;
  @override
  final ServiceRequestModel? selectedServiceRequestModel;

  @override
  String toString() {
    return 'AddTicketState(ticketResponseModel: $ticketResponseModel, isLoading: $isLoading, isSubmiting: $isSubmiting, showInputError: $showInputError, apiFailedModel: $apiFailedModel, imageModel: $imageModel, imageList: $imageList, descriptionField: $descriptionField, selectedPriorityModel: $selectedPriorityModel, selectedServiceRequestModel: $selectedServiceRequestModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTicketStateImpl &&
            (identical(other.ticketResponseModel, ticketResponseModel) ||
                other.ticketResponseModel == ticketResponseModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSubmiting, isSubmiting) ||
                other.isSubmiting == isSubmiting) &&
            (identical(other.showInputError, showInputError) ||
                other.showInputError == showInputError) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel) &&
            (identical(other.imageModel, imageModel) ||
                other.imageModel == imageModel) &&
            const DeepCollectionEquality()
                .equals(other._imageList, _imageList) &&
            (identical(other.descriptionField, descriptionField) ||
                other.descriptionField == descriptionField) &&
            (identical(other.selectedPriorityModel, selectedPriorityModel) ||
                other.selectedPriorityModel == selectedPriorityModel) &&
            (identical(other.selectedServiceRequestModel,
                    selectedServiceRequestModel) ||
                other.selectedServiceRequestModel ==
                    selectedServiceRequestModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      ticketResponseModel,
      isLoading,
      isSubmiting,
      showInputError,
      apiFailedModel,
      imageModel,
      const DeepCollectionEquality().hash(_imageList),
      descriptionField,
      selectedPriorityModel,
      selectedServiceRequestModel);

  /// Create a copy of AddTicketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTicketStateImplCopyWith<_$AddTicketStateImpl> get copyWith =>
      __$$AddTicketStateImplCopyWithImpl<_$AddTicketStateImpl>(
          this, _$identity);
}

abstract class _AddTicketState implements AddTicketState {
  const factory _AddTicketState(
          {final TicketResponseModel? ticketResponseModel,
          final bool isLoading,
          final bool isSubmiting,
          final bool showInputError,
          final ApiFailedModel? apiFailedModel,
          final ImageModel? imageModel,
          final List<ImageModel> imageList,
          required final StringField descriptionField,
          final PriorityModel? selectedPriorityModel,
          final ServiceRequestModel? selectedServiceRequestModel}) =
      _$AddTicketStateImpl;

  @override
  TicketResponseModel? get ticketResponseModel;
  @override
  bool get isLoading;
  @override
  bool get isSubmiting;
  @override
  bool get showInputError;
  @override
  ApiFailedModel? get apiFailedModel;
  @override
  ImageModel? get imageModel;
  @override
  List<ImageModel> get imageList;
  @override
  StringField get descriptionField;
  @override
  PriorityModel? get selectedPriorityModel;
  @override
  ServiceRequestModel? get selectedServiceRequestModel;

  /// Create a copy of AddTicketState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddTicketStateImplCopyWith<_$AddTicketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
