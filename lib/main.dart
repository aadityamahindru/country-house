import 'package:countryhouse/Screens/CountryMap.dart';
import 'package:flutter/material.dart';
import 'Screens/AllCountries.dart';

void main() {
  runApp(new MaterialApp(
    home:new AllCountries(),
    routes: {
    "/country-map":(ctx)=>CountryMap(),
    },
  ));
}


