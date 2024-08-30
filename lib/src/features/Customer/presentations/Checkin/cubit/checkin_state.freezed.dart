// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckinState {
  List<JoinEmployeModel> get employeList => throw _privateConstructorUsedError;
  List<JoinEmployeModel> get selectedEmployeList =>
      throw _privateConstructorUsedError;
  CheckInResponseModel? get checkInResponseModel =>
      throw _privateConstructorUsedError;
  CheckoutResponseModel? get checkoutResponseModel =>
      throw _privateConstructorUsedError;
  LastCheckinOutResponseModel? get lastCheckinOutResponseModel =>
      throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;
  List<PurposeModel> get purposeList => throw _privateConstructorUsedError;
  List<PurposeModel> get selectedPurposeList =>
      throw _privateConstructorUsedError;
  PurposeModel? get selectedPurpose => throw _privateConstructorUsedError;
  bool get isCheckIn => throw _privateConstructorUsedError;
  bool get isCheckOut => throw _privateConstructorUsedError;
  bool get loaded => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  List<FileModel> get filesList => throw _privateConstructorUsedError;
  List<ImageModel> get imageLists => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckinStateCopyWith<CheckinState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckinStateCopyWith<$Res> {
  factory $CheckinStateCopyWith(
          CheckinState value, $Res Function(CheckinState) then) =
      _$CheckinStateCopyWithImpl<$Res, CheckinState>;
  @useResult
  $Res call(
      {List<JoinEmployeModel> employeList,
      List<JoinEmployeModel> selectedEmployeList,
      CheckInResponseModel? checkInResponseModel,
      CheckoutResponseModel? checkoutResponseModel,
      LastCheckinOutResponseModel? lastCheckinOutResponseModel,
      ApiFailedModel? apiFailedModel,
      List<PurposeModel> purposeList,
      List<PurposeModel> selectedPurposeList,
      PurposeModel? selectedPurpose,
      bool isCheckIn,
      bool isCheckOut,
      bool loaded,
      bool isLoading,
      bool isFailed,
      List<FileModel> filesList,
      List<ImageModel> imageLists});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$CheckinStateCopyWithImpl<$Res, $Val extends CheckinState>
    implements $CheckinStateCopyWith<$Res> {
  _$CheckinStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeList = null,
    Object? selectedEmployeList = null,
    Object? checkInResponseModel = freezed,
    Object? checkoutResponseModel = freezed,
    Object? lastCheckinOutResponseModel = freezed,
    Object? apiFailedModel = freezed,
    Object? purposeList = null,
    Object? selectedPurposeList = null,
    Object? selectedPurpose = freezed,
    Object? isCheckIn = null,
    Object? isCheckOut = null,
    Object? loaded = null,
    Object? isLoading = null,
    Object? isFailed = null,
    Object? filesList = null,
    Object? imageLists = null,
  }) {
    return _then(_value.copyWith(
      employeList: null == employeList
          ? _value.employeList
          : employeList // ignore: cast_nullable_to_non_nullable
              as List<JoinEmployeModel>,
      selectedEmployeList: null == selectedEmployeList
          ? _value.selectedEmployeList
          : selectedEmployeList // ignore: cast_nullable_to_non_nullable
              as List<JoinEmployeModel>,
      checkInResponseModel: freezed == checkInResponseModel
          ? _value.checkInResponseModel
          : checkInResponseModel // ignore: cast_nullable_to_non_nullable
              as CheckInResponseModel?,
      checkoutResponseModel: freezed == checkoutResponseModel
          ? _value.checkoutResponseModel
          : checkoutResponseModel // ignore: cast_nullable_to_non_nullable
              as CheckoutResponseModel?,
      lastCheckinOutResponseModel: freezed == lastCheckinOutResponseModel
          ? _value.lastCheckinOutResponseModel
          : lastCheckinOutResponseModel // ignore: cast_nullable_to_non_nullable
              as LastCheckinOutResponseModel?,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      purposeList: null == purposeList
          ? _value.purposeList
          : purposeList // ignore: cast_nullable_to_non_nullable
              as List<PurposeModel>,
      selectedPurposeList: null == selectedPurposeList
          ? _value.selectedPurposeList
          : selectedPurposeList // ignore: cast_nullable_to_non_nullable
              as List<PurposeModel>,
      selectedPurpose: freezed == selectedPurpose
          ? _value.selectedPurpose
          : selectedPurpose // ignore: cast_nullable_to_non_nullable
              as PurposeModel?,
      isCheckIn: null == isCheckIn
          ? _value.isCheckIn
          : isCheckIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckOut: null == isCheckOut
          ? _value.isCheckOut
          : isCheckOut // ignore: cast_nullable_to_non_nullable
              as bool,
      loaded: null == loaded
          ? _value.loaded
          : loaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      filesList: null == filesList
          ? _value.filesList
          : filesList // ignore: cast_nullable_to_non_nullable
              as List<FileModel>,
      imageLists: null == imageLists
          ? _value.imageLists
          : imageLists // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
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
abstract class _$$CheckinStateImplCopyWith<$Res>
    implements $CheckinStateCopyWith<$Res> {
  factory _$$CheckinStateImplCopyWith(
          _$CheckinStateImpl value, $Res Function(_$CheckinStateImpl) then) =
      __$$CheckinStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<JoinEmployeModel> employeList,
      List<JoinEmployeModel> selectedEmployeList,
      CheckInResponseModel? checkInResponseModel,
      CheckoutResponseModel? checkoutResponseModel,
      LastCheckinOutResponseModel? lastCheckinOutResponseModel,
      ApiFailedModel? apiFailedModel,
      List<PurposeModel> purposeList,
      List<PurposeModel> selectedPurposeList,
      PurposeModel? selectedPurpose,
      bool isCheckIn,
      bool isCheckOut,
      bool loaded,
      bool isLoading,
      bool isFailed,
      List<FileModel> filesList,
      List<ImageModel> imageLists});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$CheckinStateImplCopyWithImpl<$Res>
    extends _$CheckinStateCopyWithImpl<$Res, _$CheckinStateImpl>
    implements _$$CheckinStateImplCopyWith<$Res> {
  __$$CheckinStateImplCopyWithImpl(
      _$CheckinStateImpl _value, $Res Function(_$CheckinStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeList = null,
    Object? selectedEmployeList = null,
    Object? checkInResponseModel = freezed,
    Object? checkoutResponseModel = freezed,
    Object? lastCheckinOutResponseModel = freezed,
    Object? apiFailedModel = freezed,
    Object? purposeList = null,
    Object? selectedPurposeList = null,
    Object? selectedPurpose = freezed,
    Object? isCheckIn = null,
    Object? isCheckOut = null,
    Object? loaded = null,
    Object? isLoading = null,
    Object? isFailed = null,
    Object? filesList = null,
    Object? imageLists = null,
  }) {
    return _then(_$CheckinStateImpl(
      employeList: null == employeList
          ? _value._employeList
          : employeList // ignore: cast_nullable_to_non_nullable
              as List<JoinEmployeModel>,
      selectedEmployeList: null == selectedEmployeList
          ? _value._selectedEmployeList
          : selectedEmployeList // ignore: cast_nullable_to_non_nullable
              as List<JoinEmployeModel>,
      checkInResponseModel: freezed == checkInResponseModel
          ? _value.checkInResponseModel
          : checkInResponseModel // ignore: cast_nullable_to_non_nullable
              as CheckInResponseModel?,
      checkoutResponseModel: freezed == checkoutResponseModel
          ? _value.checkoutResponseModel
          : checkoutResponseModel // ignore: cast_nullable_to_non_nullable
              as CheckoutResponseModel?,
      lastCheckinOutResponseModel: freezed == lastCheckinOutResponseModel
          ? _value.lastCheckinOutResponseModel
          : lastCheckinOutResponseModel // ignore: cast_nullable_to_non_nullable
              as LastCheckinOutResponseModel?,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      purposeList: null == purposeList
          ? _value._purposeList
          : purposeList // ignore: cast_nullable_to_non_nullable
              as List<PurposeModel>,
      selectedPurposeList: null == selectedPurposeList
          ? _value._selectedPurposeList
          : selectedPurposeList // ignore: cast_nullable_to_non_nullable
              as List<PurposeModel>,
      selectedPurpose: freezed == selectedPurpose
          ? _value.selectedPurpose
          : selectedPurpose // ignore: cast_nullable_to_non_nullable
              as PurposeModel?,
      isCheckIn: null == isCheckIn
          ? _value.isCheckIn
          : isCheckIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckOut: null == isCheckOut
          ? _value.isCheckOut
          : isCheckOut // ignore: cast_nullable_to_non_nullable
              as bool,
      loaded: null == loaded
          ? _value.loaded
          : loaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      filesList: null == filesList
          ? _value._filesList
          : filesList // ignore: cast_nullable_to_non_nullable
              as List<FileModel>,
      imageLists: null == imageLists
          ? _value._imageLists
          : imageLists // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
    ));
  }
}

/// @nodoc

class _$CheckinStateImpl implements _CheckinState {
  const _$CheckinStateImpl(
      {required final List<JoinEmployeModel> employeList,
      required final List<JoinEmployeModel> selectedEmployeList,
      this.checkInResponseModel = null,
      this.checkoutResponseModel = null,
      this.lastCheckinOutResponseModel = null,
      this.apiFailedModel = null,
      final List<PurposeModel> purposeList = const [],
      final List<PurposeModel> selectedPurposeList = const [],
      this.selectedPurpose = null,
      this.isCheckIn = false,
      this.isCheckOut = false,
      this.loaded = false,
      this.isLoading = false,
      this.isFailed = false,
      final List<FileModel> filesList = const [],
      final List<ImageModel> imageLists = const []})
      : _employeList = employeList,
        _selectedEmployeList = selectedEmployeList,
        _purposeList = purposeList,
        _selectedPurposeList = selectedPurposeList,
        _filesList = filesList,
        _imageLists = imageLists;

  final List<JoinEmployeModel> _employeList;
  @override
  List<JoinEmployeModel> get employeList {
    if (_employeList is EqualUnmodifiableListView) return _employeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_employeList);
  }

  final List<JoinEmployeModel> _selectedEmployeList;
  @override
  List<JoinEmployeModel> get selectedEmployeList {
    if (_selectedEmployeList is EqualUnmodifiableListView)
      return _selectedEmployeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedEmployeList);
  }

  @override
  @JsonKey()
  final CheckInResponseModel? checkInResponseModel;
  @override
  @JsonKey()
  final CheckoutResponseModel? checkoutResponseModel;
  @override
  @JsonKey()
  final LastCheckinOutResponseModel? lastCheckinOutResponseModel;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailedModel;
  final List<PurposeModel> _purposeList;
  @override
  @JsonKey()
  List<PurposeModel> get purposeList {
    if (_purposeList is EqualUnmodifiableListView) return _purposeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purposeList);
  }

  final List<PurposeModel> _selectedPurposeList;
  @override
  @JsonKey()
  List<PurposeModel> get selectedPurposeList {
    if (_selectedPurposeList is EqualUnmodifiableListView)
      return _selectedPurposeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedPurposeList);
  }

  @override
  @JsonKey()
  final PurposeModel? selectedPurpose;
  @override
  @JsonKey()
  final bool isCheckIn;
  @override
  @JsonKey()
  final bool isCheckOut;
  @override
  @JsonKey()
  final bool loaded;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isFailed;
  final List<FileModel> _filesList;
  @override
  @JsonKey()
  List<FileModel> get filesList {
    if (_filesList is EqualUnmodifiableListView) return _filesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filesList);
  }

  final List<ImageModel> _imageLists;
  @override
  @JsonKey()
  List<ImageModel> get imageLists {
    if (_imageLists is EqualUnmodifiableListView) return _imageLists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageLists);
  }

  @override
  String toString() {
    return 'CheckinState(employeList: $employeList, selectedEmployeList: $selectedEmployeList, checkInResponseModel: $checkInResponseModel, checkoutResponseModel: $checkoutResponseModel, lastCheckinOutResponseModel: $lastCheckinOutResponseModel, apiFailedModel: $apiFailedModel, purposeList: $purposeList, selectedPurposeList: $selectedPurposeList, selectedPurpose: $selectedPurpose, isCheckIn: $isCheckIn, isCheckOut: $isCheckOut, loaded: $loaded, isLoading: $isLoading, isFailed: $isFailed, filesList: $filesList, imageLists: $imageLists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckinStateImpl &&
            const DeepCollectionEquality()
                .equals(other._employeList, _employeList) &&
            const DeepCollectionEquality()
                .equals(other._selectedEmployeList, _selectedEmployeList) &&
            (identical(other.checkInResponseModel, checkInResponseModel) ||
                other.checkInResponseModel == checkInResponseModel) &&
            (identical(other.checkoutResponseModel, checkoutResponseModel) ||
                other.checkoutResponseModel == checkoutResponseModel) &&
            (identical(other.lastCheckinOutResponseModel,
                    lastCheckinOutResponseModel) ||
                other.lastCheckinOutResponseModel ==
                    lastCheckinOutResponseModel) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel) &&
            const DeepCollectionEquality()
                .equals(other._purposeList, _purposeList) &&
            const DeepCollectionEquality()
                .equals(other._selectedPurposeList, _selectedPurposeList) &&
            (identical(other.selectedPurpose, selectedPurpose) ||
                other.selectedPurpose == selectedPurpose) &&
            (identical(other.isCheckIn, isCheckIn) ||
                other.isCheckIn == isCheckIn) &&
            (identical(other.isCheckOut, isCheckOut) ||
                other.isCheckOut == isCheckOut) &&
            (identical(other.loaded, loaded) || other.loaded == loaded) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            const DeepCollectionEquality()
                .equals(other._filesList, _filesList) &&
            const DeepCollectionEquality()
                .equals(other._imageLists, _imageLists));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_employeList),
      const DeepCollectionEquality().hash(_selectedEmployeList),
      checkInResponseModel,
      checkoutResponseModel,
      lastCheckinOutResponseModel,
      apiFailedModel,
      const DeepCollectionEquality().hash(_purposeList),
      const DeepCollectionEquality().hash(_selectedPurposeList),
      selectedPurpose,
      isCheckIn,
      isCheckOut,
      loaded,
      isLoading,
      isFailed,
      const DeepCollectionEquality().hash(_filesList),
      const DeepCollectionEquality().hash(_imageLists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckinStateImplCopyWith<_$CheckinStateImpl> get copyWith =>
      __$$CheckinStateImplCopyWithImpl<_$CheckinStateImpl>(this, _$identity);
}

abstract class _CheckinState implements CheckinState {
  const factory _CheckinState(
      {required final List<JoinEmployeModel> employeList,
      required final List<JoinEmployeModel> selectedEmployeList,
      final CheckInResponseModel? checkInResponseModel,
      final CheckoutResponseModel? checkoutResponseModel,
      final LastCheckinOutResponseModel? lastCheckinOutResponseModel,
      final ApiFailedModel? apiFailedModel,
      final List<PurposeModel> purposeList,
      final List<PurposeModel> selectedPurposeList,
      final PurposeModel? selectedPurpose,
      final bool isCheckIn,
      final bool isCheckOut,
      final bool loaded,
      final bool isLoading,
      final bool isFailed,
      final List<FileModel> filesList,
      final List<ImageModel> imageLists}) = _$CheckinStateImpl;

  @override
  List<JoinEmployeModel> get employeList;
  @override
  List<JoinEmployeModel> get selectedEmployeList;
  @override
  CheckInResponseModel? get checkInResponseModel;
  @override
  CheckoutResponseModel? get checkoutResponseModel;
  @override
  LastCheckinOutResponseModel? get lastCheckinOutResponseModel;
  @override
  ApiFailedModel? get apiFailedModel;
  @override
  List<PurposeModel> get purposeList;
  @override
  List<PurposeModel> get selectedPurposeList;
  @override
  PurposeModel? get selectedPurpose;
  @override
  bool get isCheckIn;
  @override
  bool get isCheckOut;
  @override
  bool get loaded;
  @override
  bool get isLoading;
  @override
  bool get isFailed;
  @override
  List<FileModel> get filesList;
  @override
  List<ImageModel> get imageLists;
  @override
  @JsonKey(ignore: true)
  _$$CheckinStateImplCopyWith<_$CheckinStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
