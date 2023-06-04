import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model_api/user.dart';

class UserService {

  static const port = '192.168.1.5';

  static const baseUrl = 'http://$port:3000/api/user';

  static Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': user.email,
        'password': user.password,
        'adresseIP':user.adresseIP,
      }),
    );
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200||response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user.');
    }
  }

  static Future<List<User>> getAllUsers() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['users'];
      return data.map((userJson) => User.fromJson(userJson)).toList();
    } else {
      throw Exception('Failed to get users.');
    }
  }

  static Future<User> getUserByEmail(String email) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$email'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body)['user']);
    } else {
      throw Exception('Failed to get user.');
    }
  }

  static Future<void> updateUser(int id, User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': user.email,
        'password': user.password,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user.');
    }
  }

  static Future<void> deleteUser(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user.');
    }
  }

  static Future<void> addCategorieToRayon(int rayonId, int categorieId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$rayonId/categorie/$categorieId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add categorie to rayon.');
    }
  }

  static Future<List<dynamic>> getCategoriesOfRayon(int rayonId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$rayonId/categories'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['categories'];
    } else {
      throw Exception('Failed to get categories of rayon.');
    }
  }
}