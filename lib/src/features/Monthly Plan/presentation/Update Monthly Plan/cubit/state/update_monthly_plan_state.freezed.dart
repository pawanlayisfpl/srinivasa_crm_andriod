// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_monthly_plan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateMonthlyPlanState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isMonhtlPlanLoaded => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;
  ViewMonthlyPlanModel? get viewMonthlyPlanModel =>
      throw _privateConstructorUsedError;
  List<Customermodel> get customerList => throw _privateConstructorUsedError;
  List<Customermodel> get selectedCustomersList =>
      throw _privateConstructorUsedError;
  List<ViewDailyPlanModel> get createdDailyPlanList =>
      throw _privateConstructorUsedError;
  List<UpdateMonthlyDailyPlanPostModel> get existingMonthlyPlanList =>
      throw _privateConstructorUsedError;
  MonthlyPlanApproxKilomenterField get monthlyPlanKiloMeterTextField =>
      throw _privateConstructorUsedError;
  MonthlyPlanDateField get dateField => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateMonthlyPlanStateCopyWith<UpdateMonthlyPlanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateMonthlyPlanStateCopyWith<$Res> {
  factory $UpdateMonthlyPlanStateCopyWith(UpdateMonthlyPlanState value,
          $Res Function(UpdateMonthlyPlanState) then) =
      _$UpdateMonthlyPlanStateCopyWithImpl<$Res, UpdateMonthlyPlanState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSubmitting,
      bool isSuccess,
      bool isMonhtlPlanLoaded,
      ApiFailedModel? apiFailedModel,
      ViewMonthlyPlanModel? viewMonthlyPlanModel,
      List<Customermodel> customerList,
      List<Customermodel> selectedCustomersList,
      List<ViewDailyPlanModel> createdDailyPlanList,
      List<UpdateMonthlyDailyPlanPostModel> existingMonthlyPlanList,
      MonthlyPlanApproxKilomenterField monthlyPlanKiloMeterTextField,
      MonthlyPlanDateField dateField});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$UpdateMonthlyPlanStateCopyWithImpl<$Res,
        $Val extends UpdateMonthlyPlanState>
    implements $UpdateMonthlyPlanStateCopyWith<$Res> {
  _$UpdateMonthlyPlanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? isSuccess = null,
    Object? isMonhtlPlanLoaded = null,
    Object? apiFailedModel = freezed,
    Object? viewMonthlyPlanModel = freezed,
    Object? customerList = null,
    Object? selectedCustomersList = null,
    Object? createdDailyPlanList = null,
    Object? existingMonthlyPlanList = null,
    Object? monthlyPlanKiloMeterTextField = null,
    Object? dateField = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isMonhtlPlanLoaded: null == isMonhtlPlanLoaded
          ? _value.isMonhtlPlanLoaded
          : isMonhtlPlanLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      viewMonthlyPlanModel: freezed == viewMonthlyPlanModel
          ? _value.viewMonthlyPlanModel
          : viewMonthlyPlanModel // ignore: cast_nullable_to_non_nullable
              as ViewMonthlyPlanModel?,
      customerList: null == customerList
          ? _value.customerList
          : customerList // ignore: cast_nullable_to_non_nullable
              as List<Customermodel>,
      selectedCustomersList: null == selectedCustomersList
          ? _value.selectedCustomersList
          : selectedCustomersList // ignore: cast_nullable_to_non_nullable
              as List<Customermodel>,
      createdDailyPlanList: null == createdDailyPlanList
          ? _value.createdDailyPlanList
          : createdDailyPlanList // ignore: cast_nullable_to_non_nullable
              as List<ViewDailyPlanModel>,
      existingMonthlyPlanList: null == existingMonthlyPlanList
          ? _value.existingMonthlyPlanList
          : existingMonthlyPlanList // ignore: cast_nullable_to_non_nullable
              as List<UpdateMonthlyDailyPlanPostModel>,
      monthlyPlanKiloMeterTextField: null == monthlyPlanKiloMeterTextField
          ? _value.monthlyPlanKiloMeterTextField
          : monthlyPlanKiloMeterTextField // ignore: cast_nullable_to_non_nullable
              as MonthlyPlanApproxKilomenterField,
      dateField: null == dateField
          ? _value.dateField
          : dateField // ignore: cast_nullable_to_non_nullable
              as MonthlyPlanDateField,
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
abstract class _$$UpdateMonthlyPlanStateImplCopyWith<$Res>
    implements $UpdateMonthlyPlanStateCopyWith<$Res> {
  factory _$$UpdateMonthlyPlanStateImplCopyWith(
          _$UpdateMonthlyPlanStateImpl value,
          $Res Function(_$UpdateMonthlyPlanStateImpl) then) =
      __$$UpdateMonthlyPlanStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSubmitting,
      bool isSuccess,
      bool isMonhtlPlanLoaded,
      ApiFailedModel? apiFailedModel,
      ViewMonthlyPlanModel? viewMonthlyPlanModel,
      List<Customermodel> customerList,
      List<Customermodel> selectedCustomersList,
      List<ViewDailyPlanModel> createdDailyPlanList,
      List<UpdateMonthlyDailyPlanPostModel> existingMonthlyPlanList,
      MonthlyPlanApproxKilomenterField monthlyPlanKiloMeterTextField,
      MonthlyPlanDateField dateField});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$UpdateMonthlyPlanStateImplCopyWithImpl<$Res>
    extends _$UpdateMonthlyPlanStateCopyWithImpl<$Res,
        _$UpdateMonthlyPlanStateImpl>
    implements _$$UpdateMonthlyPlanStateImplCopyWith<$Res> {
  __$$UpdateMonthlyPlanStateImplCopyWithImpl(
      _$UpdateMonthlyPlanStateImpl _value,
      $Res Function(_$UpdateMonthlyPlanStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? isSuccess = null,
    Object? isMonhtlPlanLoaded = null,
    Object? apiFailedModel = freezed,
    Object? viewMonthlyPlanModel = freezed,
    Object? customerList = null,
    Object? selectedCustomersList = null,
    Object? createdDailyPlanList = null,
    Object? existingMonthlyPlanList = null,
    Object? monthlyPlanKiloMeterTextField = null,
    Object? dateField = null,
  }) {
    return _then(_$UpdateMonthlyPlanStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isMonhtlPlanLoaded: null == isMonhtlPlanLoaded
          ? _value.isMonhtlPlanLoaded
          : isMonhtlPlanLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      viewMonthlyPlanModel: freezed == viewMonthlyPlanModel
          ? _value.viewMonthlyPlanModel
          : viewMonthlyPlanModel // ignore: cast_nullable_to_non_nullable
              as ViewMonthlyPlanModel?,
      customerList: null == customerList
          ? _value._customerList
          : customerList // ignore: cast_nullable_to_non_nullable
              as List<Customermodel>,
      selectedCustomersList: null == selectedCustomersList
          ? _value._selectedCustomersList
          : selectedCustomersList // ignore: cast_nullable_to_non_nullable
              as List<Customermodel>,
      createdDailyPlanList: null == createdDailyPlanList
          ? _value._createdDailyPlanList
          : createdDailyPlanList // ignore: cast_nullable_to_non_nullable
              as List<ViewDailyPlanModel>,
      existingMonthlyPlanList: null == existingMonthlyPlanList
          ? _value._existingMonthlyPlanList
          : existingMonthlyPlanList // ignore: cast_nullable_to_non_nullable
              as List<UpdateMonthlyDailyPlanPostModel>,
      monthlyPlanKiloMeterTextField: null == monthlyPlanKiloMeterTextField
          ? _value.monthlyPlanKiloMeterTextField
          : monthlyPlanKiloMeterTextField // ignore: cast_nullable_to_non_nullable
              as MonthlyPlanApproxKilomenterField,
      dateField: null == dateField
          ? _value.dateField
          : dateField // ignore: cast_nullable_to_non_nullable
              as MonthlyPlanDateField,
    ));
  }
}

/// @nodoc

class _$UpdateMonthlyPlanStateImpl implements _UpdateMonthlyPlanState {
  const _$UpdateMonthlyPlanStateImpl(
      {this.isLoading = false,
      this.isSubmitting = false,
      this.isSuccess = false,
      this.isMonhtlPlanLoaded = false,
      this.apiFailedModel = null,
      this.viewMonthlyPlanModel = null,
      final List<Customermodel> customerList = const [],
      final List<Customermodel> selectedCustomersList = const [],
      final List<ViewDailyPlanModel> createdDailyPlanList = const [],
      final List<UpdateMonthlyDailyPlanPostModel> existingMonthlyPlanList =
          const [],
      required this.monthlyPlanKiloMeterTextField,
      required this.dateField})
      : _customerList = customerList,
        _selectedCustomersList = selectedCustomersList,
        _createdDailyPlanList = createdDailyPlanList,
        _existingMonthlyPlanList = existingMonthlyPlanList;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool isMonhtlPlanLoaded;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailedModel;
  @override
  @JsonKey()
  final ViewMonthlyPlanModel? viewMonthlyPlanModel;
  final List<Customermodel> _customerList;
  @override
  @JsonKey()
  List<Customermodel> get customerList {
    if (_customerList is EqualUnmodifiableListView) return _customerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerList);
  }

  final List<Customermodel> _selectedCustomersList;
  @override
  @JsonKey()
  List<Customermodel> get selectedCustomersList {
    if (_selectedCustomersList is EqualUnmodifiableListView)
      return _selectedCustomersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCustomersList);
  }

  final List<ViewDailyPlanModel> _createdDailyPlanList;
  @override
  @JsonKey()
  List<ViewDailyPlanModel> get createdDailyPlanList {
    if (_createdDailyPlanList is EqualUnmodifiableListView)
      return _createdDailyPlanList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_createdDailyPlanList);
  }

  final List<UpdateMonthlyDailyPlanPostModel> _existingMonthlyPlanList;
  @override
  @JsonKey()
  List<UpdateMonthlyDailyPlanPostModel> get existingMonthlyPlanList {
    if (_existingMonthlyPlanList is EqualUnmodifiableListView)
      return _existingMonthlyPlanList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_existingMonthlyPlanList);
  }

  @override
  final MonthlyPlanApproxKilomenterField monthlyPlanKiloMeterTextField;
  @override
  final MonthlyPlanDateField dateField;

  @override
  String toString() {
    return 'UpdateMonthlyPlanState(isLoading: $isLoading, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isMonhtlPlanLoaded: $isMonhtlPlanLoaded, apiFailedModel: $apiFailedModel, viewMonthlyPlanModel: $viewMonthlyPlanModel, customerList: $customerList, selectedCustomersList: $selectedCustomersList, createdDailyPlanList: $createdDailyPlanList, existingMonthlyPlanList: $existingMonthlyPlanList, monthlyPlanKiloMeterTextField: $monthlyPlanKiloMeterTextField, dateField: $dateField)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMonthlyPlanStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isMonhtlPlanLoaded, isMonhtlPlanLoaded) ||
                other.isMonhtlPlanLoaded == isMonhtlPlanLoaded) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel) &&
            (identical(other.viewMonthlyPlanModel, viewMonthlyPlanModel) ||
                other.viewMonthlyPlanModel == viewMonthlyPlanModel) &&
            const DeepCollectionEquality()
                .equals(other._customerList, _customerList) &&
            const DeepCollectionEquality()
                .equals(other._selectedCustomersList, _selectedCustomersList) &&
            const DeepCollectionEquality()
                .equals(other._createdDailyPlanList, _createdDailyPlanList) &&
            const DeepCollectionEquality().equals(
                other._existingMonthlyPlanList, _existingMonthlyPlanList) &&
            (identical(other.monthlyPlanKiloMeterTextField,
                    monthlyPlanKiloMeterTextField) ||
                other.monthlyPlanKiloMeterTextField ==
                    monthlyPlanKiloMeterTextField) &&
            (identical(other.dateField, dateField) ||
                other.dateField == dateField));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSubmitting,
      isSuccess,
      isMonhtlPlanLoaded,
      apiFailedModel,
      viewMonthlyPlanModel,
      const DeepCollectionEquality().hash(_customerList),
      const DeepCollectionEquality().hash(_selectedCustomersList),
      const DeepCollectionEquality().hash(_createdDailyPlanList),
      const DeepCollectionEquality().hash(_existingMonthlyPlanList),
      monthlyPlanKiloMeterTextField,
      dateField);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMonthlyPlanStateImplCopyWith<_$UpdateMonthlyPlanStateImpl>
      get copyWith => __$$UpdateMonthlyPlanStateImplCopyWithImpl<
          _$UpdateMonthlyPlanStateImpl>(this, _$identity);
}

abstract class _UpdateMonthlyPlanState implements UpdateMonthlyPlanState {
  const factory _UpdateMonthlyPlanState(
          {final bool isLoading,
          final bool isSubmitting,
          final bool isSuccess,
          final bool isMonhtlPlanLoaded,
          final ApiFailedModel? apiFailedModel,
          final ViewMonthlyPlanModel? viewMonthlyPlanModel,
          final List<Customermodel> customerList,
          final List<Customermodel> selectedCustomersList,
          final List<ViewDailyPlanModel> createdDailyPlanList,
          final List<UpdateMonthlyDailyPlanPostModel> existingMonthlyPlanList,
          required final MonthlyPlanApproxKilomenterField
              monthlyPlanKiloMeterTextField,
          required final MonthlyPlanDateField dateField}) =
      _$UpdateMonthlyPlanStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  bool get isMonhtlPlanLoaded;
  @override
  ApiFailedModel? get apiFailedModel;
  @override
  ViewMonthlyPlanModel? get viewMonthlyPlanModel;
  @override
  List<Customermodel> get customerList;
  @override
  List<Customermodel> get selectedCustomersList;
  @override
  List<ViewDailyPlanModel> get createdDailyPlanList;
  @override
  List<UpdateMonthlyDailyPlanPostModel> get existingMonthlyPlanList;
  @override
  MonthlyPlanApproxKilomenterField get monthlyPlanKiloMeterTextField;
  @override
  MonthlyPlanDateField get dateField;
  @override
  @JsonKey(ignore: true)
  _$$UpdateMonthlyPlanStateImplCopyWith<_$UpdateMonthlyPlanStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
