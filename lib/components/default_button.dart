import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../constants.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    @required this.press, this.text,
  }) : super(key: key);

  final Function press;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height / 14,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          ),
        color: kPrimaryColor2,
        onPressed: press,
        child: AutoSizeText(
          text,
          style: TextStyle(
            fontSize: 16,
            color: kTextButtonColor,
          ),
        ),
      ),
    );
  }
}