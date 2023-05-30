import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

//flutter_swipe_detector 참고

class SampleGestureDetector extends StatefulWidget {
  const SampleGestureDetector({Key? key}) : super(key: key);

  @override
  State<SampleGestureDetector> createState() => _SampleGestureDetectorState();
}

class _SampleGestureDetectorState extends State<SampleGestureDetector> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SwipeDetector(
        onSwipeUp: (offset) {
          print("up");
        },
          onSwipeDown: (offset) {
          print("down");
          },
          onSwipeLeft: (offset) {
          print("다음");
          },
          onSwipeRight: (offset) {
          print("이전");
          },
        child: GestureDetector(
          onDoubleTap: () {
            print("더블탭");
          },
          child: Container(
            color: Colors.green,

          ),
        )
      ),
    );
  }
}
