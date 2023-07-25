import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:surf_practice_magic_ball/features/app/domain/app_config.dart';

@Singleton()
@prod
@dev
@test
final class DioContainer {
  late final Dio dio;

  DioContainer(AppConfig appConfig) {
    final options = BaseOptions(
      baseUrl: appConfig.baseUrl,
      connectTimeout: const Duration(seconds: 15),
    );

    dio = Dio(options);
  }
}
