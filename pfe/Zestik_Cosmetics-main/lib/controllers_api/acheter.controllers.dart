import 'package:http/http.dart' as http; 
import 'dart:convert';
import 'dart:async';

import '../model_api/acheter.dart';
class AchetersController {
  final String baseUrl = 'http://192.168.1.7:3000/api/acheter/';
  Future<Acheters> fetchAcheters(int id) async {
    final response = await http.get(Uri.parse(baseUrl + id.toString()));
    if (response.statusCode == 200) {
      return Acheters.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Acheters');
    }
  }
  Future<Acheters> updateAcheter(int id) async {
    final response = await http.put(Uri.parse(baseUrl + id.toString() + '/acheter'));
    if (response.statusCode == 200) {
      return Acheters.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update Acheters');
    }
  }
}