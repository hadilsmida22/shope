import 'package:flutter/material.dart'; // ou tout autre import nécessaire pour votre application
import 'package:http/http.dart' as http; // pour effectuer des requêtes HTTP
import 'dart:convert';

import 'package:uuid/uuid.dart'; // pour convertir les données JSON

class User {
  String? idUser;
  String? email;
  String? password;
  Role? role;
  String? adresseIP;

  User({
    this.idUser,
    this.email,
    this.password,
    this.role ,
     this.adresseIP ,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['idUser'],
      email: json['email'],
      password: json['password'],
      role: Role.values.firstWhere(
        (role) => role.toString() == 'Role.${json['role']}',
      ),
      adresseIP: json['adresseIP'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'email': email,
      'password': password,
      'role': role.toString().split('.').last,
      'adresseIP': adresseIP,
    };
  }
}

enum Role { INTERNAUTE, ADMIN, CLIENT }

  
