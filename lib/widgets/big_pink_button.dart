import 'package:flutter/material.dart';

import '../constants.dart';

class BigPinkButton extends StatelessWidget {
  final Function onTap;
  final String title;

  const BigPinkButton({Key key, @required this.onTap, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kPink,
        margin: EdgeInsets.only(top: 10),
        height: kBottomBarHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: kBigButtonStyle,
          ),
        ),
      ),
    );
  }
}
