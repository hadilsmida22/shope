import 'package:http/http.dart' as http; 
import 'dart:convert';
import 'dart:async';

import '../model_api/Cartes.dart';

class CartesService {

    static const port = '192.168.1.5';

  static const baseUrl = "http://$port:3000/api";

   static Future<Cartes> ajouterCarteFidelite(Cartes carte,String adresse) async {
    final response = await http.post(
      Uri.parse('$baseUrl/carte/$adresse'),
       headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'numero' : carte.numero,
        'nom' : carte.nom,
      }),
      
    );
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      return Cartes.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Impossible d\'ajouter la carte.');
    }
  }
  Future<Cartes> trouverCarteParId(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/carte/$id'));
    if (response.statusCode == 200) {
      return Cartes.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Impossible de trouver la carte avec l\'id $id');
    }
  }
  Future<Cartes> trouverCarteParNumero(String numero) async {
    final response = await http.get(Uri.parse('$baseUrl/carte/$numero'));
    if (response.statusCode == 200) {
      return Cartes.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Impossible de trouver la carte avec le numéro $numero');
    }
  }

  Future<List<Cartes>> fetchAll() async {
    final response = await http.get(
      Uri.parse('$baseUrl/carte')
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => Cartes.fromJson(json)).toList();
    } else {
      throw Exception('Impossible de récupérer la liste des cartes.');
    }
  }

 

  Future<http.Response> supprimerCarte(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/carte/$id'));
    if (response.statusCode == 204) {
      return response;
    } else {
      throw Exception('Impossible de supprimer la carte avec l\'id $id');
    }
  }
}







/*
//get par id 
Futur<Cartes?>fetchAcheter(
   int? idCart ,
) async {
  try {
    var reponse = await http.get (
     Uri.parse ("http://localhost:3000/api/acheter/17/$idAchete"),
     headers:<String , String> {
     'Content-Type': 'application/json',
     'charset': 'UTF-8',
     },  
    );
    final result = json.decode(response.body);
    return Cartes.fromJson (result);
  } catch (e) {
    print ("error is : " + e.toString());
  }
}*/