import 'package:flutter/material.dart';

class WidgetScreen extends StatelessWidget{
   const WidgetScreen({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Widget'),
      ), body:
      const Center(
        child: Text('Widget'),
      ),
    );
  }
  

  }