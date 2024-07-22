// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i6;
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;
import 'package:package_info_plus/package_info_plus.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i9;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Address%20Repo/address_remote_datasource.dart'
    as _i30;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Divisions/divisions_remote_datasource.dart'
    as _i27;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Employe/employe_remote_datasource.dart'
    as _i50;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Primary%20Source/primary_source_remote_datasource.dart'
    as _i40;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Purpose/purpose_remote_datasource.dart'
    as _i29;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Zone/zone_remote_datasource.dart'
    as _i39;
import 'package:srinivasa_crm_new/shared/data/repo/address_repo_impl.dart'
    as _i56;
import 'package:srinivasa_crm_new/shared/data/repo/divisions_repo_impl.dart'
    as _i48;
import 'package:srinivasa_crm_new/shared/data/repo/employe_repo_impl.dart'
    as _i70;
import 'package:srinivasa_crm_new/shared/data/repo/primary_source_repo_impl.dart'
    as _i68;
import 'package:srinivasa_crm_new/shared/data/repo/purpose_repo_impl.dart'
    as _i45;
import 'package:srinivasa_crm_new/shared/data/repo/zone_repo_impl.dart' as _i58;
import 'package:srinivasa_crm_new/shared/domain/repo/Address/address_repo.dart'
    as _i55;
import 'package:srinivasa_crm_new/shared/domain/repo/Divisions/divison_repo.dart'
    as _i47;
import 'package:srinivasa_crm_new/shared/domain/repo/Employe/employe_repo.dart'
    as _i69;
import 'package:srinivasa_crm_new/shared/domain/repo/Primary%20Source/primary_source_repo.dart'
    as _i67;
import 'package:srinivasa_crm_new/shared/domain/repo/Purpose/purpose_repo.dart'
    as _i44;
import 'package:srinivasa_crm_new/shared/domain/repo/Zone/zone_repo.dart'
    as _i57;
import 'package:srinivasa_crm_new/src/common/common.dart' as _i17;
import 'package:srinivasa_crm_new/src/common/services/common_excel_services.dart'
    as _i16;
import 'package:srinivasa_crm_new/src/common/services/common_file_storage_services.dart'
    as _i11;
import 'package:srinivasa_crm_new/src/common/services/common_image_services.dart'
    as _i15;
import 'package:srinivasa_crm_new/src/common/services/common_location_services.dart'
    as _i12;
import 'package:srinivasa_crm_new/src/common/services/common_permission_services.dart'
    as _i13;
import 'package:srinivasa_crm_new/src/common/services/common_shareplus_services.dart'
    as _i10;
import 'package:srinivasa_crm_new/src/config/locator/service_locator.dart'
    as _i81;
import 'package:srinivasa_crm_new/src/core/connection/internet_checker.dart'
    as _i14;
import 'package:srinivasa_crm_new/src/core/core.dart' as _i22;
import 'package:srinivasa_crm_new/src/core/network/dio_client.dart' as _i20;
import 'package:srinivasa_crm_new/src/core/storage/key_value_storage.dart'
    as _i18;
import 'package:srinivasa_crm_new/src/features/Alerts%20/data/datasource/alert_remote_datasource.dart'
    as _i26;
import 'package:srinivasa_crm_new/src/features/Alerts%20/data/repo/alert_repo_impl.dart'
    as _i33;
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/repo/alert_repo.dart'
    as _i32;
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart'
    as _i61;
import 'package:srinivasa_crm_new/src/features/Customer/data/datasource/remote/customer_remote_datasources.dart'
    as _i28;
import 'package:srinivasa_crm_new/src/features/Customer/data/repo/customer_repo_impl.dart'
    as _i42;
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart'
    as _i41;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_cubit.dart'
    as _i51;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_cubit.dart'
    as _i74;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart'
    as _i75;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Full%20Details/cubit/customer_full_details_cubit.dart'
    as _i52;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Search/presentation/cubit/search_customer_cubit.dart'
    as _i43;
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/dashboard_cubit.dart'
    as _i3;
import 'package:srinivasa_crm_new/src/features/Kyc/data/datasource/remote/kyc_remote_datasource.dart'
    as _i31;
import 'package:srinivasa_crm_new/src/features/Kyc/data/repo/kyc_repo_impl.dart'
    as _i35;
import 'package:srinivasa_crm_new/src/features/Kyc/domain/repo/kyc_repo.dart'
    as _i34;
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/cubit/kyc_cubit.dart'
    as _i46;
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/cubit/kyc_upload_cubit.dart'
    as _i19;
import 'package:srinivasa_crm_new/src/features/login/data/data%20source/remote/login_remote_datasource.dart'
    as _i21;
import 'package:srinivasa_crm_new/src/features/login/data/repository/login_repo_impl.dart'
    as _i24;
import 'package:srinivasa_crm_new/src/features/login/domain/repository/login_repo.dart'
    as _i23;
import 'package:srinivasa_crm_new/src/features/login/domain/usecases/login_usecase.dart'
    as _i53;
import 'package:srinivasa_crm_new/src/features/login/presentation/cubit/login_cubit.dart'
    as _i76;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/data/datasource/remote/mark_attendance_remote_datasource.dart'
    as _i54;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/data/repo/mark_attendance_repo_impl.dart'
    as _i66;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/domain.dart'
    as _i80;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/repo/mark_attendance_repo.dart'
    as _i65;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/usecase/last_punch_in_usecase.dart'
    as _i73;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/usecase/punch_in_usecase.dart'
    as _i71;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/usecase/punch_out_usecase.dart'
    as _i72;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart'
    as _i79;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/data/datasource/monthly_plan_remote_datasource.dart'
    as _i38;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/data/repo/monthly_plan_repo_impl.dart'
    as _i60;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/repo/monthly_plan_repo.dart'
    as _i59;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_cubit.dart'
    as _i78;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/cubit/monthly_plan_pending_cubit.dart'
    as _i63;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/monthly_plan_search_cubit.dart'
    as _i64;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/update_monthly_plan_cubit.dart'
    as _i77;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart'
    as _i62;
import 'package:srinivasa_crm_new/src/features/Profile/data/datasource/local/profile_local_datasource.dart'
    as _i25;
import 'package:srinivasa_crm_new/src/features/Profile/data/repo/profile_repo_impl.dart'
    as _i37;
import 'package:srinivasa_crm_new/src/features/Profile/domain/repo/profile_repo.dart'
    as _i36;
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart'
    as _i49;

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
    gh.factory<_i3.DashboardCubit>(() => _i3.DashboardCubit());
    gh.singleton<_i4.Dio>(() => thirdPartyDependencies.dio);
    gh.singleton<_i5.Logger>(() => thirdPartyDependencies.logger);
    gh.singleton<_i6.Connectivity>(() => thirdPartyDependencies.connectivity);
    gh.singleton<_i7.FlutterSecureStorage>(
        () => thirdPartyDependencies.secureStorage);
    await gh.singletonAsync<_i8.PackageInfo>(
      () => thirdPartyDependencies.packageInfo,
      preResolve: true,
    );
    await gh.singletonAsync<_i9.SharedPreferences>(
      () => thirdPartyDependencies.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i10.CommonSharePlusServices>(
        () => _i10.CommonSharePlusServices());
    gh.lazySingleton<_i11.CommonFileStorageServcies>(
        () => _i11.CommonFileStorageServcies());
    gh.lazySingleton<_i12.CommonLocationServices>(
        () => _i12.CommonLocationServices());
    gh.lazySingleton<_i13.CommonPermissionService>(
        () => _i13.CommonPermissionService());
    gh.factory<_i14.InternetChecker>(
        () => _i14.InternetChecker(gh<_i6.Connectivity>()));
    gh.factory<_i15.CommonImageServices>(() => _i15.CommomImageServicesImpl());
    gh.lazySingleton<_i16.ExcelServices>(() => _i16.ExcelServices(
          sharePlusServices: gh<_i17.CommonSharePlusServices>(),
          fileStorageServcies: gh<_i17.CommonFileStorageServcies>(),
        ));
    gh.factory<_i18.KeyValueStorage>(() => _i18.KeyValueStorage(
          gh<_i7.FlutterSecureStorage>(),
          gh<_i9.SharedPreferences>(),
        ));
    gh.factory<_i19.KycUploadCubit>(() =>
        _i19.KycUploadCubit(imageServices: gh<_i17.CommonImageServices>()));
    gh.factory<_i20.DioClient>(() => _i20.DioClient(
          gh<_i4.Dio>(),
          gh<_i18.KeyValueStorage>(),
        ));
    gh.factory<_i21.LoginRemoteDataSource>(() => _i21.LoginRemoteDataSourceImpl(
          dioClient: gh<_i22.DioClient>(),
          keyValueStorage: gh<_i22.KeyValueStorage>(),
        ));
    gh.factory<_i23.LoginRepository>(() => _i24.LoginRepoImpl(
        loginRemoteDataSource: gh<_i21.LoginRemoteDataSource>()));
    gh.factory<_i25.ProfileLocalRepo>(() => _i25.ProfileRepoImpl(
          dioClient: gh<_i22.DioClient>(),
          keyValueStorage: gh<_i22.KeyValueStorage>(),
          logger: gh<_i5.Logger>(),
        ));
    gh.factory<_i26.AlertRemoteDataSource>(() => _i26.AlertRemoteDataSourceImpl(
          dioClient: gh<_i22.DioClient>(),
          keyValueStorage: gh<_i22.KeyValueStorage>(),
          internetChecker: gh<_i22.InternetChecker>(),
        ));
    gh.factory<_i27.DivisonsRemoteDataSource>(
        () => _i27.DivisionsRemoteDatasourceImpl(
              dioClient: gh<_i22.DioClient>(),
              keyValueStorage: gh<_i22.KeyValueStorage>(),
              internetChecker: gh<_i22.InternetChecker>(),
            ));
    gh.factory<_i28.CustomerRemoteDataSource>(
        () => _i28.CustomerRemoteDatasourcesImpl(
              gh<_i22.DioClient>(),
              gh<_i22.KeyValueStorage>(),
              gh<_i5.Logger>(),
              gh<_i22.InternetChecker>(),
            ));
    gh.factory<_i29.PurposeRemoteDatasource>(
        () => _i29.PurposeRemoteDatasourceImpl(
              dioClient: gh<_i22.DioClient>(),
              keyValueStorage: gh<_i22.KeyValueStorage>(),
              internetChecker: gh<_i22.InternetChecker>(),
            ));
    gh.factory<_i30.AddressRemoteDataSource>(
        () => _i30.AddressRemoteDatasourceImpl(
              internetConnectionChecker: gh<_i22.InternetChecker>(),
              dioClient: gh<_i22.DioClient>(),
              logger: gh<_i5.Logger>(),
            ));
    gh.factory<_i31.KycRemoteDataSource>(() => _i31.KycRemoteDatasourceImpl(
          dioClient: gh<_i22.DioClient>(),
          internetChecker: gh<_i22.InternetChecker>(),
          logger: gh<_i5.Logger>(),
          keyValueStorage: gh<_i22.KeyValueStorage>(),
        ));
    gh.factory<_i32.AlertRepo>(() => _i33.AlertRepoImpl(
        alertRemoteDataSource: gh<_i26.AlertRemoteDataSource>()));
    gh.factory<_i34.KycRepo>(() =>
        _i35.KycRepoImpl(kycRemoteDataSource: gh<_i31.KycRemoteDataSource>()));
    gh.factory<_i36.ProfileRepo>(() =>
        _i37.ProfileRepoImpl(profileLocalRepo: gh<_i25.ProfileLocalRepo>()));
    gh.factory<_i38.MonthlyPlanRemoteDataSource>(
        () => _i38.MonthlyPlanRemoteDataSourceImpl(
              dioClient: gh<_i22.DioClient>(),
              keyValueStorage: gh<_i22.KeyValueStorage>(),
              logger: gh<_i5.Logger>(),
            ));
    gh.factory<_i39.ZoneRemoteDataSource>(() => _i39.ZoneRemoteDatasourceImpl(
          dioClient: gh<_i22.DioClient>(),
          internetChecker: gh<_i22.InternetChecker>(),
          keyValueStorage: gh<_i22.KeyValueStorage>(),
        ));
    gh.factory<_i40.PrimarySourceRemoteDataSource>(
        () => _i40.PrimarySourceRemoteDataSourceImpl(
              internetChecker: gh<_i22.InternetChecker>(),
              dioClient: gh<_i22.DioClient>(),
              logger: gh<_i5.Logger>(),
            ));
    gh.factory<_i41.CustomerRepo>(() => _i42.CustomerRepoImpl(
        customerRemoteDataSource: gh<_i28.CustomerRemoteDataSource>()));
    gh.factory<_i43.SearchCustomerCubit>(
        () => _i43.SearchCustomerCubit(gh<_i41.CustomerRepo>()));
    gh.factory<_i44.PurposeRepo>(() => _i45.PurposeRepoImpl(
        purposeRemoteDatasource: gh<_i29.PurposeRemoteDatasource>()));
    gh.factory<_i46.KycCubit>(() => _i46.KycCubit(gh<_i34.KycRepo>()));
    gh.factory<_i47.DivisionRepo>(() =>
        _i48.DivisionRepoimpl(dataSource: gh<_i27.DivisonsRemoteDataSource>()));
    gh.factory<_i49.ProfileCubit>(
        () => _i49.ProfileCubit(profileRepo: gh<_i36.ProfileRepo>()));
    gh.factory<_i50.EmployeDataSource>(() => _i50.EmployeRemoteDatasourceImpl(
          dioClient: gh<_i22.DioClient>(),
          keyValueStorage: gh<_i22.KeyValueStorage>(),
          internetChecker: gh<_i22.InternetChecker>(),
          logger: gh<_i5.Logger>(),
        ));
    gh.factory<_i51.AllCustomerCubit>(
        () => _i51.AllCustomerCubit(customerRepo: gh<_i41.CustomerRepo>()));
    gh.factory<_i52.CustomerFullDetailsCubit>(() =>
        _i52.CustomerFullDetailsCubit(customerRepo: gh<_i41.CustomerRepo>()));
    gh.factory<_i53.LoginUseCase>(
        () => _i53.LoginUseCase(loginRepository: gh<_i23.LoginRepository>()));
    gh.factory<_i54.MarkAttendanceRemoteDataSource>(
        () => _i54.MarkAttendanceRemoteDatasourceImpl(
              dioClient: gh<_i22.DioClient>(),
              logger: gh<_i5.Logger>(),
              keyValueStorage: gh<_i22.KeyValueStorage>(),
            ));
    gh.factory<_i55.AddressRepo>(() => _i56.AddressRepoImpl(
        addressRemoteDataSource: gh<_i30.AddressRemoteDataSource>()));
    gh.factory<_i57.ZoneRepo>(() => _i58.ZoneRepoImpl(
        zoneRemoteDataSource: gh<_i39.ZoneRemoteDataSource>()));
    gh.factory<_i59.MonthlyPlanRepo>(() => _i60.MonthlyPlanRepoImpl(
        remoteDataSource: gh<_i38.MonthlyPlanRemoteDataSource>()));
    gh.factory<_i61.AlertCubit>(() => _i61.AlertCubit(gh<_i32.AlertRepo>()));
    gh.factory<_i62.ViewMonthlyPlanCubit>(
        () => _i62.ViewMonthlyPlanCubit(gh<_i59.MonthlyPlanRepo>()));
    gh.factory<_i63.MonthlyPlanPendingCubit>(
        () => _i63.MonthlyPlanPendingCubit(gh<_i59.MonthlyPlanRepo>()));
    gh.factory<_i64.MonthlyPlanSearchCubit>(
        () => _i64.MonthlyPlanSearchCubit(gh<_i59.MonthlyPlanRepo>()));
    gh.factory<_i65.MarkAttendanceRepo>(() => _i66.MarkAttendanceRepoImpl(
        markAttendanceRemoteDataSource:
            gh<_i54.MarkAttendanceRemoteDataSource>()));
    gh.factory<_i67.PrimarySourceRepo>(() => _i68.PrimarySourceRepoImpl(
        primarySourceRemoteDataSource:
            gh<_i40.PrimarySourceRemoteDataSource>()));
    gh.factory<_i69.EmployeRepo>(() =>
        _i70.EmployeRepoImpl(employeDataSource: gh<_i50.EmployeDataSource>()));
    gh.factory<_i71.PunchInUseCase>(() =>
        _i71.PunchInUseCase(markAttendanceRepo: gh<_i65.MarkAttendanceRepo>()));
    gh.factory<_i72.PunchOutUsecase>(() => _i72.PunchOutUsecase(
        markAttendanceRepo: gh<_i65.MarkAttendanceRepo>()));
    gh.factory<_i73.LastPunchInOutUseCase>(() => _i73.LastPunchInOutUseCase(
        markAttendanceRepo: gh<_i65.MarkAttendanceRepo>()));
    gh.factory<_i74.CheckinCubit>(() => _i74.CheckinCubit(
          customerRepo: gh<_i41.CustomerRepo>(),
          employeRepo: gh<_i69.EmployeRepo>(),
          purposeRepo: gh<_i44.PurposeRepo>(),
          commonImageServices: gh<_i17.CommonImageServices>(),
        ));
    gh.factory<_i75.CustomerCreateCubit>(() => _i75.CustomerCreateCubit(
          primarySourceRepo: gh<_i67.PrimarySourceRepo>(),
          addressRepo: gh<_i55.AddressRepo>(),
          zoneRepo: gh<_i57.ZoneRepo>(),
          customerRepo: gh<_i41.CustomerRepo>(),
          divisionRepo: gh<_i47.DivisionRepo>(),
        ));
    gh.factory<_i76.LoginCubit>(() => _i76.LoginCubit(
          gh<_i53.LoginUseCase>(),
          gh<_i22.KeyValueStorage>(),
        ));
    gh.factory<_i77.UpdateMonthlyPlanCubit>(() => _i77.UpdateMonthlyPlanCubit(
        monthlyPlanRepo: gh<_i59.MonthlyPlanRepo>()));
    gh.factory<_i78.CreateMonthlyPlanCubit>(() => _i78.CreateMonthlyPlanCubit(
          monthlyPlanRepo: gh<_i59.MonthlyPlanRepo>(),
          employeRepo: gh<_i69.EmployeRepo>(),
        ));
    gh.factory<_i79.MarkAttendanceCubit>(() => _i79.MarkAttendanceCubit(
          gh<_i80.PunchInUseCase>(),
          gh<_i80.PunchOutUsecase>(),
          gh<_i80.LastPunchInOutUseCase>(),
        ));
    return this;
  }
}

class _$ThirdPartyDependencies extends _i81.ThirdPartyDependencies {}
