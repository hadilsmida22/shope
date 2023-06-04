import 'dart:async';
import 'dart:convert';
import 'package:ecommerce_int2/model_api/rayonsModel.dart';
import 'package:http/http.dart' as http;

class RayonService {

                static const port = '192.168.1.5';

  final String apiUrl = 'http://$port:3000/api';

  Future<Rayons> fetchRayon(int idR) async {
    final response = await http.get(Uri.parse('$apiUrl/rayon/$idR'));

    if (response.statusCode == 200) {
      return Rayons.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load rayon');
    }
  }

  Future<List<Rayons>> fetchAllRayons() async {
    final response = await http.get(Uri.parse('$apiUrl/rayon'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => Rayons.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load rayons');
    }
  }

  Future<void> createRayon(Rayons newrayon) async {
    final response = await http.post(
      Uri.parse('$apiUrl/rayon/newrayon'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newrayon.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create rayon.');
    }
  }

  Future<void> updateRayon(int idR, Rayons rayon) async {
    final response = await http.patch(
      Uri.parse('$apiUrl/rayon/$idR'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(rayon.toJson()),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update rayon.');
    }
  }

  Future<void> deleteRayon(int idR) async {
    final response = await http.delete(Uri.parse('$apiUrl/rayon/$idR'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete rayon.');
    }
  }
}