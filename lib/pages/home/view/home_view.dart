import 'dart:developer';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
            Row(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Expanded(
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
                const Expanded(
                  child: SizedBox(),
                ),
              ],
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
                        log('onTap');
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