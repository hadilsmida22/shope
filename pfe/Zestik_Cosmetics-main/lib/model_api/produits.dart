import 'package:flutter/material.dart'; // ou tout autre import nécessaire pour votre application
import 'package:http/http.dart' as http; // pour effectuer des requêtes HTTP
import 'dart:convert'; // pour convertir les données JSON

class Produits {
  int? idP;
  String? marque;
  String? libelle;
  String? grammage;
  String? prixPdt;
  String? nomMagasin;
  String? image;

  Produits({
    this.idP,
    this.marque,
    this.libelle,
    this.grammage,
     this.prixPdt,
     this.nomMagasin,
     this.image,
  });
  
  factory Produits.fromJson(Map<String, dynamic> json) {
    return Produits(
      idP: json['idP'],
      marque: json['marque'],
      libelle: json['libelle'],
      grammage: json['grammage'],
      prixPdt: json['prixPdt'],
      nomMagasin: json['nomMagasin'],
      image: json['image'],
    );
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idP'] = this.idP;
    data['marque'] = this.marque;
    data['libelle'] = this.libelle;
    data['grammage'] = this.grammage;
    data['prixPdt'] = this.prixPdt;
    data['nomMagasin'] = this.nomMagasin;
    data['image'] = this.image;
    return data;
  }
}