import 'package:surf_practice_magic_ball/features/app/domain/app_builder.dart';

abstract interface class IAppRunner {
  Future<void> preloadData();
  Future<void> run(IAppBuilder appBuilder);
}
