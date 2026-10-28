import 'package:flutter/material.dart';
import 'package:flutter_application_practica2/models/Persona.dart';
import 'package:flutter_application_practica2/screens/personal_screen.dart';
import 'package:flutter_application_practica2/screens/widget_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Persona persona;
  @override
  void initState() {
    super.initState();
    persona = Persona.defaults();
  }

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
        child: Column(children: [const SizedBox(height: 16), _profileCard()]),
      ),
    );
  }

  Widget _profileCard() {
    return Card(
      elevation: 20.0,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${persona.nom}",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${persona.cognoms}",
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${persona.email}",
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              persona.getEdatFormatejada,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                final Persona? personaEditada = await Navigator.push<Persona>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalScreen(persona: persona),
                  ),
                );
                // Si ens tornen una persona actualitzada, re-renderitzem la pantalla
                if (personaEditada != null) {
                  setState(() {
                    persona = personaEditada;
                  });
                }
              },
              child: const Text('Edita el teu perfil'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WidgetScreen()),
                );
              },
              child: const Text("Explora widgetPage"),
            ),
          ],
        ),
      ),
    );
  }
}