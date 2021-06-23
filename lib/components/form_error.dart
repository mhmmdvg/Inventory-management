import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(errors.length, (index) => errorFormText(error: errors[index], size: size))
    );
  }

  Row errorFormText({String error, Size size}) {
    return Row(
        children: <Widget>[
          SvgPicture.asset("assets/icons/Error.svg",
          height: size.height / 50,
          width: size.width / 50,
          ),
          SizedBox(width: size.width / 50),
          Text(errors[0], style: TextStyle(color: kTextColor2),),
        ],
      );
  }
}