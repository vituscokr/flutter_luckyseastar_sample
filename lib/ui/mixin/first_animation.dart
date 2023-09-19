/*
Copyright (c) 2022 Kodeco LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
distribute, sublicense, create a derivative work, and/or sell copies of the
Software in any work that is designed, intended, or marketed for pedagogical or
instructional purposes related to programming, coding, application development,
or information technology.  Permission for such use, copying, modification,
merger, publication, distribution, sublicensing, creation of derivative works,
or sale is expressly withheld.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

import 'package:flutter/material.dart';

import 'base_screen.dart';

class FirstAnimationScreen extends BaseScreen {
  const FirstAnimationScreen({Key? key}) : super(key: key);
  @override
  _FirstAnimationScreenState createState() => _FirstAnimationScreenState();
}

class _FirstAnimationScreenState extends BaseState<FirstAnimationScreen>
    with BasicPage, SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  bool isGrowingAnimationCompleted = false;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..addListener(() {
            setState(() {});
          });

    animation = Tween<double>(begin: 0, end: 200).animate(controller);
    animation.addListener(() {
      if (animation.value as double > 100) {
        startOffsetAnimation();
      }
    });
  }

  void startOffsetAnimation() {
    setState(() {
      isGrowingAnimationCompleted = true;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  String screenName() => 'Home';

  @override
  Widget fab() {
    return FloatingActionButton.extended(
      onPressed: () {
        if (controller.isCompleted) {
          controller.reset();
        } else {
          if (controller.status == AnimationStatus.forward) {
            controller.reverse();
          } else if (controller.status != AnimationStatus.forward) {
            controller.forward();
          }
        }
      },
      label: Text(controller.isCompleted
          ? 'Reset Animation'
          : (!controller.isAnimating)
              ? 'Start Animation'
              : (controller.status == AnimationStatus.reverse)
                  ? 'Forward Animation'
                  : 'Reverse Animation'),
      icon: Icon(
          controller.isCompleted
              ? Icons.restart_alt
              : (!controller.isAnimating)
                  ? Icons.forward_outlined
                  : (controller.status == AnimationStatus.reverse)
                      ? Icons.arrow_forward_ios
                      : Icons.arrow_back_ios,
          color: Colors.white),
    );
  }

  @override
  Widget body() {
    double value = animation.value as double;
    return Stack(
      children: [
        Align(
          alignment: Alignment(
            value < 100
                ? -1 + ((animation.value as double) / 200)
                : -(animation.value as double) / 200,
            -1 + ((animation.value as double) / 200),
          ),
          child: Container(
            height: animation.value as double,
            width: animation.value as double,
            color: Colors.red,
            child: Container(),
          ),
        ),
      ],
    );
  }
}
