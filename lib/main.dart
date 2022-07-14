import 'package:bmi_calculator/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvider>(
      create: (context) => DataProvider(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          appBarTheme: AppBarTheme(
            color: Color(0xFF0A0E21),
          ),
        ),
        home: InputPage(),
      ),
    );
  }
}

