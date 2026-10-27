import 'package:flutter/material.dart';
import 'package:flutter_application_practica2/screens/home_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/home': (context) => HomeScreen(),
    //'/personal': (context) => PersonalScreen(),
    //'/widget': (context) => WidgetScreen(),
  };
}
