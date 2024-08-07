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
    as _i34;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Divisions/divisions_remote_datasource.dart'
    as _i31;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Employe/employe_remote_datasource.dart'
    as _i54;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Primary%20Source/primary_source_remote_datasource.dart'
    as _i44;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Purpose/purpose_remote_datasource.dart'
    as _i33;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Zone/zone_remote_datasource.dart'
    as _i43;
import 'package:srinivasa_crm_new/shared/data/repo/address_repo_impl.dart'
    as _i61;
import 'package:srinivasa_crm_new/shared/data/repo/divisions_repo_impl.dart'
    as _i52;
import 'package:srinivasa_crm_new/shared/data/repo/employe_repo_impl.dart'
    as _i75;
import 'package:srinivasa_crm_new/shared/data/repo/primary_source_repo_impl.dart'
    as _i73;
import 'package:srinivasa_crm_new/shared/data/repo/purpose_repo_impl.dart'
    as _i49;
import 'package:srinivasa_crm_new/shared/data/repo/zone_repo_impl.dart' as _i63;
import 'package:srinivasa_crm_new/shared/domain/repo/Address/address_repo.dart'
    as _i60;
import 'package:srinivasa_crm_new/shared/domain/repo/Divisions/divison_repo.dart'
    as _i51;
import 'package:srinivasa_crm_new/shared/domain/repo/Employe/employe_repo.dart'
    as _i74;
import 'package:srinivasa_crm_new/shared/domain/repo/Primary%20Source/primary_source_repo.dart'
    as _i72;
import 'package:srinivasa_crm_new/shared/domain/repo/Purpose/purpose_repo.dart'
    as _i48;
import 'package:srinivasa_crm_new/shared/domain/repo/Zone/zone_repo.dart'
    as _i62;
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
    as _i86;
import 'package:srinivasa_crm_new/src/core/connection/internet_checker.dart'
    as _i14;
import 'package:srinivasa_crm_new/src/core/core.dart' as _i22;
import 'package:srinivasa_crm_new/src/core/network/dio_client.dart' as _i20;
import 'package:srinivasa_crm_new/src/core/storage/key_value_storage.dart'
    as _i18;
import 'package:srinivasa_crm_new/src/features/Alerts%20/data/datasource/alert_remote_datasource.dart'
    as _i30;
import 'package:srinivasa_crm_new/src/features/Alerts%20/data/repo/alert_repo_impl.dart'
    as _i37;
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/repo/alert_repo.dart'
    as _i36;
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart'
    as _i66;
import 'package:srinivasa_crm_new/src/features/Customer/data/datasource/remote/customer_remote_datasources.dart'
    as _i32;
import 'package:srinivasa_crm_new/src/features/Customer/data/repo/customer_repo_impl.dart'
    as _i46;
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart'
    as _i45;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_cubit.dart'
    as _i56;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_cubit.dart'
    as _i79;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart'
    as _i80;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Full%20Details/cubit/customer_full_details_cubit.dart'
    as _i57;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Search/presentation/cubit/search_customer_cubit.dart'
    as _i47;
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/dashboard_cubit.dart'
    as _i3;
import 'package:srinivasa_crm_new/src/features/Kyc/data/datasource/remote/kyc_remote_datasource.dart'
    as _i35;
import 'package:srinivasa_crm_new/src/features/Kyc/data/repo/kyc_repo_impl.dart'
    as _i39;
import 'package:srinivasa_crm_new/src/features/Kyc/domain/repo/kyc_repo.dart'
    as _i38;
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/cubit/kyc_cubit.dart'
    as _i50;
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/cubit/kyc_upload_cubit.dart'
    as _i19;
import 'package:srinivasa_crm_new/src/features/login/data/data%20source/remote/login_remote_datasource.dart'
    as _i21;
import 'package:srinivasa_crm_new/src/features/login/data/repository/login_repo_impl.dart'
    as _i25;
import 'package:srinivasa_crm_new/src/features/login/domain/repository/login_repo.dart'
    as _i24;
import 'package:srinivasa_crm_new/src/features/login/domain/usecases/login_usecase.dart'
    as _i58;
import 'package:srinivasa_crm_new/src/features/login/presentation/cubit/login_cubit.dart'
    as _i81;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/data/datasource/remote/mark_attendance_remote_datasource.dart'
    as _i59;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/data/repo/mark_attendance_repo_impl.dart'
    as _i71;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/domain.dart'
    as _i85;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/repo/mark_attendance_repo.dart'
    as _i70;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/usecase/last_punch_in_usecase.dart'
    as _i78;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/usecase/punch_in_usecase.dart'
    as _i76;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/usecase/punch_out_usecase.dart'
    as _i77;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart'
    as _i84;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/data/datasource/monthly_plan_remote_datasource.dart'
    as _i42;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/data/repo/monthly_plan_repo_impl.dart'
    as _i65;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/repo/monthly_plan_repo.dart'
    as _i64;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_cubit.dart'
    as _i83;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/cubit/monthly_plan_pending_cubit.dart'
    as _i68;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/monthly_plan_search_cubit.dart'
    as _i69;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/update_monthly_plan_cubit.dart'
    as _i82;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart'
    as _i67;
import 'package:srinivasa_crm_new/src/features/Profile/data/datasource/local/profile_local_datasource.dart'
    as _i29;
import 'package:srinivasa_crm_new/src/features/Profile/data/repo/profile_repo_impl.dart'
    as _i41;
import 'package:srinivasa_crm_new/src/features/Profile/domain/repo/profile_repo.dart'
    as _i40;
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart'
    as _i53;
import 'package:srinivasa_crm_new/src/features/Sales%20Order/data/repo/sales_repo.dart'
    as _i23;
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart'
    as _i55;
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Order%20Pending/cubit/pending_order_cubit.dart'
    as _i28;
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Particular/cubit/sales_order_particular_cubit.dart'
    as _i27;
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/cubit/sales_order_view_cubit.dart'
    as _i26;

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
    gh.factory<_i23.SalesRepo>(() => _i23.SaleRepoImpl(
          dioClient: gh<_i22.DioClient>(),
          keyValueStorage: gh<_i22.KeyValueStorage>(),
          internetChecker: gh<_i22.InternetChecker>(),
          logger: gh<_i5.Logger>(),
        ));
    gh.factory<_i24.LoginRepository>(() => _i25.LoginRepoImpl(
        loginRemoteDataSource: gh<_i21.LoginRemoteDataSource>()));
    gh.factory<_i26.SalesOrderViewCubit>(
        () => _i26.SalesOrderViewCubit(gh<_i23.SalesRepo>()));
    gh.factory<_i27.SalesOrderParticularCubit>(
        () => _i27.SalesOrderParticularCubit(gh<_i23.SalesRepo>()));
    gh.factory<_i28.PendingOrderCubit>(
        () => _i28.PendingOrderCubit(saleRepo: gh<_i23.SalesRepo>()));
    gh.factory<_i29.ProfileLocalRepo>(() => _i29.ProfileRepoImpl(
          dioClient: gh<_i22.DioClient>(),
          keyValueStorage: gh<_i22.KeyValueStorage>(),
          logger: gh<_i5.Logger>(),
        ));
    gh.factory<_i30.AlertRemoteDataSource>(() => _i30.AlertRemoteDataSourceImpl(
          dioClient: gh<_i22.DioClient>(),
          keyValueStorage: gh<_i22.KeyValueStorage>(),
          internetChecker: gh<_i22.InternetChecker>(),
        ));
    gh.factory<_i31.DivisonsRemoteDataSource>(
        () => _i31.DivisionsRemoteDatasourceImpl(
              dioClient: gh<_i22.DioClient>(),
              keyValueStorage: gh<_i22.KeyValueStorage>(),
              internetChecker: gh<_i22.InternetChecker>(),
            ));
    gh.factory<_i32.CustomerRemoteDataSource>(
        () => _i32.CustomerRemoteDatasourcesImpl(
              gh<_i22.DioClient>(),
              gh<_i22.KeyValueStorage>(),
              gh<_i5.Logger>(),
              gh<_i22.InternetChecker>(),
            ));
    gh.factory<_i33.PurposeRemoteDatasource>(
        () => _i33.PurposeRemoteDatasourceImpl(
              dioClient: gh<_i22.DioClient>(),
              keyValueStorage: gh<_i22.KeyValueStorage>(),
              internetChecker: gh<_i22.InternetChecker>(),
            ));
    gh.factory<_i34.AddressRemoteDataSource>(
        () => _i34.AddressRemoteDatasourceImpl(
              internetConnectionChecker: gh<_i22.InternetChecker>(),
              dioClient: gh<_i22.DioClient>(),
              logger: gh<_i5.Logger>(),
            ));
    gh.factory<_i35.KycRemoteDataSource>(() => _i35.KycRemoteDatasourceImpl(
          dioClient: gh<_i22.DioClient>(),
          internetChecker: gh<_i22.InternetChecker>(),
          logger: gh<_i5.Logger>(),
          keyValueStorage: gh<_i22.KeyValueStorage>(),
        ));
    gh.factory<_i36.AlertRepo>(() => _i37.AlertRepoImpl(
        alertRemoteDataSource: gh<_i30.AlertRemoteDataSource>()));
    gh.factory<_i38.KycRepo>(() =>
        _i39.KycRepoImpl(kycRemoteDataSource: gh<_i35.KycRemoteDataSource>()));
    gh.factory<_i40.ProfileRepo>(() =>
        _i41.ProfileRepoImpl(profileLocalRepo: gh<_i29.ProfileLocalRepo>()));
    gh.factory<_i42.MonthlyPlanRemoteDataSource>(
        () => _i42.MonthlyPlanRemoteDataSourceImpl(
              dioClient: gh<_i22.DioClient>(),
              keyValueStorage: gh<_i22.KeyValueStorage>(),
              logger: gh<_i5.Logger>(),
            ));
    gh.factory<_i43.ZoneRemoteDataSource>(() => _i43.ZoneRemoteDatasourceImpl(
          dioClient: gh<_i22.DioClient>(),
          internetChecker: gh<_i22.InternetChecker>(),
          keyValueStorage: gh<_i22.KeyValueStorage>(),
        ));
    gh.factory<_i44.PrimarySourceRemoteDataSource>(
        () => _i44.PrimarySourceRemoteDataSourceImpl(
              internetChecker: gh<_i22.InternetChecker>(),
              dioClient: gh<_i22.DioClient>(),
              logger: gh<_i5.Logger>(),
            ));
    gh.factory<_i45.CustomerRepo>(() => _i46.CustomerRepoImpl(
        customerRemoteDataSource: gh<_i32.CustomerRemoteDataSource>()));
    gh.factory<_i47.SearchCustomerCubit>(
        () => _i47.SearchCustomerCubit(gh<_i45.CustomerRepo>()));
    gh.factory<_i48.PurposeRepo>(() => _i49.PurposeRepoImpl(
        purposeRemoteDatasource: gh<_i33.PurposeRemoteDatasource>()));
    gh.factory<_i50.KycCubit>(() => _i50.KycCubit(gh<_i38.KycRepo>()));
    gh.factory<_i51.DivisionRepo>(() =>
        _i52.DivisionRepoimpl(dataSource: gh<_i31.DivisonsRemoteDataSource>()));
    gh.factory<_i53.ProfileCubit>(
        () => _i53.ProfileCubit(profileRepo: gh<_i40.ProfileRepo>()));
    gh.factory<_i54.EmployeDataSource>(() => _i54.EmployeRemoteDatasourceImpl(
          dioClient: gh<_i22.DioClient>(),
          keyValueStorage: gh<_i22.KeyValueStorage>(),
          internetChecker: gh<_i22.InternetChecker>(),
          logger: gh<_i5.Logger>(),
        ));
    gh.factory<_i55.SalesOrderCreateCubit>(() => _i55.SalesOrderCreateCubit(
          salesRepo: gh<_i23.SalesRepo>(),
          keyValueStorage: gh<_i22.KeyValueStorage>(),
          customerRepo: gh<_i45.CustomerRepo>(),
        ));
    gh.factory<_i56.AllCustomerCubit>(
        () => _i56.AllCustomerCubit(customerRepo: gh<_i45.CustomerRepo>()));
    gh.factory<_i57.CustomerFullDetailsCubit>(() =>
        _i57.CustomerFullDetailsCubit(customerRepo: gh<_i45.CustomerRepo>()));
    gh.factory<_i58.LoginUseCase>(
        () => _i58.LoginUseCase(loginRepository: gh<_i24.LoginRepository>()));
    gh.factory<_i59.MarkAttendanceRemoteDataSource>(
        () => _i59.MarkAttendanceRemoteDatasourceImpl(
              dioClient: gh<_i22.DioClient>(),
              logger: gh<_i5.Logger>(),
              keyValueStorage: gh<_i22.KeyValueStorage>(),
            ));
    gh.factory<_i60.AddressRepo>(() => _i61.AddressRepoImpl(
        addressRemoteDataSource: gh<_i34.AddressRemoteDataSource>()));
    gh.factory<_i62.ZoneRepo>(() => _i63.ZoneRepoImpl(
        zoneRemoteDataSource: gh<_i43.ZoneRemoteDataSource>()));
    gh.factory<_i64.MonthlyPlanRepo>(() => _i65.MonthlyPlanRepoImpl(
        remoteDataSource: gh<_i42.MonthlyPlanRemoteDataSource>()));
    gh.factory<_i66.AlertCubit>(() => _i66.AlertCubit(gh<_i36.AlertRepo>()));
    gh.factory<_i67.ViewMonthlyPlanCubit>(
        () => _i67.ViewMonthlyPlanCubit(gh<_i64.MonthlyPlanRepo>()));
    gh.factory<_i68.MonthlyPlanPendingCubit>(
        () => _i68.MonthlyPlanPendingCubit(gh<_i64.MonthlyPlanRepo>()));
    gh.factory<_i69.MonthlyPlanSearchCubit>(
        () => _i69.MonthlyPlanSearchCubit(gh<_i64.MonthlyPlanRepo>()));
    gh.factory<_i70.MarkAttendanceRepo>(() => _i71.MarkAttendanceRepoImpl(
        markAttendanceRemoteDataSource:
            gh<_i59.MarkAttendanceRemoteDataSource>()));
    gh.factory<_i72.PrimarySourceRepo>(() => _i73.PrimarySourceRepoImpl(
        primarySourceRemoteDataSource:
            gh<_i44.PrimarySourceRemoteDataSource>()));
    gh.factory<_i74.EmployeRepo>(() =>
        _i75.EmployeRepoImpl(employeDataSource: gh<_i54.EmployeDataSource>()));
    gh.factory<_i76.PunchInUseCase>(() =>
        _i76.PunchInUseCase(markAttendanceRepo: gh<_i70.MarkAttendanceRepo>()));
    gh.factory<_i77.PunchOutUsecase>(() => _i77.PunchOutUsecase(
        markAttendanceRepo: gh<_i70.MarkAttendanceRepo>()));
    gh.factory<_i78.LastPunchInOutUseCase>(() => _i78.LastPunchInOutUseCase(
        markAttendanceRepo: gh<_i70.MarkAttendanceRepo>()));
    gh.factory<_i79.CheckinCubit>(() => _i79.CheckinCubit(
          customerRepo: gh<_i45.CustomerRepo>(),
          employeRepo: gh<_i74.EmployeRepo>(),
          purposeRepo: gh<_i48.PurposeRepo>(),
          commonImageServices: gh<_i17.CommonImageServices>(),
        ));
    gh.factory<_i80.CustomerCreateCubit>(() => _i80.CustomerCreateCubit(
          primarySourceRepo: gh<_i72.PrimarySourceRepo>(),
          addressRepo: gh<_i60.AddressRepo>(),
          zoneRepo: gh<_i62.ZoneRepo>(),
          customerRepo: gh<_i45.CustomerRepo>(),
          divisionRepo: gh<_i51.DivisionRepo>(),
        ));
    gh.factory<_i81.LoginCubit>(() => _i81.LoginCubit(
          gh<_i58.LoginUseCase>(),
          gh<_i22.KeyValueStorage>(),
        ));
    gh.factory<_i82.UpdateMonthlyPlanCubit>(() => _i82.UpdateMonthlyPlanCubit(
        monthlyPlanRepo: gh<_i64.MonthlyPlanRepo>()));
    gh.factory<_i83.CreateMonthlyPlanCubit>(() => _i83.CreateMonthlyPlanCubit(
          monthlyPlanRepo: gh<_i64.MonthlyPlanRepo>(),
          employeRepo: gh<_i74.EmployeRepo>(),
        ));
    gh.factory<_i84.MarkAttendanceCubit>(() => _i84.MarkAttendanceCubit(
          gh<_i85.PunchInUseCase>(),
          gh<_i85.PunchOutUsecase>(),
          gh<_i85.LastPunchInOutUseCase>(),
        ));
    return this;
  }
}

class _$ThirdPartyDependencies extends _i86.ThirdPartyDependencies {}
