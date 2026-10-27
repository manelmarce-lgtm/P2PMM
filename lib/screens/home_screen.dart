import 'package:flutter/material.dart';
import 'package:flutter_application_practica2/models/persona.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DevProfile M3'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _profileCard(),
    );
  }

  Widget _profileCard() {
    persona p1 = persona.defaults();
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Text(
            p1.getNom,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(
            p1.getCognoms,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          Text(
            p1.getEmail,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          Text(
            p1.getEdatFormatejada,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
