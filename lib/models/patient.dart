class Patient {
  int idPatient;
  String reference;
  String nom;
  String prenom;
  String lieuDeNaissance;
  String adresse;
  String telephone;
  String email;
  String numeroCIN;
  DateTime dateDeNaissance;
  String sexe;
  bool etat;
  String heure;
  String date;

  Patient(
      {this.adresse,
      this.dateDeNaissance,
      this.email,
      this.etat,
      this.idPatient,
      this.lieuDeNaissance,
      this.nom,
      this.numeroCIN,
      this.prenom,
      this.reference,
      this.sexe,
      this.date,
      this.heure,
      this.telephone});
}
