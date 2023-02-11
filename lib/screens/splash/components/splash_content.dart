// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.keyText,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image, keyText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: (30), bottom: (20))),
        Image.asset(
          // margin top
          image!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        Padding(padding: EdgeInsets.only(top: (10))),
        Text(
          keyText!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: (30),
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: (15),
            color: Color.fromARGB(255, 151, 151, 151),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
