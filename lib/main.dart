import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_view/temp/list_of_companies.dart';
import 'LocationHelper.dart';
import 'constants.dart';
import 'screens/map_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        canvasColor: Colors.transparent,
      ),
      // initialRoute: '/',
      // routes: {
      //   "/": (_) => MyApp(),
      //   "/search": (_) => CustomSearchScaffold(),
      // },

      home: MyMapView(),
    );
  }
}

