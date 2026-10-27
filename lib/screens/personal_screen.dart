import 'package:flutter/material.dart';
class PersonalScreen extends StatelessWidget {
    const PersonalScreen({super.key});
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editor del Perfil'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0)
      ),
    );
  }
}