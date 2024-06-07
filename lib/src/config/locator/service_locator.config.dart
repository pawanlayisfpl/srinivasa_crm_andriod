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
    as _i25;
import 'package:srinivasa_crm_new/src/core/connection/internet_checker.dart'
    as _i13;
import 'package:srinivasa_crm_new/src/core/core.dart' as _i20;
import 'package:srinivasa_crm_new/src/core/network/dio_client.dart' as _i18;
import 'package:srinivasa_crm_new/src/core/storage/key_value_storage.dart'
    as _i17;
import 'package:srinivasa_crm_new/src/features/login/data/data%20source/remote/login_remote_datasource.dart'
    as _i19;
import 'package:srinivasa_crm_new/src/features/login/data/repository/login_repo_impl.dart'
    as _i22;
import 'package:srinivasa_crm_new/src/features/login/domain/repository/login_repo.dart'
    as _i21;
import 'package:srinivasa_crm_new/src/features/login/domain/usecases/login_usecase.dart'
    as _i23;
import 'package:srinivasa_crm_new/src/features/login/presentation/cubit/login_cubit.dart'
    as _i24;

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
    gh.factory<_i13.InternetConnectionChecker>(
        () => _i13.InternetConnectionChecker(gh<_i5.Connectivity>()));
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
    gh.factory<_i23.LoginUseCase>(
        () => _i23.LoginUseCase(loginRepository: gh<_i21.LoginRepository>()));
    gh.factory<_i24.LoginCubit>(() => _i24.LoginCubit(
          gh<_i23.LoginUseCase>(),
          gh<_i20.KeyValueStorage>(),
        ));
    return this;
  }
}

class _$ThirdPartyDependencies extends _i25.ThirdPartyDependencies {}
