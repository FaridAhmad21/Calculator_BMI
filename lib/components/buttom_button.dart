import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ButtomButton extends StatelessWidget {

  final VoidCallback onTap;
  final String buttonTitle;

  ButtomButton({ required this.onTap, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttonTitle,
            style: kLargeButtontextStyle,
          ),
        ),
        color: kBottomContainerColor ,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomCotainerHeight,
      ),
    );
  }
}