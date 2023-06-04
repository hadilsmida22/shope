import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model_api/liste.dart';
import '../model_api/produits.dart';


class ListService {

    static const port = '192.168.1.5';

  final String _baseUrl = 'http://$port:3000/api/liste';
Future<Listes> ajouterListe(Listes listeDto,String adresse) async {
  final response = await http.post(
    Uri.parse('$_baseUrl/$adresse'), // Ajoutez l'adresse IP à l'URL
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(listeDto.toJson()),
  );

  if (response.statusCode == 200) {
    return Listes.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to add list.');
  }
}



  Future<void> addProduitToListe(int idProduit, int quantite) async {
  final response = await http.post(
    Uri.parse('$_baseUrl/produit/$idProduit'),
     
    body: jsonEncode({'quantite': quantite}),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to add product to list.');
  }
 }

  Future<void> terminerListe(int id) async {
    final response = await http.put(Uri.parse('$_baseUrl/$id/terminer'));
    if (response.statusCode != 200) {
      throw Exception('Failed to terminer liste.');
    }
  }

  Future<void> acheterProduit(int listeId, int achatId) async {
    final response = await http.put(Uri.parse('$_baseUrl/$listeId/achats/$achatId/acheter'));
    if (response.statusCode != 200) {
      throw Exception('Failed to acheter produit.');
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete liste.');
    }
  }

  Future<void> changerEtatListe(int id) async {
    final response = await http.post(Uri.parse('$_baseUrl/$id/effectuer'));
    if (response.statusCode != 200) {
      throw Exception('Failed to changer etat liste.');
    }
  }

  Future<List<Produits>> getTop3Produits() async {
    final response = await http.get(Uri.parse('$_baseUrl/effectuer/top3Produits'));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((json) => Produits.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get top 3 produits.');
    }
  }

  Future<List<Listes>> getListById(int id) async {
  final url = Uri.parse('$_baseUrl/$id');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => Listes.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load list');
  }
 }

 Future<List<Listes>> findListesWithProduits() async {
  final response = await http.get(Uri.parse('$_baseUrl/produits/tous'));
  
  if (response.statusCode == 200) {
    final List jsonResponse = json.decode(response.body);
    return jsonResponse.map((json) => Listes.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Listes');
  }
  }
  
  Future<List<Listes>> getLists() async {
    final response = await http.get(Uri.parse('$_baseUrl/meslistes/desc'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => Listes.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load rayons');
    }
  }

  Future<List<String>> getListeProduitsDerniereListe() async {
  final response = await http.get(Uri.parse('$_baseUrl/lastListe/produits'));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<String> result = data.map((produit) => produit.toString()).toList();
    return result;
  } else {
    throw Exception('Failed to load products list');
  }
 }

 Future<List<String>> getProduitsList(int idListe) async {
  final response = await http.get(Uri.parse('$_baseUrl/$idListe/produits'));
  if (response.statusCode == 200) {
    List data = jsonDecode(response.body)['data'];
    for(var element in data){ print('[$element]');}
    List<String> result = data.map((produit) => produit.toString()).toList();
    return result;
  } else {
    throw Exception('Failed to load produits');
  }
 }

 Future<void> removeProduitFromListe(int idListe, int idProduit) async {
  final response = await http.delete(
    Uri.parse('$_baseUrl/$idListe/produit/$idProduit'),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to remove product from list.');
  }
  }

  Future<List<Listes>> findListesWithProduits_id(int idListe) async {
  final response = await http.get(Uri.parse('$_baseUrl/$idListe/idListe/details'));
  
  if (response.statusCode == 200) {
    final List jsonResponse = json.decode(response.body);
    return jsonResponse.map((json) => Listes.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Listes');
  }
  }
  
  Future<Listes> creerListeSugg(Listes listeDto) async {
  final response = await http.post(Uri.parse('$_baseUrl/new/listeSugge'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(listeDto.toJson()));

  if (response.statusCode == 200) {
    return Listes.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to add list.');
  }
  }
}