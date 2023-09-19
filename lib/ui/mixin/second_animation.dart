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
import 'package:flutter/scheduler.dart';

import 'base_screen.dart';


class SecondAnimation extends BaseScreen {
  const SecondAnimation({Key? key}) : super(key: key);
  @override
  _SecondAnimationState createState() => _SecondAnimationState();
}

class _SecondAnimationState extends BaseState<SecondAnimation>
    with BasicPage, SingleTickerProviderStateMixin {
  Duration duration = Duration.zero;
  late Ticker ticker;

  @override
  void initState() {
    super.initState();
    ticker = this.createTicker((elapsed) {
      setState(() => duration = elapsed);
    });
  }

  @override
  void dispose() {
    ticker.dispose();
    super.dispose();
  }

  @override
  String screenName() => 'Timer screen';

  @override
  Widget fab() {
    return FloatingActionButton.extended(
      onPressed: () {
        if (!ticker.isActive) {
          ticker.start();
        } else {
          ticker.stop();
        }
      },
      label: Text((!ticker.isActive) ? 'Start Timer' : 'Stop Timer'),
      icon: Icon(
          (!ticker.isActive) ? Icons.timer_outlined : Icons.timer_off_outlined,
          color: Colors.white),
    );
  }

  @override
  Widget body() {
    return Center(
      child: Text(
        duration.inSeconds.toString(),
        style: TextStyle(
          fontSize: 220,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
