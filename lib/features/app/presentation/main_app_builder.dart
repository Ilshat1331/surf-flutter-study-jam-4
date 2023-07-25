import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/features/app/domain/app_builder.dart';
import 'package:surf_practice_magic_ball/features/random_reading/domain/reading_cubit/reading_cubit.dart';
import 'package:surf_practice_magic_ball/features/random_reading/presentation/screens/magic_ball_screen.dart';

import '../di/init_di.dart';

final class MainAppBuilder implements IAppBuilder {
  @override
  Widget buildApp() {
    return _GlobalProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MagicBallScreen(),
      ),
    );
  }
}

class _GlobalProviders extends StatelessWidget {
  const _GlobalProviders({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ReadingCubit>(),
          // create: (context) => ReadingCubit(sl<IReadingRepository>()),
        ),
      ],
      child: child,
    );
  }
}
