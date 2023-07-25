import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/features/app/di/init_di.dart';
import 'package:surf_practice_magic_ball/features/app/domain/app_builder.dart';
import 'package:surf_practice_magic_ball/features/app/domain/app_runner.dart';

final class MainAppRunner implements IAppRunner {
  final String env;

  const MainAppRunner({required this.env});

  @override
  Future<void> preloadData() async {
    WidgetsFlutterBinding.ensureInitialized();
    //init app
    initDi(env);
    //init config
  }

  @override
  Future<void> run(IAppBuilder appBuilder) async {
    await preloadData();
    runApp(appBuilder.buildApp());
  }
}
