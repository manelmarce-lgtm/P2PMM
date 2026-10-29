import 'package:flutter/material.dart';
import 'package:flutter_application_practica2/models/Persona.dart';

class PersonalScreen extends StatefulWidget {
  final Persona? persona;

  const PersonalScreen({super.key, this.persona});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final _formKey = GlobalKey<FormState>();

  String _nom = '';
  String _cognoms = '';
  String _email = '';
  String _password = '';
  DateTime? _edat;

  final TextEditingController _edatController = TextEditingController();

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  void _seleccionarFecha(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _edat ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _edat = picked;
        _edatController.text = _formatDate(picked);
      });
    }
  }

  @override
  void dispose() {
    _edatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Requisit AppBar: Títol amb el primer cognom de l'estudiant
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 1. First Name (Amb majúscula automàtica)
              TextFormField(
                initialValue: _nom,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  hintText: 'Introdueix el teu nom',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El nom és obligatori';
                  }
                  return null;
                },
                onSaved: (value) => _nom = value!.trim(),
              ),
              const SizedBox(height: 12),

              // 2. Last Name
              TextFormField(
                initialValue: _cognoms,
                decoration: const InputDecoration(
                  labelText: 'Cognoms',
                  hintText: 'Introdueix els teus cognoms',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El cognom és obligatori';
                  }
                  return null;
                },
                onSaved: (value) => _cognoms = value!.trim(),
              ),
              const SizedBox(height: 12),

              // 3. Email Address (Teclat configurat per a email)
              TextFormField(
                initialValue: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Introdueix el teu email',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El email és obligatori';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!.trim(),
              ),
              const SizedBox(height: 12),

              // 4. Password (Text ocult)
              TextFormField(
                initialValue: _password,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contrasenya',
                  hintText: 'Crea una contrasenya',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La contrasenya no pot estar buida';
                  }
                  if (value.length < 6) {
                    return 'La contrasenya ha de tenir almenys 6 caràcters';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              const SizedBox(height: 12),

              // 5. Date of Birth (Lectura només + Picker al fer tap)
              TextFormField(
                controller: _edatController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Edat',
                  hintText: 'Selecciona la teva edat',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _seleccionarFecha(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La edat és obligatoria';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    final personaEditada = Persona(
                      nom: _nom,
                      cognoms: _cognoms,
                      email: _email,
                      edat: _edat!,
                    );

                    Navigator.pop(context, personaEditada);
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}