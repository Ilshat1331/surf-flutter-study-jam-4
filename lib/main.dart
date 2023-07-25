import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/features/app/presentation/main_app_builder.dart';
import 'package:surf_practice_magic_ball/features/app/presentation/main_app_runner.dart';
import 'package:surf_practice_magic_ball/features/random_reading/presentation/screens/magic_ball_screen.dart';

void main() async {
  const env = String.fromEnvironment("env", defaultValue: "prod");
  const runner = MainAppRunner(env: env);
  final builder = MainAppBuilder();
  runner.run(builder);
}

/// App,s main widget.
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MagicBallScreen(),
    );
  }
}
