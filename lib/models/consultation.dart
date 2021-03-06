import 'package:flutter/material.dart';

class Consultation {
  String nom;
  double prix;
  String image;
  String nomDocteur;

  Consultation({this.nom, this.prix, this.image, this.nomDocteur});
}

List<Consultation> list = [
  Consultation(
      nom: "ophtalmologie",
      prix: 5000.00,
      image: "images/ophtalmologie.png",
      nomDocteur: "Assane Diallo"),
  Consultation(
      nom: "Pneumologie",
      prix: 5000.00,
      image: "images/poumon.png",
      nomDocteur: "Bassirou Dabo"),
  Consultation(
      nom: "Neurologie",
      prix: 5000.00,
      image: "images/neurologie.png",
      nomDocteur: "Makhan traore"),
  Consultation(
      nom: "Gynecologie",
      prix: 5000.00,
      image: "images/genecologie.png",
      nomDocteur: "Fatou Mbaye"),
  Consultation(
      nom: "radiologie",
      prix: 5000.00,
      image: "images/radiotherapie.jpg",
      nomDocteur: "Assane Diallo"),
  Consultation(
      nom: "infectiologie",
      prix: 5000.00,
      image: "images/infectiologie.png",
      nomDocteur: "Bassirou Dabo"),
  Consultation(
      nom: "Dentiste",
      prix: 5000.00,
      image: "images/dent.png",
      nomDocteur: "Makhan traore"),
  // Consultation(
  //     nom: "ophtalmologie",
  //     prix: 1500.00,
  //     image: "images/ophtalmologie.png",
  //     nomDocteur: "Assane Diallo"),
  // Consultation(
  //     nom: "Pneumolgie",
  //     prix: 5000.00,
  //     image: "images/pneumologie.jpeg",
  //     nomDocteur: "Bassirou Dabo"),
  Consultation(
      nom: "Cardiologie",
      prix: 5000.00,
      image: "images/cardio.png",
      nomDocteur: "Assane Diallo"),
];
