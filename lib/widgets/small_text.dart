import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  SmallText({Key? key,this.color=const Color(0xffa05f5f),
    required this.text,
    this.size=22,
    this.height=1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        //fontFamily: 'Roboto',
          color:color,
          fontSize: size,
        height: height,
      ),
    );
  }
}
