// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:surf_practice_magic_ball/features/app/data/dio_container.dart'
    as _i5;
import 'package:surf_practice_magic_ball/features/app/data/main_app_config.dart'
    as _i4;
import 'package:surf_practice_magic_ball/features/app/domain/app_config.dart'
    as _i3;
import 'package:surf_practice_magic_ball/features/random_reading/data/repository/mock_reading_repository.dart'
    as _i8;
import 'package:surf_practice_magic_ball/features/random_reading/data/repository/network_reading_repository.dart'
    as _i7;
import 'package:surf_practice_magic_ball/features/random_reading/domain/reading_cubit/reading_cubit.dart'
    as _i9;
import 'package:surf_practice_magic_ball/features/random_reading/domain/repository/reading_repository.dart'
    as _i6;

const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppConfig>(
      _i4.ProdAppConfig(),
      registerFor: {_prod},
    );
    gh.singleton<_i3.AppConfig>(
      _i4.DevAppConfig(),
      registerFor: {_dev},
    );
    gh.singleton<_i3.AppConfig>(
      _i4.TestAppConfig(),
      registerFor: {_test},
    );
    gh.singleton<_i5.DioContainer>(
      _i5.DioContainer(gh<_i3.AppConfig>()),
      registerFor: {
        _prod,
        _dev,
        _test,
      },
    );
    gh.factory<_i6.IReadingRepository>(
      () => _i7.NetworkReadingRepository(gh<_i5.DioContainer>()),
      registerFor: {_prod},
    );
    gh.factory<_i6.IReadingRepository>(
      () => _i8.MockReadingRepository(),
      registerFor: {_test},
    );
    gh.singleton<_i9.ReadingCubit>(
      _i9.ReadingCubit(gh<_i6.IReadingRepository>()),
      registerFor: {
        _test,
        _prod,
      },
    );
    return this;
  }
}
