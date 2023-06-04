import 'package:ecommerce_int2/model_api/categories.dart';
import 'package:flutter/material.dart'; // ou tout autre import nécessaire pour votre application
import 'package:http/http.dart' as http; // pour effectuer des requêtes HTTP
import 'dart:convert'; // pour convertir les données JSON

class Rayons {
  int idR;
  String nomR;
  //late List<Categories> cat;

  Rayons({
    required this.idR,
    required this.nomR,
    //required this.cat,
  });

  factory Rayons.fromJson(Map<String, dynamic> json) {
    //List<dynamic> categoriesJson = json['cat'];
    //List<Categories> categories = categoriesJson.map((cat) => Categories.fromJson(cat)).toList();

    return Rayons(
      idR: json['idR'],
      nomR: json['nomR'],
      //cat: categories,
    );
  }

  Map<String, dynamic> toJson() {
    //List<Map<String, dynamic>> categoriesJson = cat.map((cat) => cat.toJson()).toList();
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idR'] = idR;
    data['nomR'] = nomR;
    return data;
    
  }
}  
