class persona {
  String nom;
  String cognoms;
  String email;
  DateTime edat;
  DateTime fechaOriginal = DateTime.now();

  // Constructor principal de la classe
  persona({
    required this.nom,
    required this.cognoms,
    required this.email,
    required this.edat,
  });

  // Constructor de fàbrica amb valors per defecte
  factory persona.defaults() {
    final ara = DateTime.now();

    return persona(
      nom: "Nom",
      cognoms: "Cognoms",
      email: "email@example.com",
      // Retallem la data pasant només any, mes i dia
      edat: DateTime(ara.year, ara.month, ara.day),
    );
  }

  String get getNom => nom;
  set setNom(String nom) => this.nom = nom;
  String get getCognoms => cognoms;
  set setCognoms(String cognoms) => this.cognoms = cognoms;
  String get getEmail => email;
  set setEmail(String email) => this.email = email;
  DateTime get getEdat => edat;
  set setEdat(DateTime edat) => this.edat = edat;
  String get getEdatFormatejada => '${edat.day}/${edat.month}/${edat.year}';

  @override
  String toString() {
    return 'Persona(nom: $nom, cognoms: $cognoms, email: $email, edat: $edat)';
  }
}
