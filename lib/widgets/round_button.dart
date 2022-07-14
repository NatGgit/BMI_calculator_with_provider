import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  const RoundButton({Key key, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      fillColor: kButtonColor,
      padding: EdgeInsets.all(8),
      shape: CircleBorder(),
      constraints: const BoxConstraints(minWidth: 36.0, minHeight: 36.0),
      child: Icon(
        icon,
        size: 25,
      ),
    );
  }
}
