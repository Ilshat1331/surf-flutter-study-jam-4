import 'package:injectable/injectable.dart';
import 'package:surf_practice_magic_ball/features/app/domain/app_config.dart';

@Singleton(as: AppConfig)
@prod
final class ProdAppConfig implements AppConfig {
  @override
  String get baseUrl => 'https://eightballapi.com';

  @override
  String get host => Environment.prod;
}

@Singleton(as: AppConfig)
@dev
final class DevAppConfig implements AppConfig {
  @override
  String get baseUrl => 'http://localhost';

  @override
  String get host => Environment.dev;
}

@Singleton(as: AppConfig)
@test
final class TestAppConfig implements AppConfig {
  @override
  String get baseUrl => 'http://mock';

  @override
  String get host => Environment.test;
}
