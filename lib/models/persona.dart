class Persona {
  String? nom;
  String? cognoms;
  String? email;
  DateTime? edat;
  DateTime fechaOriginal = DateTime.now();

  // Constructor principal
  Persona({this.nom, this.cognoms, this.email, this.edat});

  // Constructor de fábrica amb valores per defecte
  factory Persona.defaults() {
    final ara = DateTime.now();
    return Persona(
      nom: "Nom",
      cognoms: "Cognoms",
      email: "email@example.com",
      edat: DateTime(ara.year, ara.month, ara.day),
    );
  }

  // Getters y Setters
  String? get getNom => nom;
  set setNom(String? nom) => this.nom = nom;

  String? get getCognoms => cognoms;
  set setCognoms(String? cognoms) => this.cognoms = cognoms;

  String? get getEmail => email;
  set setEmail(String? email) => this.email = email;

  DateTime? get getEdat => edat;
  set setEdat(DateTime? edat) => this.edat = edat;

  // Format de data segur per valors nuls
  String get getEdatFormatejada =>
      edat != null ? '${edat!.day}/${edat!.month}/${edat!.year}' : '';

  @override
  String toString() {
    return 'Persona(nom: $nom, cognoms: $cognoms, email: $email, edat: $edat)';
  }
}
