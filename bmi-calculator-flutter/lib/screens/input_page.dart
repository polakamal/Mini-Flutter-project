import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'file:///E:/flutter/flutter/bmi-calculator-flutter/lib/Constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
enum Gender {male , female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
//     Color maleCardColor = inactiveCardColor;
//     Color  femaleCardColor = inactiveCardColor;
//    void updateColour(Gender gender)
//    {
//      if(gender == Gender.male)
//      {
//        if(maleCardColor == inactiveCardColor)
//        {
//          maleCardColor =activeCardColour;
//          femaleCardColor = inactiveCardColor;
//        }else
//          {
//            maleCardColor = inactiveCardColor;
//          }
//
//
//      }
//      if (gender == Gender.female) {
//        if(femaleCardColor == inactiveCardColor)
//        {
//          maleCardColor = inactiveCardColor;
//          femaleCardColor = activeCardColour;
//        }
//        else
//          {
//         femaleCardColor = inactiveCardColor;
//          }
//
//      }
//
//    }
Gender selectedGender;
int height=180;
int weight = 60;
int age = 20;
     @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column (
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(

           child :Row(
            children: [
             Expanded(
        child: ReusableCard(
                 colour: selectedGender ==Gender.male ? kActiveCardColour :kInactiveCardColor ,
               cardChild: IconContent(icon:FontAwesomeIcons.mars , label:"MALE" ) ,
               onPress: ()
               {
                 setState(() {
                   selectedGender = Gender.male;
                 });
               },
                 ),
               ),
              Expanded(
                child: ReusableCard(
                    colour: selectedGender == Gender.female ? kActiveCardColour :kInactiveCardColor,
                   cardChild: IconContent(icon:FontAwesomeIcons.venus ,label: "FEMALE") ,
                  onPress: ()
                  {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ),
            ]),
          ),

          Expanded(

            child:  ReusableCard(
                colour:kActiveCardColour,
               cardChild: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('HEIGHT',
                     style: kLabelTextStyle,

                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: [

                       Text(height.toString(),style: kNumberTextStyle,),
                       Text('cm',style: kLabelTextStyle,),
                     ],
                   ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0,),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      overlayShape:  RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFDD1555),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                       min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue)
                      {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                 ],
               ),
            ),

          ),
          Expanded(

            child :Row(
              children: [
                Expanded(child:  ReusableCard(
                    colour:kActiveCardColour,
                     cardChild: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("WEIGHT",style: kLabelTextStyle,),
                         Text(weight.toString(), style: kNumberTextStyle,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children:[
                             RoundIconButton(
                               icon: FontAwesomeIcons.minus,
                               onPressed: ()
                               {
                                 setState(() {
                                   weight--;
                                 });

                               },
                             ),
                             SizedBox(width: 10.0,),
                             RoundIconButton(
                               icon: FontAwesomeIcons.plus,
                               onPressed: ()
                               {
                                 setState(() {
                                   weight++;
                                 });

                               },
                             ),
                          ]
                         ),
                       ],
                     ),

                ),
                )
                ,
                Expanded(child:  ReusableCard(
                    colour:kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',style: kLabelTextStyle,),
                       Text(age.toString(),style: kNumberTextStyle,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: ()
                              {
                                setState(() {
                                  age--;
                                });

                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: ()
                              {
                                setState(() {
                                  age++;
                                });

                              },
                            ),
                          ]
                      ),
                    ],
                  ),
                ),
                )
              ],
            ),
          ),
       
        BottomButton(
          onTape: ()
          {
            CalculatorBrain calc = new CalculatorBrain(height:height ,weight:weight );

            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
              bmiResults:calc.calculateBMI() ,
              resultText: calc.getResults(),
              interpretation:calc.getInterpretation() ,
            )));
          },
          buttonTitle: 'CALCULATE',
        ),
        ],
      ),
    );
  }
}



