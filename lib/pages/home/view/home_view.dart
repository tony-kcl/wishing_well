import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';

import '../widget/widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  bool isAnimating = false;
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                '寫下你的願望',
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
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
                      child: isAnimating 
                        ? AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Transform(
                                  alignment: Alignment.centerRight,
                                  transform: Matrix4.rotationY(2 * pi * _animation.value),
                                  child: SizedBox(
                                    width: size.width / 3 / 2,
                                    height: size.height / 3,
                                    child: CustomPaint(
                                      painter: TrianglePainter(
                                        isLeft: true
                                      ),
                                    ),
                                  ),
                                );
                            }
                          )
                        : const SizedBox(),
                    ),
                  ),
                  Positioned(
                    left: size.width / 3 * 2,
                    child: SizedBox(
                      width: size.width / 3,
                      height: size.height / 3,
                      child: isAnimating 
                        ? AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Transform(
                                  alignment: Alignment.centerLeft,
                                  transform: Matrix4.rotationY(2 * pi * _animation.value),
                                  child: SizedBox(
                                    width: size.width / 3 / 2,
                                    height: size.height / 3,
                                    child: CustomPaint(
                                      painter: TrianglePainter(
                                        isLeft: false
                                      ),
                                    ),
                                  ),
                                );
                            }
                          )
                        : const SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox()
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        dev.log('onTap');
                        if (mounted) {
                          setState(() {
                            isAnimating = true;
                          });
                        }
                        _controller.forward().whenComplete(() {
       
                        });
                      },
                      child: Text(
                        '送出',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox()
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}