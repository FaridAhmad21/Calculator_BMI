import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_Content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import '../components/buttom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 100;
  int weight = 60;
  int age = 22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                onPress: (){
                  setState((){
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: 'MALE',),),),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState((){
                    selectedGender = Gender.female;
                  });
                },
                  colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                  cardChild: IconContent(
                icon: FontAwesomeIcons.venus,
                label: 'FEMALE',
              )),
              ),
            ],
          )),
          Expanded(child: ReusableCard(colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT',style: kLabeltextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumbertextStyle,
                    ),
                    Text('cm',
                      style: kLabeltextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 220.0,

                      onChanged: (double newValue){
                        setState((){
                          height = newValue.round();
                        });
                        // setState((){});
                      }
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',
                        style: kLabeltextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumbertextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: (){
                              setState((){
                                weight++;
                              });
                            },
                          ),
                          SizedBox(width: 10.0,),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onpressed: (){
                              setState((){
                                weight--;
                              });
                            },
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',
                        style: kLabeltextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumbertextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: (){
                              setState((){
                                age++;
                              });
                            },
                          ),
                          SizedBox(width: 10.0,),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onpressed: (){
                              setState((){
                                age--;
                              });
                            },
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          )),
          ButtomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  )));
            },
          ),

        ],
      ),
    );
  }
}






