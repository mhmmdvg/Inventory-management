import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class IndicatorWidget extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String iconPath;

  IndicatorWidget({this.color, this.title, this.subtitle, this.iconPath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(width: 25,),
        SvgPicture.asset(
          iconPath,
          height: size.height / 35,
          color: color,
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.black.withOpacity(0.40),
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        )
      ],
    );
  }
}