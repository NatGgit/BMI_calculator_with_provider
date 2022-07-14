import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/big_pink_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data_provider.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 15,
              ),
              child: Text(
                'Your Result',
                style: kSuperBigStyle,
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.read<DataProvider>().getBMIinterpretation(),
                        style: kGreenStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        context.read<DataProvider>().bmi.toStringAsFixed(2),
                        style: kSuperSuperBigStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Whatever the result is, your weight is just fine',
                        style: kRegularTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BigPinkButton(
              onTap: (() {
                Navigator.pop(context);
              }),
              title: 'RE-CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}
