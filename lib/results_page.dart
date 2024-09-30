import 'package:bmi_calculator_flutter/constants.dart';
import 'package:bmi_calculator_flutter/reusable_card.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

class ResultsPage extends StatelessWidget {


  ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Center(
            child: Text(
              'BMI CALCULATOR',
              style: TextStyle(color: Colors.white),
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(onPress: () {
              return;
            },
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Normal',style: resultTextStyle,),
                Text('25.0',style: kBMITextStyle,),
                Text('You have a normal weight. Keep up the good work!'
                  ,style:kBodyTextStyle,textAlign: TextAlign.center,),
                BottomBootm(onTap: () {
                  Navigator.pop(context);
                },label: 'RE-CALCULATE',),
              ],
            ),
            )
          )
        ],
      ),
    );
  }
}
