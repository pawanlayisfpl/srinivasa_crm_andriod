// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:package_info_plus/package_info_plus.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i8;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Address%20Repo/address_remote_datasource.dart'
    as _i27;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Employe/employe_remote_datasource.dart'
    as _i41;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Primary%20Source/primary_source_remote_datasource.dart'
    as _i34;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Purpose/purpose_remote_datasource.dart'
    as _i26;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Zone/zone_remote_datasource.dart'
    as _i33;
import 'package:srinivasa_crm_new/shared/data/repo/address_repo_impl.dart'
    as _i47;
import 'package:srinivasa_crm_new/shared/data/repo/employe_repo_impl.dart'
    as _i61;
import 'package:srinivasa_crm_new/shared/data/repo/primary_source_repo_impl.dart'
    as _i59;
import 'package:srinivasa_crm_new/shared/data/repo/purpose_repo_impl.dart'
    as _i39;
import 'package:srinivasa_crm_new/shared/data/repo/zone_repo_impl.dart' as _i49;
import 'package:srinivasa_crm_new/shared/domain/repo/Address/address_repo.dart'
    as _i46;
import 'package:srinivasa_crm_new/shared/domain/repo/Employe/employe_repo.dart'
    as _i60;
import 'package:srinivasa_crm_new/shared/domain/repo/Primary%20Source/primary_source_repo.dart'
    as _i58;
import 'package:srinivasa_crm_new/shared/domain/repo/Purpose/purpose_repo.dart'
    as _i38;
import 'package:srinivasa_crm_new/shared/domain/repo/Zone/zone_repo.dart'
    as _i48;
import 'package:srinivasa_crm_new/src/common/common.dart' as _i16;
import 'package:srinivasa_crm_new/src/common/services/common_excel_services.dart'
    as _i15;
import 'package:srinivasa_crm_new/src/common/services/common_file_storage_services.dart'
    as _i10;
import 'package:srinivasa_crm_new/src/common/services/common_image_services.dart'
    as _i14;
import 'package:srinivasa_crm_new/src/common/services/common_location_services.dart'
    as _i11;
import 'package:srinivasa_crm_new/src/common/services/common_permission_services.dart'
    as _i12;
import 'package:srinivasa_crm_new/src/common/services/common_shareplus_services.dart'
    as _i9;
import 'package:srinivasa_crm_new/src/config/locator/service_locator.dart'
    as _i72;
import 'package:srinivasa_crm_new/src/core/connection/internet_checker.dart'
    as _i13;
import 'package:srinivasa_crm_new/src/core/core.dart' as _i20;
import 'package:srinivasa_crm_new/src/core/network/dio_client.dart' as _i18;
import 'package:srinivasa_crm_new/src/core/storage/key_value_storage.dart'
    as _i17;
import 'package:srinivasa_crm_new/src/features/Alerts%20/data/datasource/alert_remote_datasource.dart'
    as _i24;
import 'package:srinivasa_crm_new/src/features/Alerts%20/data/repo/alert_repo_impl.dart'
    as _i29;
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/repo/alert_repo.dart'
    as _i28;
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart'
    as _i52;
import 'package:srinivasa_crm_new/src/features/Customer/data/datasource/remote/customer_remote_datasources.dart'
    as _i25;
import 'package:srinivasa_crm_new/src/features/Customer/data/repo/customer_repo_impl.dart'
    as _i36;
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart'
    as _i35;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_cubit.dart'
    as _i42;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_cubit.dart'
    as _i65;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart'
    as _i66;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Full%20Details/cubit/customer_full_details_cubit.dart'
    as _i43;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Search/presentation/cubit/search_customer_cubit.dart'
    as _i37;
import 'package:srinivasa_crm_new/src/features/login/data/data%20source/remote/login_remote_datasource.dart'
    as _i19;
import 'package:srinivasa_crm_new/src/features/login/data/repository/login_repo_impl.dart'
    as _i22;
import 'package:srinivasa_crm_new/src/features/login/domain/repository/login_repo.dart'
    as _i21;
import 'package:srinivasa_crm_new/src/features/login/domain/usecases/login_usecase.dart'
    as _i44;
import 'package:srinivasa_crm_new/src/features/login/presentation/cubit/login_cubit.dart'
    as _i67;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/data/datasource/remote/mark_attendance_remote_datasource.dart'
    as _i45;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/data/repo/mark_attendance_repo_impl.dart'
    as _i57;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/domain.dart'
    as _i71;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/repo/mark_attendance_repo.dart'
    as _i56;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/usecase/last_punch_in_usecase.dart'
    as _i64;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/usecase/punch_in_usecase.dart'
    as _i62;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/usecase/punch_out_usecase.dart'
    as _i63;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart'
    as _i70;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/data/datasource/monthly_plan_remote_datasource.dart'
    as _i32;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/data/repo/monthly_plan_repo_impl.dart'
    as _i51;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/repo/monthly_plan_repo.dart'
    as _i50;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_cubit.dart'
    as _i69;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/cubit/monthly_plan_pending_cubit.dart'
    as _i54;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/monthly_plan_search_cubit.dart'
    as _i55;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/update_monthly_plan_cubit.dart'
    as _i68;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart'
    as _i53;
import 'package:srinivasa_crm_new/src/features/Profile/data/datasource/local/profile_local_datasource.dart'
    as _i23;
import 'package:srinivasa_crm_new/src/features/Profile/data/repo/profile_repo_impl.dart'
    as _i31;
import 'package:srinivasa_crm_new/src/features/Profile/domain/repo/profile_repo.dart'
    as _i30;
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart'
    as _i40;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyDependencies = _$ThirdPartyDependencies();
    gh.factory<DateTime>(() => thirdPartyDependencies.defaultDateTime);
    gh.singleton<_i3.Dio>(() => thirdPartyDependencies.dio);
    gh.singleton<_i4.Logger>(() => thirdPartyDependencies.logger);
    gh.singleton<_i5.Connectivity>(() => thirdPartyDependencies.connectivity);
    gh.singleton<_i6.FlutterSecureStorage>(
        () => thirdPartyDependencies.secureStorage);
    await gh.singletonAsync<_i7.PackageInfo>(
      () => thirdPartyDependencies.packageInfo,
      preResolve: true,
    );
    await gh.singletonAsync<_i8.SharedPreferences>(
      () => thirdPartyDependencies.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i9.CommonSharePlusServices>(
        () => _i9.CommonSharePlusServices());
    gh.lazySingleton<_i10.CommonFileStorageServcies>(
        () => _i10.CommonFileStorageServcies());
    gh.lazySingleton<_i11.CommonLocationServices>(
        () => _i11.CommonLocationServices());
    gh.lazySingleton<_i12.CommonPermissionService>(
        () => _i12.CommonPermissionService());
    gh.factory<_i13.InternetChecker>(
        () => _i13.InternetChecker(gh<_i5.Connectivity>()));
    gh.factory<_i14.CommonImageServices>(() => _i14.CommomImageServicesImpl());
    gh.lazySingleton<_i15.ExcelServices>(() => _i15.ExcelServices(
          sharePlusServices: gh<_i16.CommonSharePlusServices>(),
          fileStorageServcies: gh<_i16.CommonFileStorageServcies>(),
        ));
    gh.factory<_i17.KeyValueStorage>(() => _i17.KeyValueStorage(
          gh<_i6.FlutterSecureStorage>(),
          gh<_i8.SharedPreferences>(),
        ));
    gh.factory<_i18.DioClient>(() => _i18.DioClient(
          gh<_i3.Dio>(),
          gh<_i17.KeyValueStorage>(),
        ));
    gh.factory<_i19.LoginRemoteDataSource>(() => _i19.LoginRemoteDataSourceImpl(
          dioClient: gh<_i20.DioClient>(),
          keyValueStorage: gh<_i20.KeyValueStorage>(),
        ));
    gh.factory<_i21.LoginRepository>(() => _i22.LoginRepoImpl(
        loginRemoteDataSource: gh<_i19.LoginRemoteDataSource>()));
    gh.factory<_i23.ProfileLocalRepo>(() => _i23.ProfileRepoImpl(
          dioClient: gh<_i20.DioClient>(),
          keyValueStorage: gh<_i20.KeyValueStorage>(),
          logger: gh<_i4.Logger>(),
        ));
    gh.factory<_i24.AlertRemoteDataSource>(() => _i24.AlertRemoteDataSourceImpl(
          dioClient: gh<_i20.DioClient>(),
          keyValueStorage: gh<_i20.KeyValueStorage>(),
          internetChecker: gh<_i20.InternetChecker>(),
        ));
    gh.factory<_i25.CustomerRemoteDataSource>(
        () => _i25.CustomerRemoteDatasourcesImpl(
              gh<_i20.DioClient>(),
              gh<_i20.KeyValueStorage>(),
              gh<_i4.Logger>(),
              gh<_i20.InternetChecker>(),
            ));
    gh.factory<_i26.PurposeRemoteDatasource>(
        () => _i26.PurposeRemoteDatasourceImpl(
              dioClient: gh<_i20.DioClient>(),
              keyValueStorage: gh<_i20.KeyValueStorage>(),
              internetChecker: gh<_i20.InternetChecker>(),
            ));
    gh.factory<_i27.AddressRemoteDataSource>(
        () => _i27.AddressRemoteDatasourceImpl(
              internetConnectionChecker: gh<_i20.InternetChecker>(),
              dioClient: gh<_i20.DioClient>(),
              logger: gh<_i4.Logger>(),
            ));
    gh.factory<_i28.AlertRepo>(() => _i29.AlertRepoImpl(
        alertRemoteDataSource: gh<_i24.AlertRemoteDataSource>()));
    gh.factory<_i30.ProfileRepo>(() =>
        _i31.ProfileRepoImpl(profileLocalRepo: gh<_i23.ProfileLocalRepo>()));
    gh.factory<_i32.MonthlyPlanRemoteDataSource>(
        () => _i32.MonthlyPlanRemoteDataSourceImpl(
              dioClient: gh<_i20.DioClient>(),
              keyValueStorage: gh<_i20.KeyValueStorage>(),
              logger: gh<_i4.Logger>(),
            ));
    gh.factory<_i33.ZoneRemoteDataSource>(() => _i33.ZoneRemoteDatasourceImpl(
          dioClient: gh<_i20.DioClient>(),
          internetChecker: gh<_i20.InternetChecker>(),
          keyValueStorage: gh<_i20.KeyValueStorage>(),
        ));
    gh.factory<_i34.PrimarySourceRemoteDataSource>(
        () => _i34.PrimarySourceRemoteDataSourceImpl(
              internetChecker: gh<_i20.InternetChecker>(),
              dioClient: gh<_i20.DioClient>(),
              logger: gh<_i4.Logger>(),
            ));
    gh.factory<_i35.CustomerRepo>(() => _i36.CustomerRepoImpl(
        customerRemoteDataSource: gh<_i25.CustomerRemoteDataSource>()));
    gh.factory<_i37.SearchCustomerCubit>(
        () => _i37.SearchCustomerCubit(gh<_i35.CustomerRepo>()));
    gh.factory<_i38.PurposeRepo>(() => _i39.PurposeRepoImpl(
        purposeRemoteDatasource: gh<_i26.PurposeRemoteDatasource>()));
    gh.factory<_i40.ProfileCubit>(
        () => _i40.ProfileCubit(profileRepo: gh<_i30.ProfileRepo>()));
    gh.factory<_i41.EmployeDataSource>(() => _i41.EmployeRemoteDatasourceImpl(
          dioClient: gh<_i20.DioClient>(),
          keyValueStorage: gh<_i20.KeyValueStorage>(),
          internetChecker: gh<_i20.InternetChecker>(),
          logger: gh<_i4.Logger>(),
        ));
    gh.factory<_i42.AllCustomerCubit>(
        () => _i42.AllCustomerCubit(customerRepo: gh<_i35.CustomerRepo>()));
    gh.factory<_i43.CustomerFullDetailsCubit>(() =>
        _i43.CustomerFullDetailsCubit(customerRepo: gh<_i35.CustomerRepo>()));
    gh.factory<_i44.LoginUseCase>(
        () => _i44.LoginUseCase(loginRepository: gh<_i21.LoginRepository>()));
    gh.factory<_i45.MarkAttendanceRemoteDataSource>(
        () => _i45.MarkAttendanceRemoteDatasourceImpl(
              dioClient: gh<_i20.DioClient>(),
              logger: gh<_i4.Logger>(),
              keyValueStorage: gh<_i20.KeyValueStorage>(),
            ));
    gh.factory<_i46.AddressRepo>(() => _i47.AddressRepoImpl(
        addressRemoteDataSource: gh<_i27.AddressRemoteDataSource>()));
    gh.factory<_i48.ZoneRepo>(() => _i49.ZoneRepoImpl(
        zoneRemoteDataSource: gh<_i33.ZoneRemoteDataSource>()));
    gh.factory<_i50.MonthlyPlanRepo>(() => _i51.MonthlyPlanRepoImpl(
        remoteDataSource: gh<_i32.MonthlyPlanRemoteDataSource>()));
    gh.factory<_i52.AlertCubit>(() => _i52.AlertCubit(gh<_i28.AlertRepo>()));
    gh.factory<_i53.ViewMonthlyPlanCubit>(
        () => _i53.ViewMonthlyPlanCubit(gh<_i50.MonthlyPlanRepo>()));
    gh.factory<_i54.MonthlyPlanPendingCubit>(
        () => _i54.MonthlyPlanPendingCubit(gh<_i50.MonthlyPlanRepo>()));
    gh.factory<_i55.MonthlyPlanSearchCubit>(
        () => _i55.MonthlyPlanSearchCubit(gh<_i50.MonthlyPlanRepo>()));
    gh.factory<_i56.MarkAttendanceRepo>(() => _i57.MarkAttendanceRepoImpl(
        markAttendanceRemoteDataSource:
            gh<_i45.MarkAttendanceRemoteDataSource>()));
    gh.factory<_i58.PrimarySourceRepo>(() => _i59.PrimarySourceRepoImpl(
        primarySourceRemoteDataSource:
            gh<_i34.PrimarySourceRemoteDataSource>()));
    gh.factory<_i60.EmployeRepo>(() =>
        _i61.EmployeRepoImpl(employeDataSource: gh<_i41.EmployeDataSource>()));
    gh.factory<_i62.PunchInUseCase>(() =>
        _i62.PunchInUseCase(markAttendanceRepo: gh<_i56.MarkAttendanceRepo>()));
    gh.factory<_i63.PunchOutUsecase>(() => _i63.PunchOutUsecase(
        markAttendanceRepo: gh<_i56.MarkAttendanceRepo>()));
    gh.factory<_i64.LastPunchInOutUseCase>(() => _i64.LastPunchInOutUseCase(
        markAttendanceRepo: gh<_i56.MarkAttendanceRepo>()));
    gh.factory<_i65.CheckinCubit>(() => _i65.CheckinCubit(
          customerRepo: gh<_i35.CustomerRepo>(),
          employeRepo: gh<_i60.EmployeRepo>(),
          purposeRepo: gh<_i38.PurposeRepo>(),
          commonImageServices: gh<_i16.CommonImageServices>(),
        ));
    gh.factory<_i66.CustomerCreateCubit>(() => _i66.CustomerCreateCubit(
          primarySourceRepo: gh<_i58.PrimarySourceRepo>(),
          addressRepo: gh<_i46.AddressRepo>(),
          zoneRepo: gh<_i48.ZoneRepo>(),
          customerRepo: gh<_i35.CustomerRepo>(),
        ));
    gh.factory<_i67.LoginCubit>(() => _i67.LoginCubit(
          gh<_i44.LoginUseCase>(),
          gh<_i20.KeyValueStorage>(),
        ));
    gh.factory<_i68.UpdateMonthlyPlanCubit>(() => _i68.UpdateMonthlyPlanCubit(
        monthlyPlanRepo: gh<_i50.MonthlyPlanRepo>()));
    gh.factory<_i69.CreateMonthlyPlanCubit>(() => _i69.CreateMonthlyPlanCubit(
          monthlyPlanRepo: gh<_i50.MonthlyPlanRepo>(),
          employeRepo: gh<_i60.EmployeRepo>(),
        ));
    gh.factory<_i70.MarkAttendanceCubit>(() => _i70.MarkAttendanceCubit(
          gh<_i71.PunchInUseCase>(),
          gh<_i71.PunchOutUsecase>(),
          gh<_i71.LastPunchInOutUseCase>(),
        ));
    return this;
  }
}

class _$ThirdPartyDependencies extends _i72.ThirdPartyDependencies {}
