import 'package:flutter/material.dart';
import 'package:worldtime_app/Pages/Home.dart';
import 'package:worldtime_app/Pages/choose location.dart';
import 'package:worldtime_app/Pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/location':(context)=>ChooseLocation(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

