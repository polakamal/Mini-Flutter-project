import 'package:flutter/material.dart';
import 'file:///E:/flutter/flutter/bmi-calculator-flutter/lib/Constants.dart';
class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTape;
  BottomButton({@required this.buttonTitle,@required this.onTape});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTape,
      child: Container(
        child: Center(child: Text(buttonTitle,style: KlargeButtonTextStyle,)),
        padding: EdgeInsets.only(bottom: 20.0),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}