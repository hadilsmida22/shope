import 'package:ecommerce_int2/model_api/liste.dart';
import 'package:ecommerce_int2/model_api/produits.dart';
//import 'package:flutter/material.dart'; // ou tout autre import nécessaire pour votre application
//import 'package:http/http.dart' as http; // pour effectuer des requêtes HTTP
//import 'dart:convert'; // pour convertir les données JSON

import 'package:flutter/material.dart'; // ou tout autre import nécessaire pour votre application
import 'package:http/http.dart' as http; // pour effectuer des requêtes HTTP
import 'dart:convert';
import'liste.dart';
import 'produits.dart';
 // pour convertir les données JSON
class Acheters {
  int? idAchete;
  bool? acheterNonAcheter;
  Produits? produit;
  //Listes? liste;
  int? quantite;
  Acheters({
    this.idAchete,
    this.acheterNonAcheter,
    this.produit,
    //this.liste,
    this.quantite,
  });

  Acheters.fromJson(Map<String, dynamic> json) {
    idAchete = json['idAchete'];
    acheterNonAcheter = json['acheterNonAcheter'];
    quantite = json['quantite'];
    produit =
        json['produit'] != null ? new Produits.fromJson(json['produit']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idAchete'] = this.idAchete;
    data['acheterNonAcheter'] = this.acheterNonAcheter;
    if (this.produit != null) {
      data['produit'] = this.produit!.toJson();
    }
    data['quantite'] = this.quantite;
    return data;
  }
}

 
  
