import 'package:flutter/material.dart'; // ou tout autre import nécessaire pour votre application
import 'package:http/http.dart' as http; // pour effectuer des requêtes HTTP
import 'dart:convert'; // pour convertir les données JSON

class Listesuggs {
  int? idListeSugg;

Listesuggs(
  {this.idListeSugg ,
  });

Listesuggs.fromJson(Map<String ,dynamic> json){
  idListeSugg = json ['idListeSugg'];
}

Map<String ,dynamic> toJson(){
  final Map<String , dynamic> data = new Map <String , dynamic>();
  data ['idListeSugg']=this.idListeSugg;        
  return data ;
}
}
 
  
