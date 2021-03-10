class Volontaire {
  String nom;
  String prenom;
  String lieuDeNaissance;
  DateTime dateDeNaissance;
  String adresse;
  String numeroCIN;
  String telephone;
  String email;
  bool etat;
  String referenceVolontaire;

  Volontaire(
      {this.nom,
      this.prenom,
      this.dateDeNaissance,
      this.lieuDeNaissance,
      this.adresse,
      this.numeroCIN,
      this.telephone,
      this.email,
      this.etat,
      this.referenceVolontaire});
}
