import 'package:flutter/material.dart';
// 참고 : https://in-coding.tistory.com/85
//https://stackoverflow.com/questions/50211863/how-to-create-a-custom-blured-shape-with-rounded-corners-in-flutter
class SampleClipPathPage extends StatelessWidget {
  const SampleClipPathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ClipPath'),),
      body: Container(
        color: Colors.green,
        child: Center(
          child: ClipPath(
            clipper: CustomBoundClipper(),
            child: Container(
              height: 300,
              width: 300,
              color: Colors.red,

            ),
          ),
        ),
      ),
    );
  }
}

class CustomBoundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    //Path path = Path()
    //..lineTo(0.0, size.height)
    //..lineTo(size.width,size.height)
    //..lineTo(size.width, 20)
    //..close();

    var path = Path();
    path.lineTo(0.0, size.height - 20);
    path.quadraticBezierTo(0.0, size.height, 20.0, size.height);
    path.lineTo(size.width - 20.0, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 50.0);
    path.quadraticBezierTo(size.width, 30.0, size.width - 20.0, 30.0);
    path.lineTo(20.0, 5.0);
    path.quadraticBezierTo(0.0, 0.0, 0.0, 20.0);
    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}
