import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model_api/produits.dart';

class ProduitsService {

  static const port = '192.168.1.5';

  final String  baseUrl = 'http://$port:3000/api/produit';

  Future<Produits> findOne(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return Produits.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erreur lors de la récupération du Produits.');
    }
  }

  Future<List<Produits>> getByLibelle(String libelle) async {
    final response = await http.get(Uri.parse('$baseUrl/$libelle/nomP'));

    if (response.statusCode == 200) {
     final List jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((json) => Produits.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des Produitss.');
    }
  }

  Future<List<Produits>> fetchAllRayons() async {
  final response = await http.get(Uri.parse(baseUrl));

  if (response.statusCode == 200) {
    final List jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((json) => Produits.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load rayons');
  }
 }

  Future<void> create(Produits Produits) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(Produits),
    );

    if (response.statusCode != 201) {
      throw Exception('Erreur lors de la création du Produits.');
    }
  }

  Future<void> update(int id, Produits Produits) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(Produits),
    );

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la mise à jour du Produits.');
    }
  }

  Future<void> remove(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la suppression du Produits: ${response.statusCode}');
  }
  }
  Future<List<String>> getMarquesByLibelle(String libelle) async {
  final response = await http.get(Uri.parse('$baseUrl/$libelle/marques'));
  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body);
    return List<String>.from(parsed['marques']);
  } else {
    throw Exception('Erreur lors de la récupération des marques: ${response.statusCode}');
  }
  }
  Future<List<String>> getGrammagesByLibelle(String libelle) async {
  final response = await http.get(Uri.parse('$baseUrl/$libelle/grammages'));
  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body);
    return List<String>.from(parsed['grammages']);
  } else {
    throw Exception('Erreur lors de la récupération des grammages: ${response.statusCode}');
  }
  }
  

  Future<double> getLowestPriceByLibelle(String libelle) async {
  final response = await http.get(Uri.parse('$baseUrl/$libelle/bas-prix'));if (response.statusCode == 200) {
    return double.parse(response.body);
  } else {
    throw Exception('Erreur lors de la récupération du prix le plus bas: ${response.statusCode}');
  }
  }
  Future<List<Produits>> getProductsByLibelle(String libelle) async {
  final response = await http.get(Uri.parse('$baseUrl/$libelle/autre'));
  if (response.statusCode == 200) {
   final List jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((json) => Produits.fromJson(json)).toList();
  } else {
    throw Exception('Erreur lors de la récupération des Produitss: ${response.statusCode}');
  }
  }
}