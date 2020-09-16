import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const api_key = 'AIzaSyCY_zby2fPlPi0770ZV3nuq3KwkbT5hCtA';

final customTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  accentColor: Colors.redAccent,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.00)),
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 12.50,
      horizontal: 10.00,
    ),
  ),
);

// final kTextFieldDecoration = InputDecoration(
//     border: InputBorder.none,
//     hintText: 'Enter a search term',
//     prefixIcon: Icon(FontAwesomeIcons.search),
//   enabledBorder: OutlineInputBorder(
//     borderSide: BorderSide(
//       color: Colors.blueAccent,
//     ),
//     borderRadius: BorderRadius.circular(10.0),
//   ),
// );

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.black,
  prefixIcon: Icon(
    FontAwesomeIcons.search,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.white,
  ),
  focusColor: Colors.greenAccent,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);