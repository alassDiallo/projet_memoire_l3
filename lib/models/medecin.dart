class Medecin {
  int idMedecin;
  String reference,
      nom,
      prenom,
      adresse,
      telephone,
      lieuDeNaissance,
      sexe,
      email,
      libelleSpecialite,
      structure,
      region;
  DateTime dateDeNaissance;
  int idSpecialite;

  Medecin(
      {this.nom,
      this.prenom,
      this.adresse,
      this.dateDeNaissance,
      this.email,
      this.idMedecin,
      this.idSpecialite,
      this.lieuDeNaissance,
      this.reference,
      this.sexe,
      this.libelleSpecialite,
      this.structure,
      this.region,
      this.telephone});
}
