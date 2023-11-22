import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishing_well/pages/home/home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
            const EnvelopView(),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const Expanded(flex: 1, child: SizedBox()),
                Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          dev.log('onTap');
                          final bloc = context.read<HomeBloc>();
                          bloc.add(HomeStartAnimationEvent());
                        },
                        child: Text(
                          '送出',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )),
                const Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
