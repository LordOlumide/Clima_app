import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
  color: Colors.white,
);

InputDecorationTheme kInputDecorationDefaultTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  border: InputBorder.none,
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
  iconColor: Colors.white,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
