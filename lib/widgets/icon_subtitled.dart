import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class IconSubtitled extends StatelessWidget {
  final IconData icon;
  final String subtitle;

  const IconSubtitled({Key key, @required this.icon, @required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          size: 70,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subtitle,
          style: kLabelStyle,
        )
      ],
    );
  }
}
