import 'package:surf_practice_magic_ball/features/app/presentation/main_app_builder.dart';
import 'package:surf_practice_magic_ball/features/app/presentation/main_app_runner.dart';

void main() async {
  const env = String.fromEnvironment("env", defaultValue: "prod");
  const runner = MainAppRunner(env: env);
  final builder = MainAppBuilder();
  runner.run(builder);
}
