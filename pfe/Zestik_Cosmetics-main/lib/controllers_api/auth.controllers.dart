import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class AuthService {
  static const baseUrl = "http://192.168.43.246/api"; // mettre votre URL de serveur ici
  static const Map<String, String> headers = {'Content-Type': 'application/json'};
  final _prefs = SharedPreferences.getInstance();

Future<String?> login(String email, String password) async {
  final response = await http.post(
    Uri.parse('$baseUrl/auth/login'),
    body: jsonEncode({
      'email': email,
      'password': password
    }),
    headers: {"Content-Type": "application/json"}
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final accessToken = responseData['access_token'];
    final prefs = await _prefs;
    await prefs.setString('access_token', accessToken);
    return accessToken;
  } else {
    throw Exception('Failed to login');
  }
}


  Future<void> logout(String token) async {
    final url = Uri.parse('$baseUrl/auth/logout');
    final headersWithToken = {...headers, 'Authorization': 'Bearer $token'};
    final response = await http.post(url, headers: headersWithToken);
    if (response.statusCode == 200) {
      // déconnexion réussie
    } else {
      throw Exception('Failed to logout');
    }
  }
}
