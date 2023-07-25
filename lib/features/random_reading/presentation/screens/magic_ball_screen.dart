import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'dart:math' as math;

import 'package:surf_practice_magic_ball/features/random_reading/domain/reading_cubit/reading_cubit.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 120))
        ..repeat();
  late final AnimationController _starController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this)
        ..repeat(reverse: true);

  late final AnimationController _moveController =
      AnimationController(duration: const Duration(seconds: 4), vsync: this)
        ..repeat(reverse: true);

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.waitForStart(
      onPhoneShake: () => _onTapBall(context.read<ReadingCubit>()),
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
    detector.startListening();
  }

  void _onTapBall(ReadingCubit cubit) => cubit.getRandomReading();

  @override
  void dispose() {
    _controller.dispose();
    _starController.dispose();
    _moveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingCubit, ReadingState>(
      builder: (context, state) => switch (state) {
        ReadingStateError() => const Text('dsa'),
        ReadingStateDone() => Scaffold(
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  RootWidget(
                    controller: _controller,
                    starController: _starController,
                    moveController: _moveController,
                  ),
                  Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Text(
                        state.reading.reading,
                        style:
                            const TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ReadingStateInitial() => RootWidget(
            controller: _controller,
            starController: _starController,
            moveController: _moveController),
        ReadingStateLoading() => Scaffold(
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  RootWidget(
                    controller: _controller,
                    starController: _starController,
                    moveController: _moveController,
                  ),
                  Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: const Text(
                        ". . .",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      },
    );
  }
}

class RootWidget extends StatelessWidget {
  const RootWidget({
    super.key,
    required AnimationController controller,
    required AnimationController starController,
    required AnimationController moveController,
  })  : _controller = controller,
        _starController = starController,
        _moveController = moveController;

  final AnimationController _controller;
  final AnimationController _starController;
  final AnimationController _moveController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF100C2C),
              Color(0xFF000002),
            ],
          ),
        ),
        child: Ball(
            controller: _controller,
            starController: _starController,
            moveController: _moveController),
      ),
    );
  }
}

class Ball extends StatelessWidget {
  const Ball({
    super.key,
    required AnimationController controller,
    required AnimationController starController,
    required AnimationController moveController,
  })  : _controller = controller,
        _starController = starController,
        _moveController = moveController;

  final AnimationController _controller;
  final AnimationController _starController;
  final AnimationController _moveController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: 75,
          child: Container(
            width: 246,
            height: 42,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/core/assets/images/ellipse.png'),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 76,
          child: Container(
            width: 100,
            height: 20,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/core/assets/images/small_ellipse.png'),
              ),
            ),
          ),
        ),
        const Positioned(
          // bottom: MediaQuery.of(context).size.height * 0.1,
          bottom: 20,
          child: Text(
            "Нажмите на шар\nили потрясите телефон",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Color(0xFF727272)),
          ),
        ),
        GestureDetector(
          onTap: () {
            _onTapBall(context.read<ReadingCubit>());
          },
          child: SizedBox(
            width: 320,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _moveController,
                  builder: (context, child) => Transform.translate(
                    offset: Offset(
                        0,
                        _moveController.value *
                            MediaQuery.of(context).size.height *
                            0.1),
                    child: GestureDetector(
                      onTap: () {
                        _onTapBall(context.read<ReadingCubit>());
                      },
                      child: Container(
                        width: 360,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('lib/core/assets/images/ball.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _moveController,
                  builder: (context, child) => Transform.translate(
                    offset: Offset(
                        0,
                        _moveController.value *
                            MediaQuery.of(context).size.height *
                            0.1),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => Transform.rotate(
                        angle: _controller.value * math.pi * 3,
                        child: child,
                      ),
                      child: Container(
                        width: 210,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'lib/core/assets/images/small_star.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _moveController,
                  builder: (context, child) => Transform.translate(
                    offset: Offset(
                        0,
                        _moveController.value *
                            MediaQuery.of(context).size.height *
                            0.1),
                    child: AnimatedBuilder(
                      animation: _starController,
                      builder: (context, child) => Transform.rotate(
                        angle: _controller.value,
                        child: child,
                      ),
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: const BoxDecoration(
                          // color: Colors.red,
                          image: DecorationImage(
                            image:
                                AssetImage('lib/core/assets/images/star.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onTapBall(ReadingCubit cubit) => cubit.getRandomReading();
}
