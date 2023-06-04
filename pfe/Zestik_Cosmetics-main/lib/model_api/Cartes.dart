import 'package:flutter/material.dart'; // ou tout autre import nécessaire pour votre application
import 'package:http/http.dart' as http; // pour effectuer des requêtes HTTP
import 'dart:convert'; // pour convertir les données JSON
import 'Enseignes.dart';
import 'user.dart';
class Cartes {
  int? idCart;
  String? numero;
  String? nom;
 // User? inter;
  Enseignes? enseigne;


Cartes(
  {this.idCart ,
  this.numero,
  this.nom,
  //this.inter,
 this.enseigne,
  });

Cartes.fromJson(Map<String, dynamic> json) {
    idCart = json['idCart'];
    numero = json['numero'];
    nom = json['nom'];
    enseigne = json['enseigne'] != null
        ? new Enseignes.fromJson(json['enseigne'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCart'] = this.idCart;
    data['numero'] = this.numero;
    data['nom'] = this.nom;
    if (this.enseigne != null) {
      data['enseigne'] = this.enseigne!.toJson();
    }
    return data;
  }
}