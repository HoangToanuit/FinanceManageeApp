import 'package:flutter/widgets.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  double height;
  double size;
  final FontWeight fontWeight;
  SmallText({super.key, this.color=const Color.fromARGB(255,224,223,223), required this.text, this.size=12,this.fontWeight=FontWeight.normal ,this.height=1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily:'Roboto',
        fontSize: size,
        fontWeight: fontWeight==FontWeight.w400?FontWeight.normal:fontWeight,
        color: color,
        height:height,
    )
    );
  }
}