import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int  LeftDiceNumber = 1;
  int RightDiceNumber = 1;
  void ChangeDiceFace()
  {
    setState((){
      LeftDiceNumber = Random().nextInt(6)+1;
      RightDiceNumber = Random().nextInt(6)+1;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child : Row(
        children: [
          Expanded(

            child : FlatButton(
              onPressed: (){
                ChangeDiceFace();
              },
              child :Image.asset('images/dice$LeftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton (
              onPressed: (){
                ChangeDiceFace();
              },
              child : Image.asset('images/dice$RightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
  }
