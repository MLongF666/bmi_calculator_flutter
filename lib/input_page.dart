import 'package:bmi_calculator_flutter/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = kInactiveCardColor;
  // Color femaleCardColor = kInactiveCardColor;
  Gender selectedGender = Gender.male;
  int height = 160;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: const Center(
              child: Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(children: <Widget>[
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                color: selectedGender == Gender.male
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild: IconContent(
                  label: 'MALE',
                  icon: Icon(
                    FontAwesomeIcons.mars,
                    color: selectedGender == Gender.male
                        ? kLabelTextSelectColor
                        : kLabelTextDefaultColor,
                    size: 80,
                  ),
                ),
              )),
              Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        label: 'FEMALE',
                        icon: Icon(
                          FontAwesomeIcons.venus,
                          color: selectedGender == Gender.female
                              ? kLabelTextSelectColor
                              : kLabelTextDefaultColor,
                          size: 80,
                        ),
                      )))
            ])),
            Expanded(
                child: ReusableCard(
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: buildSlideThemeCopyWith(context),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 240.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus)
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      return;
                    },
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                )
                              ])
                        ]),
                  ))
                ])),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 10),
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
            ),
          ],
        ));
  }

  SliderThemeData buildSlideThemeCopyWith(BuildContext context) {
    return SliderTheme.of(context).copyWith(
      inactiveTrackColor: Color(0xFF8D8E98),
      activeTrackColor: Colors.white,
      overlayColor: Color(0x29EB1555),
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
      thumbColor: Color(0xFFEB1555),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {required this.onPressed, this.icon = Icons.construction});
  final Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      disabledElevation: 6.0,
      elevation: 16.0,
      constraints: BoxConstraints.tightFor(
        width: 70.0,
        height: 70.0,
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
