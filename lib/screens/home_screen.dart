import 'package:flutter/material.dart';
import 'package:flutter_application_practica2/models/persona.dart';
import 'package:flutter_application_practica2/screens/personal_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DevProfile M3'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _profileCard(context),
      ),
    );
  }
  Widget _profileCard(BuildContext context) {
    persona p1 = persona.defaults();

    return Card(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              p1.nom,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              p1.cognoms,
              style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Text(
              p1.email,
              style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Text(
              p1.getEdatFormatejada,
              style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PersonalScreen()),
                );
              },
              child: const Text('Edita el teu perfil'),
            ),
          ],
        ),
      ),
    );
  }
}