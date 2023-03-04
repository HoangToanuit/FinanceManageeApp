
import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  TextOverflow overflow;
  final FontWeight fontWeight;
 BigText({super.key, this.color =const Color.fromARGB(255,224,223,223),  required this.text,  this.size=0, this.overflow=TextOverflow.ellipsis,this.fontWeight=FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontFamily:'Roboto',
        fontWeight: fontWeight==FontWeight.w400?FontWeight.normal:fontWeight,
        fontSize: size==0?20:size,
        color: color
    )
    );
  }
}