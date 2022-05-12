import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:clima/utilities/constants.dart';

void main() => runApp(MyApp());

// TODO: Add forcast feature

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        inputDecorationTheme: kInputDecorationDefaultTheme,
      ),
      home: LoadingScreen(),
    );
  }
}
