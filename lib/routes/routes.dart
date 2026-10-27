import 'package:flutter/material.dart';
import 'package:flutter_application_practica2/screens/home_screen.dart';
import 'package:flutter_application_practica2/screens/personal_screen.dart';
import 'package:flutter_application_practica2/models/Persona.dart';


Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/home': (context) => HomeScreen(),'/personal': (context) => PersonalScreen(persona: Persona()),
    //'/widget': (context) => WidgetScreen(),
  };
}
