// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_plan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DailyPlanState {
  List<Customermodel> get customerList => throw _privateConstructorUsedError;
  List<Customermodel> get selectedCustomersList =>
      throw _privateConstructorUsedError;
  MonthlyPlanApproxKilomenterField get monthlyPlanKiloMeterTextField =>
      throw _privateConstructorUsedError;
  MonthlyPlanDateField get dateField => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  bool? get showInputError => throw _privateConstructorUsedError;
  bool? get isLoading => throw _privateConstructorUsedError;
  bool? get isInitialLoading => throw _privateConstructorUsedError;
  List<DailyPlan> get dailyPlanList => throw _privateConstructorUsedError;

  /// Create a copy of DailyPlanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyPlanStateCopyWith<DailyPlanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyPlanStateCopyWith<$Res> {
  factory $DailyPlanStateCopyWith(
          DailyPlanState value, $Res Function(DailyPlanState) then) =
      _$DailyPlanStateCopyWithImpl<$Res, DailyPlanState>;
  @useResult
  $Res call(
      {List<Customermodel> customerList,
      List<Customermodel> selectedCustomersList,
      MonthlyPlanApproxKilomenterField monthlyPlanKiloMeterTextField,
      MonthlyPlanDateField dateField,
      ApiFailedModel? apiFailedModel,
      bool? isSuccess,
      bool? showInputError,
      bool? isLoading,
      bool? isInitialLoading,
      List<DailyPlan> dailyPlanList});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$DailyPlanStateCopyWithImpl<$Res, $Val extends DailyPlanState>
    implements $DailyPlanStateCopyWith<$Res> {
  _$DailyPlanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyPlanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerList = null,
    Object? selectedCustomersList = null,
    Object? monthlyPlanKiloMeterTextField = null,
    Object? dateField = null,
    Object? apiFailedModel = freezed,
    Object? isSuccess = freezed,
    Object? showInputError = freezed,
    Object? isLoading = freezed,
    Object? isInitialLoading = freezed,
    Object? dailyPlanList = null,
  }) {
    return _then(_value.copyWith(
      customerList: null == customerList
          ? _value.customerList
          : customerList // ignore: cast_nullable_to_non_nullable
              as List<Customermodel>,
      selectedCustomersList: null == selectedCustomersList
          ? _value.selectedCustomersList
          : selectedCustomersList // ignore: cast_nullable_to_non_nullable
              as List<Customermodel>,
      monthlyPlanKiloMeterTextField: null == monthlyPlanKiloMeterTextField
          ? _value.monthlyPlanKiloMeterTextField
          : monthlyPlanKiloMeterTextField // ignore: cast_nullable_to_non_nullable
              as MonthlyPlanApproxKilomenterField,
      dateField: null == dateField
          ? _value.dateField
          : dateField // ignore: cast_nullable_to_non_nullable
              as MonthlyPlanDateField,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      showInputError: freezed == showInputError
          ? _value.showInputError
          : showInputError // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInitialLoading: freezed == isInitialLoading
          ? _value.isInitialLoading
          : isInitialLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      dailyPlanList: null == dailyPlanList
          ? _value.dailyPlanList
          : dailyPlanList // ignore: cast_nullable_to_non_nullable
              as List<DailyPlan>,
    ) as $Val);
  }

  /// Create a copy of DailyPlanState
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
abstract class _$$DailyPlanStateImplCopyWith<$Res>
    implements $DailyPlanStateCopyWith<$Res> {
  factory _$$DailyPlanStateImplCopyWith(_$DailyPlanStateImpl value,
          $Res Function(_$DailyPlanStateImpl) then) =
      __$$DailyPlanStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Customermodel> customerList,
      List<Customermodel> selectedCustomersList,
      MonthlyPlanApproxKilomenterField monthlyPlanKiloMeterTextField,
      MonthlyPlanDateField dateField,
      ApiFailedModel? apiFailedModel,
      bool? isSuccess,
      bool? showInputError,
      bool? isLoading,
      bool? isInitialLoading,
      List<DailyPlan> dailyPlanList});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$DailyPlanStateImplCopyWithImpl<$Res>
    extends _$DailyPlanStateCopyWithImpl<$Res, _$DailyPlanStateImpl>
    implements _$$DailyPlanStateImplCopyWith<$Res> {
  __$$DailyPlanStateImplCopyWithImpl(
      _$DailyPlanStateImpl _value, $Res Function(_$DailyPlanStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyPlanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerList = null,
    Object? selectedCustomersList = null,
    Object? monthlyPlanKiloMeterTextField = null,
    Object? dateField = null,
    Object? apiFailedModel = freezed,
    Object? isSuccess = freezed,
    Object? showInputError = freezed,
    Object? isLoading = freezed,
    Object? isInitialLoading = freezed,
    Object? dailyPlanList = null,
  }) {
    return _then(_$DailyPlanStateImpl(
      customerList: null == customerList
          ? _value._customerList
          : customerList // ignore: cast_nullable_to_non_nullable
              as List<Customermodel>,
      selectedCustomersList: null == selectedCustomersList
          ? _value._selectedCustomersList
          : selectedCustomersList // ignore: cast_nullable_to_non_nullable
              as List<Customermodel>,
      monthlyPlanKiloMeterTextField: null == monthlyPlanKiloMeterTextField
          ? _value.monthlyPlanKiloMeterTextField
          : monthlyPlanKiloMeterTextField // ignore: cast_nullable_to_non_nullable
              as MonthlyPlanApproxKilomenterField,
      dateField: null == dateField
          ? _value.dateField
          : dateField // ignore: cast_nullable_to_non_nullable
              as MonthlyPlanDateField,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      showInputError: freezed == showInputError
          ? _value.showInputError
          : showInputError // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInitialLoading: freezed == isInitialLoading
          ? _value.isInitialLoading
          : isInitialLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      dailyPlanList: null == dailyPlanList
          ? _value._dailyPlanList
          : dailyPlanList // ignore: cast_nullable_to_non_nullable
              as List<DailyPlan>,
    ));
  }
}

/// @nodoc

class _$DailyPlanStateImpl
    with DiagnosticableTreeMixin
    implements _DailyPlanState {
  const _$DailyPlanStateImpl(
      {required final List<Customermodel> customerList,
      required final List<Customermodel> selectedCustomersList,
      required this.monthlyPlanKiloMeterTextField,
      required this.dateField,
      required this.apiFailedModel,
      required this.isSuccess,
      required this.showInputError,
      this.isLoading = null,
      this.isInitialLoading = null,
      final List<DailyPlan> dailyPlanList = const []})
      : _customerList = customerList,
        _selectedCustomersList = selectedCustomersList,
        _dailyPlanList = dailyPlanList;

  final List<Customermodel> _customerList;
  @override
  List<Customermodel> get customerList {
    if (_customerList is EqualUnmodifiableListView) return _customerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerList);
  }

  final List<Customermodel> _selectedCustomersList;
  @override
  List<Customermodel> get selectedCustomersList {
    if (_selectedCustomersList is EqualUnmodifiableListView)
      return _selectedCustomersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCustomersList);
  }

  @override
  final MonthlyPlanApproxKilomenterField monthlyPlanKiloMeterTextField;
  @override
  final MonthlyPlanDateField dateField;
  @override
  final ApiFailedModel? apiFailedModel;
  @override
  final bool? isSuccess;
  @override
  final bool? showInputError;
  @override
  @JsonKey()
  final bool? isLoading;
  @override
  @JsonKey()
  final bool? isInitialLoading;
  final List<DailyPlan> _dailyPlanList;
  @override
  @JsonKey()
  List<DailyPlan> get dailyPlanList {
    if (_dailyPlanList is EqualUnmodifiableListView) return _dailyPlanList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyPlanList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DailyPlanState(customerList: $customerList, selectedCustomersList: $selectedCustomersList, monthlyPlanKiloMeterTextField: $monthlyPlanKiloMeterTextField, dateField: $dateField, apiFailedModel: $apiFailedModel, isSuccess: $isSuccess, showInputError: $showInputError, isLoading: $isLoading, isInitialLoading: $isInitialLoading, dailyPlanList: $dailyPlanList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DailyPlanState'))
      ..add(DiagnosticsProperty('customerList', customerList))
      ..add(DiagnosticsProperty('selectedCustomersList', selectedCustomersList))
      ..add(DiagnosticsProperty(
          'monthlyPlanKiloMeterTextField', monthlyPlanKiloMeterTextField))
      ..add(DiagnosticsProperty('dateField', dateField))
      ..add(DiagnosticsProperty('apiFailedModel', apiFailedModel))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('showInputError', showInputError))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isInitialLoading', isInitialLoading))
      ..add(DiagnosticsProperty('dailyPlanList', dailyPlanList));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyPlanStateImpl &&
            const DeepCollectionEquality()
                .equals(other._customerList, _customerList) &&
            const DeepCollectionEquality()
                .equals(other._selectedCustomersList, _selectedCustomersList) &&
            (identical(other.monthlyPlanKiloMeterTextField,
                    monthlyPlanKiloMeterTextField) ||
                other.monthlyPlanKiloMeterTextField ==
                    monthlyPlanKiloMeterTextField) &&
            (identical(other.dateField, dateField) ||
                other.dateField == dateField) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.showInputError, showInputError) ||
                other.showInputError == showInputError) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isInitialLoading, isInitialLoading) ||
                other.isInitialLoading == isInitialLoading) &&
            const DeepCollectionEquality()
                .equals(other._dailyPlanList, _dailyPlanList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_customerList),
      const DeepCollectionEquality().hash(_selectedCustomersList),
      monthlyPlanKiloMeterTextField,
      dateField,
      apiFailedModel,
      isSuccess,
      showInputError,
      isLoading,
      isInitialLoading,
      const DeepCollectionEquality().hash(_dailyPlanList));

  /// Create a copy of DailyPlanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyPlanStateImplCopyWith<_$DailyPlanStateImpl> get copyWith =>
      __$$DailyPlanStateImplCopyWithImpl<_$DailyPlanStateImpl>(
          this, _$identity);
}

abstract class _DailyPlanState implements DailyPlanState {
  const factory _DailyPlanState(
      {required final List<Customermodel> customerList,
      required final List<Customermodel> selectedCustomersList,
      required final MonthlyPlanApproxKilomenterField
          monthlyPlanKiloMeterTextField,
      required final MonthlyPlanDateField dateField,
      required final ApiFailedModel? apiFailedModel,
      required final bool? isSuccess,
      required final bool? showInputError,
      final bool? isLoading,
      final bool? isInitialLoading,
      final List<DailyPlan> dailyPlanList}) = _$DailyPlanStateImpl;

  @override
  List<Customermodel> get customerList;
  @override
  List<Customermodel> get selectedCustomersList;
  @override
  MonthlyPlanApproxKilomenterField get monthlyPlanKiloMeterTextField;
  @override
  MonthlyPlanDateField get dateField;
  @override
  ApiFailedModel? get apiFailedModel;
  @override
  bool? get isSuccess;
  @override
  bool? get showInputError;
  @override
  bool? get isLoading;
  @override
  bool? get isInitialLoading;
  @override
  List<DailyPlan> get dailyPlanList;

  /// Create a copy of DailyPlanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyPlanStateImplCopyWith<_$DailyPlanStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
