// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pagination/domain/repositories/get_photos_repository.dart'
    as _i7;
import 'package:pagination/domain/use_cases/get_photos_pagination_use_case.dart'
    as _i9;
import 'package:pagination/infrastructure/client_http.dart' as _i5;
import 'package:pagination/infrastructure/get_photos_data_source.dart' as _i6;
import 'package:pagination/infrastructure/get_photos_repository_imp.dart'
    as _i8;
import 'package:talker_flutter/talker_flutter.dart' as _i4;

import '../domain/use_cases/di_use_case.dart' as _i11;
import 'injection_container.dart' as _i10;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectableThirdPartiesModule = _$InjectableThirdPartiesModule();
  final injectableUseCaseModule = _$InjectableUseCaseModule();
  gh.singleton<_i3.Client>(injectableThirdPartiesModule.client);
  gh.singleton<_i4.Talker>(injectableThirdPartiesModule.talker);
  gh.singleton<_i5.ClientHTTP>(_i5.ClientHTTP(
    gh<_i3.Client>(),
    gh<_i4.Talker>(),
  ));
  gh.factory<_i6.GetPhotosDataSource>(
      () => _i6.GetPhotosDataSourceImpl(gh<_i5.ClientHTTP>()));
  gh.factory<_i7.GetPhotosRepository>(
      () => _i8.GetPhotosRepositoryImp(gh<_i6.GetPhotosDataSource>()));
  gh.singleton<_i9.GetPhotosPaginationUseCase>(injectableUseCaseModule
      .getDefaultConfigGetPhotosUseCase(gh<_i7.GetPhotosRepository>()));
  return getIt;
}

class _$InjectableThirdPartiesModule
    extends _i10.InjectableThirdPartiesModule {}

class _$InjectableUseCaseModule extends _i11.InjectableUseCaseModule {}
