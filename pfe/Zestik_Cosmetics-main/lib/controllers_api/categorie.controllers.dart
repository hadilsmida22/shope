import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model_api/categories.dart';
import '../model_api/produits.dart';

class CategorieService {

                static const port = '192.168.1.5';

  final String _baseUrl = 'http://$port:3000/api/categorie';

  Future<Categories> addProduitToCategorie(int categorieId, int produitId) async {
  final String url = "$_baseUrl/$categorieId/produits/$produitId";

  final response = await http.post(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return Categories.fromJson(jsonData);
  } else {
    throw Exception("Failed to add produit to categorie");
  }
}
Future<Categories> getCategory(int id) async {
  final response = await http.get(Uri.parse('$_baseUrl/$id'));
  if (response.statusCode == 200) {
    return Categories.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load category');
  }
}
 Future<List<Categories>> findAll() async {
    final response = await http.get(Uri.parse('$_baseUrl'));
    if (response.statusCode == 200) {
      final categoriesJson = jsonDecode(response.body) as List;
      return categoriesJson.map((json) => Categories.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
  Future<http.Response> createCategorie(Categories newcat) async {
  final url = '$_baseUrl/newcategorie';
  final response = await http.post(Uri.parse(url), body: newcat.toJson());
  return response;
}
  Future<Categories> updateCategorie(int id, Categories categorie) async {
  final response = await http.patch(
    Uri.parse('$_baseUrl/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(categorie),
  );

  if (response.statusCode == 200) {
    return Categories.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to update categorie.');
  }
}
 Future<http.Response> deleteCategorie(int idCat) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$idCat'));
    if (response.statusCode == 204) {
      return response;
    } else {
      throw Exception('Impossible de supprimer la carte avec l\'id $idCat');
    }
  }
  // @Get('/:id/produits')
 Future<List<Produits>> getProduitsByCategorie(int categorieId) async {
    final response = await http.get(Uri.parse('$_baseUrl/$categorieId/produits'));
    if (response.statusCode == 200) {
     final List jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((json) => Produits.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load produits by categorie.');
    }
  }

}