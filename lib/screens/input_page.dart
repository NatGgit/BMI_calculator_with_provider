import 'package:bmi_calculator/data_provider.dart';
import 'package:bmi_calculator/widgets/big_pink_button.dart';
import 'package:bmi_calculator/widgets/meter.dart';
import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../widgets/icon_subtitled.dart';
import '../widgets/reusable_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height;

  @override
  void initState() {
    height = context.read<DataProvider>().height;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      color: context.watch<DataProvider>().gender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: IconSubtitled(
                        icon: FontAwesomeIcons.mars,
                        subtitle: 'MALE',
                      ),
                      onTap: () {
                        context.read<DataProvider>().setGender(Gender.male);
                      }),
                ),
                Expanded(
                  child: ReusableCard(
                    color: context.watch<DataProvider>().gender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: IconSubtitled(
                      icon: FontAwesomeIcons.venus,
                      subtitle: 'FEMALE',
                    ),
                    onTap: () {
                      context.read<DataProvider>().setGender(Gender.female);
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        context.watch<DataProvider>().height.toString(),
                        style: kNumbersStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: Theme.of(context).sliderTheme.copyWith(
                          thumbColor: kPink,
                          inactiveTrackColor: kGrey,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          overlayColor: kPink.withOpacity(0.29),
                          activeTrackColor: Colors.white,
                          trackHeight: 2,
                        ),
                    child: Slider(
                        min: kSliderMin,
                        max: kSliderMax,
                        value: context.watch<DataProvider>().height.toDouble(),
                        onChanged: (newHeight) {
                          context.read<DataProvider>().setHeight(newHeight);
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: Meter(
                      title: 'WEIGHT',
                      value: context.read<DataProvider>().weight,
                      onTapMinus: context.read<DataProvider>().decreaseWeight,
                      onTapPlus: context.read<DataProvider>().increaseWeight,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: Meter(
                      title: 'AGE',
                      value: context.read<DataProvider>().age,
                      onTapMinus: context.read<DataProvider>().decreaseAge,
                      onTapPlus: context.read<DataProvider>().increaseAge,
                    ),
                  ),
                )
              ],
            ),
          ),
          BigPinkButton(
            onTap: (() {
              context.read<DataProvider>().calculateBMI();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsScreen(),
                ),
              );
            }),
            title: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
