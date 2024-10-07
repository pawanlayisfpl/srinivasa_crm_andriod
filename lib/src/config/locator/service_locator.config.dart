// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i163;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:logger/logger.dart' as _i974;
import 'package:package_info_plus/package_info_plus.dart' as _i655;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Address%20Repo/address_remote_datasource.dart'
    as _i566;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Divisions/divisions_remote_datasource.dart'
    as _i203;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Employe/employe_remote_datasource.dart'
    as _i102;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Primary%20Source/primary_source_remote_datasource.dart'
    as _i568;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Purpose/purpose_remote_datasource.dart'
    as _i355;
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Zone/zone_remote_datasource.dart'
    as _i726;
import 'package:srinivasa_crm_new/shared/data/repo/address_repo_impl.dart'
    as _i1057;
import 'package:srinivasa_crm_new/shared/data/repo/divisions_repo_impl.dart'
    as _i186;
import 'package:srinivasa_crm_new/shared/data/repo/employe_repo_impl.dart'
    as _i544;
import 'package:srinivasa_crm_new/shared/data/repo/primary_source_repo_impl.dart'
    as _i531;
import 'package:srinivasa_crm_new/shared/data/repo/purpose_repo_impl.dart'
    as _i725;
import 'package:srinivasa_crm_new/shared/data/repo/zone_repo_impl.dart'
    as _i605;
import 'package:srinivasa_crm_new/shared/domain/repo/Address/address_repo.dart'
    as _i311;
import 'package:srinivasa_crm_new/shared/domain/repo/Divisions/divison_repo.dart'
    as _i389;
import 'package:srinivasa_crm_new/shared/domain/repo/Employe/employe_repo.dart'
    as _i981;
import 'package:srinivasa_crm_new/shared/domain/repo/Primary%20Source/primary_source_repo.dart'
    as _i466;
import 'package:srinivasa_crm_new/shared/domain/repo/Purpose/purpose_repo.dart'
    as _i490;
import 'package:srinivasa_crm_new/shared/domain/repo/Zone/zone_repo.dart'
    as _i792;
import 'package:srinivasa_crm_new/src/common/common.dart' as _i972;
import 'package:srinivasa_crm_new/src/common/services/common_excel_services.dart'
    as _i501;
import 'package:srinivasa_crm_new/src/common/services/common_file_storage_services.dart'
    as _i837;
import 'package:srinivasa_crm_new/src/common/services/common_image_services.dart'
    as _i250;
import 'package:srinivasa_crm_new/src/common/services/common_location_services.dart'
    as _i753;
import 'package:srinivasa_crm_new/src/common/services/common_permission_services.dart'
    as _i918;
import 'package:srinivasa_crm_new/src/common/services/common_shareplus_services.dart'
    as _i807;
import 'package:srinivasa_crm_new/src/common/services/notifications/common_notifications.dart'
    as _i1051;
import 'package:srinivasa_crm_new/src/common/services/notifications/common_push_notifications_services.dart'
    as _i125;
import 'package:srinivasa_crm_new/src/config/locator/service_locator.dart'
    as _i639;
import 'package:srinivasa_crm_new/src/core/connection/internet_checker.dart'
    as _i132;
import 'package:srinivasa_crm_new/src/core/core.dart' as _i961;
import 'package:srinivasa_crm_new/src/core/network/dio_client.dart' as _i720;
import 'package:srinivasa_crm_new/src/core/storage/key_value_storage.dart'
    as _i286;
import 'package:srinivasa_crm_new/src/features/Alerts%20/data/datasource/alert_remote_datasource.dart'
    as _i637;
import 'package:srinivasa_crm_new/src/features/Alerts%20/data/repo/alert_repo_impl.dart'
    as _i66;
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/repo/alert_repo.dart'
    as _i628;
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart'
    as _i836;
import 'package:srinivasa_crm_new/src/features/Customer/data/datasource/remote/customer_remote_datasources.dart'
    as _i411;
import 'package:srinivasa_crm_new/src/features/Customer/data/repo/customer_repo_impl.dart'
    as _i113;
import 'package:srinivasa_crm_new/src/features/Customer/database/customer_database.dart'
    as _i231;
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart'
    as _i209;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_cubit.dart'
    as _i320;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_cubit.dart'
    as _i455;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart'
    as _i404;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Full%20Details/cubit/customer_full_details_cubit.dart'
    as _i929;
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Search/presentation/cubit/search_customer_cubit.dart'
    as _i86;
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/dashboard_cubit.dart'
    as _i66;
import 'package:srinivasa_crm_new/src/features/Kyc/data/datasource/remote/kyc_remote_datasource.dart'
    as _i908;
import 'package:srinivasa_crm_new/src/features/Kyc/data/repo/kyc_repo_impl.dart'
    as _i238;
import 'package:srinivasa_crm_new/src/features/Kyc/domain/repo/kyc_repo.dart'
    as _i382;
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/cubit/kyc_cubit.dart'
    as _i403;
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/cubit/kyc_upload_cubit.dart'
    as _i192;
import 'package:srinivasa_crm_new/src/features/login/data/data%20source/remote/login_remote_datasource.dart'
    as _i579;
import 'package:srinivasa_crm_new/src/features/login/data/repository/login_repo_impl.dart'
    as _i443;
import 'package:srinivasa_crm_new/src/features/login/domain/repository/login_repo.dart'
    as _i584;
import 'package:srinivasa_crm_new/src/features/login/domain/usecases/login_usecase.dart'
    as _i204;
import 'package:srinivasa_crm_new/src/features/login/presentation/cubit/login_cubit.dart'
    as _i898;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/data/datasource/remote/mark_attendance_remote_datasource.dart'
    as _i612;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/data/repo/mark_attendance_repo_impl.dart'
    as _i59;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/domain.dart'
    as _i866;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/repo/mark_attendance_repo.dart'
    as _i492;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/usecase/last_punch_in_usecase.dart'
    as _i483;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/usecase/punch_in_usecase.dart'
    as _i564;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/usecase/punch_out_usecase.dart'
    as _i585;
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart'
    as _i796;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/data/datasource/monthly_plan_remote_datasource.dart'
    as _i81;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/data/repo/monthly_plan_repo_impl.dart'
    as _i771;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/repo/monthly_plan_repo.dart'
    as _i118;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_cubit.dart'
    as _i149;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/cubit/daily_plan_cubit.dart'
    as _i42;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/repo/daily_plan_repo.dart'
    as _i472;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/cubit/monthly_plan_pending_cubit.dart'
    as _i702;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/monthly_plan_search_cubit.dart'
    as _i848;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/update_monthly_plan_cubit.dart'
    as _i520;
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart'
    as _i49;
import 'package:srinivasa_crm_new/src/features/Profile/data/datasource/local/profile_local_datasource.dart'
    as _i346;
import 'package:srinivasa_crm_new/src/features/Profile/data/repo/profile_repo_impl.dart'
    as _i390;
import 'package:srinivasa_crm_new/src/features/Profile/domain/repo/profile_repo.dart'
    as _i208;
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart'
    as _i826;
import 'package:srinivasa_crm_new/src/features/Sales%20Order/data/repo/sales_repo.dart'
    as _i133;
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart'
    as _i812;
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Order%20Pending/cubit/pending_order_cubit.dart'
    as _i564;
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Particular/cubit/sales_order_particular_cubit.dart'
    as _i956;
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/cubit/sales_order_view_cubit.dart'
    as _i237;
import 'package:srinivasa_crm_new/src/features/User%20Activity/data/repo/user_activity_repo.dart'
    as _i939;
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/cubit/user_activity_cubit.dart'
    as _i186;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyDependencies = _$ThirdPartyDependencies();
    gh.factory<DateTime>(() => thirdPartyDependencies.defaultDateTime);
    gh.factory<_i66.DashboardCubit>(() => _i66.DashboardCubit());
    gh.singleton<_i361.Dio>(() => thirdPartyDependencies.dio);
    gh.singleton<_i163.FlutterLocalNotificationsPlugin>(
        () => thirdPartyDependencies.flutterLocalNotificationsPlugin);
    gh.singleton<_i974.Logger>(() => thirdPartyDependencies.logger);
    gh.singleton<_i895.Connectivity>(() => thirdPartyDependencies.connectivity);
    gh.singleton<_i973.InternetConnectionChecker>(
        () => thirdPartyDependencies.internetConnectionChecker);
    gh.singleton<_i558.FlutterSecureStorage>(
        () => thirdPartyDependencies.secureStorage);
    await gh.singletonAsync<_i655.PackageInfo>(
      () => thirdPartyDependencies.packageInfo,
      preResolve: true,
    );
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => thirdPartyDependencies.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i231.CustomerDataBaseHelper>(
        () => _i231.CustomerDataBaseHelper());
    gh.lazySingleton<_i807.CommonSharePlusServices>(
        () => _i807.CommonSharePlusServices());
    gh.lazySingleton<_i837.CommonFileStorageServcies>(
        () => _i837.CommonFileStorageServcies());
    gh.lazySingleton<_i753.CommonLocationServices>(
        () => _i753.CommonLocationServices());
    gh.lazySingleton<_i918.CommonPermissionService>(
        () => _i918.CommonPermissionService());
    gh.factory<_i132.InternetChecker>(() => _i132.InternetChecker(
          gh<_i895.Connectivity>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i125.CommonPushNotificationsServices>(
        () => _i125.CommonPushNotificationsServicesImpl());
    gh.factory<_i286.KeyValueStorage>(() => _i286.KeyValueStorage(
          gh<_i558.FlutterSecureStorage>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i250.CommonImageServices>(
        () => _i250.CommomImageServicesImpl());
    gh.factory<_i720.DioClient>(() => _i720.DioClient(
          gh<_i361.Dio>(),
          gh<_i286.KeyValueStorage>(),
          gh<_i974.Logger>(),
        ));
    gh.factory<_i81.MonthlyPlanRemoteDataSource>(
        () => _i81.MonthlyPlanRemoteDataSourceImpl(
              dioClient: gh<_i961.DioClient>(),
              keyValueStorage: gh<_i961.KeyValueStorage>(),
              logger: gh<_i974.Logger>(),
              internetChecker: gh<_i961.InternetChecker>(),
            ));
    gh.factory<_i612.MarkAttendanceRemoteDataSource>(
        () => _i612.MarkAttendanceRemoteDatasourceImpl(
              dioClient: gh<_i961.DioClient>(),
              logger: gh<_i974.Logger>(),
              keyValueStorage: gh<_i961.KeyValueStorage>(),
              internetChecker: gh<_i961.InternetChecker>(),
            ));
    gh.factory<_i579.LoginRemoteDataSource>(
        () => _i579.LoginRemoteDataSourceImpl(
              dioClient: gh<_i961.DioClient>(),
              keyValueStorage: gh<_i961.KeyValueStorage>(),
            ));
    gh.factory<_i133.SalesRepo>(() => _i133.SaleRepoImpl(
          dioClient: gh<_i961.DioClient>(),
          keyValueStorage: gh<_i961.KeyValueStorage>(),
          internetChecker: gh<_i961.InternetChecker>(),
          logger: gh<_i974.Logger>(),
        ));
    gh.factory<_i584.LoginRepository>(() => _i443.LoginRepoImpl(
        loginRemoteDataSource: gh<_i579.LoginRemoteDataSource>()));
    gh.factory<_i956.SalesOrderParticularCubit>(
        () => _i956.SalesOrderParticularCubit(gh<_i133.SalesRepo>()));
    gh.factory<_i237.SalesOrderViewCubit>(
        () => _i237.SalesOrderViewCubit(gh<_i133.SalesRepo>()));
    gh.factory<_i118.MonthlyPlanRepo>(() => _i771.MonthlyPlanRepoImpl(
        remoteDataSource: gh<_i81.MonthlyPlanRemoteDataSource>()));
    gh.factory<_i564.PendingOrderCubit>(
        () => _i564.PendingOrderCubit(saleRepo: gh<_i133.SalesRepo>()));
    gh.lazySingleton<_i501.ExcelServices>(() => _i501.ExcelServices(
          sharePlusServices: gh<_i972.CommonSharePlusServices>(),
          fileStorageServcies: gh<_i972.CommonFileStorageServcies>(),
        ));
    gh.factory<_i346.ProfileLocalRepo>(() => _i346.ProfileRepoImpl(
          dioClient: gh<_i961.DioClient>(),
          keyValueStorage: gh<_i961.KeyValueStorage>(),
          logger: gh<_i974.Logger>(),
        ));
    gh.factory<_i1051.CommonNotifications>(() => _i1051.CommonNotifications(
        flutterLocalNotificationsPlugin:
            gh<_i163.FlutterLocalNotificationsPlugin>()));
    gh.factory<_i637.AlertRemoteDataSource>(
        () => _i637.AlertRemoteDataSourceImpl(
              dioClient: gh<_i961.DioClient>(),
              keyValueStorage: gh<_i961.KeyValueStorage>(),
              internetChecker: gh<_i961.InternetChecker>(),
            ));
    gh.factory<_i203.DivisonsRemoteDataSource>(
        () => _i203.DivisionsRemoteDatasourceImpl(
              dioClient: gh<_i961.DioClient>(),
              keyValueStorage: gh<_i961.KeyValueStorage>(),
              internetChecker: gh<_i961.InternetChecker>(),
            ));
    gh.factory<_i411.CustomerRemoteDataSource>(
        () => _i411.CustomerRemoteDatasourcesImpl(
              gh<_i961.DioClient>(),
              gh<_i961.KeyValueStorage>(),
              gh<_i974.Logger>(),
              gh<_i961.InternetChecker>(),
            ));
    gh.factory<_i355.PurposeRemoteDatasource>(
        () => _i355.PurposeRemoteDatasourceImpl(
              dioClient: gh<_i961.DioClient>(),
              keyValueStorage: gh<_i961.KeyValueStorage>(),
              internetChecker: gh<_i961.InternetChecker>(),
            ));
    gh.factory<_i566.AddressRemoteDataSource>(
        () => _i566.AddressRemoteDatasourceImpl(
              internetConnectionChecker: gh<_i961.InternetChecker>(),
              dioClient: gh<_i961.DioClient>(),
              logger: gh<_i974.Logger>(),
            ));
    gh.factory<_i908.KycRemoteDataSource>(() => _i908.KycRemoteDatasourceImpl(
          dioClient: gh<_i961.DioClient>(),
          internetChecker: gh<_i961.InternetChecker>(),
          logger: gh<_i974.Logger>(),
          keyValueStorage: gh<_i961.KeyValueStorage>(),
        ));
    gh.factory<_i628.AlertRepo>(() => _i66.AlertRepoImpl(
        alertRemoteDataSource: gh<_i637.AlertRemoteDataSource>()));
    gh.factory<_i382.KycRepo>(() => _i238.KycRepoImpl(
        kycRemoteDataSource: gh<_i908.KycRemoteDataSource>()));
    gh.factory<_i49.ViewMonthlyPlanCubit>(
        () => _i49.ViewMonthlyPlanCubit(gh<_i118.MonthlyPlanRepo>()));
    gh.factory<_i702.MonthlyPlanPendingCubit>(
        () => _i702.MonthlyPlanPendingCubit(gh<_i118.MonthlyPlanRepo>()));
    gh.factory<_i848.MonthlyPlanSearchCubit>(
        () => _i848.MonthlyPlanSearchCubit(gh<_i118.MonthlyPlanRepo>()));
    gh.factory<_i208.ProfileRepo>(() =>
        _i390.ProfileRepoImpl(profileLocalRepo: gh<_i346.ProfileLocalRepo>()));
    gh.factory<_i726.ZoneRemoteDataSource>(() => _i726.ZoneRemoteDatasourceImpl(
          dioClient: gh<_i961.DioClient>(),
          internetChecker: gh<_i961.InternetChecker>(),
          keyValueStorage: gh<_i961.KeyValueStorage>(),
        ));
    gh.factory<_i492.MarkAttendanceRepo>(() => _i59.MarkAttendanceRepoImpl(
        markAttendanceRemoteDataSource:
            gh<_i612.MarkAttendanceRemoteDataSource>()));
    gh.factory<_i564.PunchInUseCase>(() => _i564.PunchInUseCase(
        markAttendanceRepo: gh<_i492.MarkAttendanceRepo>()));
    gh.factory<_i585.PunchOutUsecase>(() => _i585.PunchOutUsecase(
        markAttendanceRepo: gh<_i492.MarkAttendanceRepo>()));
    gh.factory<_i483.LastPunchInOutUseCase>(() => _i483.LastPunchInOutUseCase(
        markAttendanceRepo: gh<_i492.MarkAttendanceRepo>()));
    gh.factory<_i568.PrimarySourceRemoteDataSource>(
        () => _i568.PrimarySourceRemoteDataSourceImpl(
              internetChecker: gh<_i961.InternetChecker>(),
              dioClient: gh<_i961.DioClient>(),
              logger: gh<_i974.Logger>(),
            ));
    gh.factory<_i472.DailyPlanRepo>(
        () => _i472.DailyPlanRepoImpl(dioClient: gh<_i961.DioClient>()));
    gh.factory<_i209.CustomerRepo>(() => _i113.CustomerRepoImpl(
        customerRemoteDataSource: gh<_i411.CustomerRemoteDataSource>()));
    gh.factory<_i86.SearchCustomerCubit>(
        () => _i86.SearchCustomerCubit(gh<_i209.CustomerRepo>()));
    gh.factory<_i490.PurposeRepo>(() => _i725.PurposeRepoImpl(
        purposeRemoteDatasource: gh<_i355.PurposeRemoteDatasource>()));
    gh.factory<_i826.ProfileCubit>(() => _i826.ProfileCubit(
          profileRepo: gh<_i208.ProfileRepo>(),
          commonLocationServices: gh<_i972.CommonLocationServices>(),
          keyValueStorage: gh<_i961.KeyValueStorage>(),
        ));
    gh.factory<_i403.KycCubit>(() => _i403.KycCubit(gh<_i382.KycRepo>()));
    gh.factory<_i389.DivisionRepo>(() => _i186.DivisionRepoimpl(
        dataSource: gh<_i203.DivisonsRemoteDataSource>()));
    gh.factory<_i102.EmployeDataSource>(() => _i102.EmployeRemoteDatasourceImpl(
          dioClient: gh<_i961.DioClient>(),
          keyValueStorage: gh<_i961.KeyValueStorage>(),
          internetChecker: gh<_i961.InternetChecker>(),
          logger: gh<_i974.Logger>(),
        ));
    gh.factory<_i939.UserActivityRepo>(() => _i939.UserActivityRepoImpl(
          dioClient: gh<_i961.DioClient>(),
          keyValueStorage: gh<_i961.KeyValueStorage>(),
          internetChecker: gh<_i961.InternetChecker>(),
          logger: gh<_i974.Logger>(),
        ));
    gh.factory<_i42.DailyPlanCubit>(() => _i42.DailyPlanCubit(
          gh<_i209.CustomerRepo>(),
          gh<_i118.MonthlyPlanRepo>(),
          gh<_i472.DailyPlanRepo>(),
        ));
    gh.factory<_i812.SalesOrderCreateCubit>(() => _i812.SalesOrderCreateCubit(
          salesRepo: gh<_i133.SalesRepo>(),
          keyValueStorage: gh<_i961.KeyValueStorage>(),
          customerRepo: gh<_i209.CustomerRepo>(),
        ));
    gh.factory<_i320.AllCustomerCubit>(
        () => _i320.AllCustomerCubit(customerRepo: gh<_i209.CustomerRepo>()));
    gh.factory<_i929.CustomerFullDetailsCubit>(() =>
        _i929.CustomerFullDetailsCubit(customerRepo: gh<_i209.CustomerRepo>()));
    gh.factory<_i204.LoginUseCase>(
        () => _i204.LoginUseCase(loginRepository: gh<_i584.LoginRepository>()));
    gh.factory<_i186.UserActivityCubit>(
        () => _i186.UserActivityCubit(gh<_i939.UserActivityRepo>()));
    gh.factory<_i796.MarkAttendanceCubit>(() => _i796.MarkAttendanceCubit(
          gh<_i866.PunchInUseCase>(),
          gh<_i866.PunchOutUsecase>(),
          gh<_i866.LastPunchInOutUseCase>(),
          gh<_i972.CommonLocationServices>(),
          gh<_i1051.CommonNotifications>(),
        ));
    gh.factory<_i311.AddressRepo>(() => _i1057.AddressRepoImpl(
        addressRemoteDataSource: gh<_i566.AddressRemoteDataSource>()));
    gh.factory<_i792.ZoneRepo>(() => _i605.ZoneRepoImpl(
        zoneRemoteDataSource: gh<_i726.ZoneRemoteDataSource>()));
    gh.factory<_i192.KycUploadCubit>(() => _i192.KycUploadCubit(
          imageServices: gh<_i972.CommonImageServices>(),
          kycRepo: gh<_i382.KycRepo>(),
        ));
    gh.factory<_i520.UpdateMonthlyPlanCubit>(() => _i520.UpdateMonthlyPlanCubit(
          monthlyPlanRepo: gh<_i118.MonthlyPlanRepo>(),
          customerRepo: gh<_i209.CustomerRepo>(),
        ));
    gh.factory<_i836.AlertCubit>(() => _i836.AlertCubit(gh<_i628.AlertRepo>()));
    gh.factory<_i466.PrimarySourceRepo>(() => _i531.PrimarySourceRepoImpl(
        primarySourceRemoteDataSource:
            gh<_i568.PrimarySourceRemoteDataSource>()));
    gh.factory<_i981.EmployeRepo>(() => _i544.EmployeRepoImpl(
        employeDataSource: gh<_i102.EmployeDataSource>()));
    gh.factory<_i455.CheckinCubit>(() => _i455.CheckinCubit(
          customerRepo: gh<_i209.CustomerRepo>(),
          employeRepo: gh<_i981.EmployeRepo>(),
          purposeRepo: gh<_i490.PurposeRepo>(),
          commonImageServices: gh<_i972.CommonImageServices>(),
        ));
    gh.factory<_i404.CustomerCreateCubit>(() => _i404.CustomerCreateCubit(
          primarySourceRepo: gh<_i466.PrimarySourceRepo>(),
          addressRepo: gh<_i311.AddressRepo>(),
          zoneRepo: gh<_i792.ZoneRepo>(),
          customerRepo: gh<_i209.CustomerRepo>(),
          divisionRepo: gh<_i389.DivisionRepo>(),
        ));
    gh.factory<_i149.CreateMonthlyPlanCubit>(() => _i149.CreateMonthlyPlanCubit(
          monthlyPlanRepo: gh<_i118.MonthlyPlanRepo>(),
          employeRepo: gh<_i981.EmployeRepo>(),
          customerRepo: gh<_i209.CustomerRepo>(),
        ));
    gh.factory<_i898.LoginCubit>(() => _i898.LoginCubit(
          gh<_i204.LoginUseCase>(),
          gh<_i961.KeyValueStorage>(),
        ));
    return this;
  }
}

class _$ThirdPartyDependencies extends _i639.ThirdPartyDependencies {}
