import 'package:flutter/material.dart';
import 'package:flutter_application_practica2/models/Persona.dart';

class PersonalScreen extends StatefulWidget {
  // 1. Declarar la variable final
  final Persona? persona;

 
  const PersonalScreen({super.key, this.persona});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  // A les classes de tipus State pots accedir a les dades passades
  // utilitzant: widget.persona
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: Center(
        child: Text('Editant a nen: ${widget.persona?.nom}'),
      ),
    );
  }
}