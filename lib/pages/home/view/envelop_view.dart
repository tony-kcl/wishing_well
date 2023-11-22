import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../widget/widget.dart';

class EnvelopView extends StatefulWidget {
  const EnvelopView({super.key});

  @override
  State<EnvelopView> createState() => _EnvelopViewState();
}

class _EnvelopViewState extends State<EnvelopView>
    with SingleTickerProviderStateMixin {
  bool _isAnimating = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 0.5).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeStartAnimationState) {
          if (mounted) {
            setState(() {
              _isAnimating = true;
            });
          }
          _controller.forward();
        }
      },
      child: SizedBox(
        width: size.width,
        height: size.height / 3,
        child: Stack(
          children: [
            Positioned(
              left: size.width / 3,
              child: SizedBox(
                width: size.width / 3,
                height: size.height / 3,
                child: Container(
                  color: Colors.yellow,
                  height: size.height / 3,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    autocorrect: false,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: SizedBox(
                width: size.width / 3,
                height: size.height / 3,
                child: _isAnimating
                    ? AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Transform(
                            alignment: Alignment.centerRight,
                            transform:
                                Matrix4.rotationY(2 * pi * _animation.value),
                            child: SizedBox(
                              width: size.width / 3 / 2,
                              height: size.height / 3,
                              child: CustomPaint(
                                painter: TrianglePainter(
                                  isLeft: true,
                                ),
                              ),
                            ),
                          );
                        })
                    : const SizedBox(),
              ),
            ),
            Positioned(
              left: size.width / 3 * 2,
              child: SizedBox(
                width: size.width / 3,
                height: size.height / 3,
                child: _isAnimating
                    ? AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Transform(
                            alignment: Alignment.centerLeft,
                            transform:
                                Matrix4.rotationY(2 * pi * _animation.value),
                            child: SizedBox(
                              width: size.width / 3 / 2,
                              height: size.height / 3,
                              child: CustomPaint(
                                painter: TrianglePainter(
                                  isLeft: false,
                                ),
                              ),
                            ),
                          );
                        })
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
