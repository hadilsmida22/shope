import 'package:flutter/material.dart'; // ou tout autre import nécessaire pour votre application
import 'package:http/http.dart' as http; // pour effectuer des requêtes HTTP
import 'dart:convert'; // pour convertir les données JSON

class Enseignes {
  int? idE;
  String? nomCommercial;
  String? catalogue;
  String? image;

Enseignes(
  {this.idE ,
  this.nomCommercial,
  this.catalogue,
  });

Enseignes.fromJson(Map<String ,dynamic> json){
  idE = json ['idE'];
  nomCommercial = json ['nomCommercial'];
  catalogue = json ['catalogue'];
  image = json ['image'];
}

Map<String ,dynamic> toJson(){
  final Map<String , dynamic> data = new Map <String , dynamic>();
  data ['idE']=this.idE;
  data ['nomCommercial']=this.nomCommercial;
  data ['catalogue']=this.catalogue;
  data ['image']=this.image;
   return data ;
}
}
 
  
