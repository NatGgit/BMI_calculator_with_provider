import 'package:bmi_calculator/widgets/round_button.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class Meter extends StatefulWidget {
  final String title;
  final int value;
  final Function onTapPlus;
  final Function onTapMinus;

  const Meter({
    Key key,
    @required this.title,
    @required this.value,
    @required this.onTapMinus,
    @required this.onTapPlus,
  }) : super(key: key);

  @override
  State<Meter> createState() => MeterState();
}

class MeterState extends State<Meter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: kLabelStyle,
        ),
        Text(
          widget.value.toString(),
          style: kNumbersStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
              icon: Icons.remove,
              onTap: widget.onTapMinus,
            ),
            const SizedBox(
              width: 10,
            ),
            RoundButton(
              icon: Icons.add,
              onTap: widget.onTapPlus,
            ),
          ],
        ),
      ],
    );
  }
}
