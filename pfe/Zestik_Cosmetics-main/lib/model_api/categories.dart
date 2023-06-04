import 'package:flutter/material.dart'; // ou tout autre import nécessaire pour votre application
import 'package:http/http.dart' as http; // pour effectuer des requêtes HTTP
import 'dart:convert'; // pour convertir les données JSON
import 'rayonsModel.dart';
class Categories {
  int? idCat;
  String nomCat;
  Rayons? rayon;
  
Categories(
  {this.idCat ,
  required this.nomCat,
  this.rayon,
  
  });

factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      idCat: json['idCat'],
      nomCat: json['nomCat'],
      rayon: Rayons.fromJson(json['rayon']),
      
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCat'] = this.idCat;
    data['nomCat'] = this.nomCat;
    data['rayon'] = this.rayon?.toJson();
     return data;
  }
}