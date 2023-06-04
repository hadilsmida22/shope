import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/screens/profil/forgotPwd.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_int2/screens/main/main_page.dart';
import 'package:ecommerce_int2/screens/profil/registerPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../controllers_api/User.controllers.dart';
import '../../model_api/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
class WelcomeBackPage extends StatefulWidget {
  @override
  _WelcomeBackPageState createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {

            static const port = '192.168.1.5';

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
 
  Future<User> updateUser(String adresseIP, String email, String password) async {
    final String apiUrl = 'http://$port:3000/api/user/updateRole/$adresseIP';

      final Map<String, dynamic> requestData = {
        'adresseIP': adresseIP,
        'email': email,
        'password': password,
        
      };

      final http.Response response = await http.put(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return User.fromJson(responseData);
      } else {
        throw Exception('Failed to update user: ${response.statusCode}');
      }
  }
Future<void> updateAccount(String email, String password) async {
  String ipAddress = await _getIpAddress();

  if (ipAddress != '' && email.isNotEmpty && password.isNotEmpty) {
    print('adresseIp: $ipAddress'); // Ajoutez cette ligne pour afficher le userID

    // Appeler l'API pour mettre à jour l'utilisateur existant
    await updateUser(ipAddress, email, password);
    print(updateUser);
  } else {
    // Gérer les cas où l'UUID n'est pas disponible ou les champs email et password sont vides
    print('Impossible de mettre à jour le compte de l\'utilisateur');
  }
}
Future<String> _getIpAddress() async {
  try {
    for (var interface in await NetworkInterface.list()) {
      for (var address in interface.addresses) {
        if (address.type == InternetAddressType.IPv4) {
          return address.address;
        }
      }
    }
  } catch (e) {
    print('Erreur lors de la récupération de l\'adresse IP : $e');
  }
  
  return '';
}
 

void _createAccount() async {
  if (_formKey.currentState!.validate()) {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    print('Email: $email, Password: $password');

    // Appeler la méthode pour mettre à jour ou créer l'utilisateur
    await updateAccount(email, password);
    
  }
}

  @override
  Widget build(BuildContext context) {
    Widget welcomeBack = Text(
      "Connectez vous\n c'est gratuit!",
      style: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget loginButton =Padding(
      padding: EdgeInsets.only(left: 70.0,top: 250.0),
      child: InkWell(
        onTap: () {_createAccount();
          Navigator.of(context).pop();
         } ,
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
              child: new Text(" Valider",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 6, 6, 6),
                    Color.fromARGB(255, 16, 16, 16),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
        ),
      ),
    );

    Widget loginForm = Container(
      height: 400,
        child: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(right: 30.0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextFormField(
                        controller: _emailController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                          return 'Veuillez entrer votre adresse e-mail';
                          }
                          return null;
                          },
                      ),
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        controller: _passwordController,
                        style: TextStyle(),
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Mot de passe",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 5) {
                          return 'Veuillez entrer votre mot de passe';
                          }
                          return null;
                          },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            loginButton,
          ],
        ),
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 3),
                welcomeBack,
                //Spacer(),
                Spacer(flex: 2),
                loginForm,
                Spacer(flex: 5),
                //forgotPassword,
              ],
            ),
          )
        ],
      ),
    );
  }
}
