import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/screens/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../controllers_api/auth.controllers.dart';
import 'dart:convert';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

              static const port = '192.168.1.5';

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final AuthService authService = AuthService();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
  if (_formKey.currentState!.validate()) {
    try {
      final response = await http.post(
        Uri.parse('http://$port:3000/api/auth/login'), // Remplacez par votre point de terminaison d'API
        headers: {
          'Content-Type': 'application/json', // Spécifiez le type de contenu de la requête
        },
        body: jsonEncode({
          'email': email.text,
          'password': password.text,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Connexion réussie
        final data = jsonDecode(response.body);
        final token = data['data']['access_token'];
        print('Token: $token'); 
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', token);

        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => IntroPage()),
        );
      } else {
        // Afficher un message d'erreur à l'utilisateur
        print("La connexion a échoué. Code d'état : ${response.statusCode}");
      }
    } catch (e) {
      // Gérer les exceptions
      print('Erreur lors de la connexion : $e');
    }
  }
}

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Ravi de vous rencontrer ',
      style: TextStyle(
          color: Colors.black,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget registerButton =Padding(
      padding: EdgeInsets.only(left: 70.0,top: 250.0),
      child: InkWell(
        onTap: _login,
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
              child: new Text("Se connecter",
                  style: const TextStyle(
                      color: Colors.white,
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

    Widget registerForm = Container(
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
                      controller: email,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Veuillez entrer un e-mail valide';
                        }
                        return null;
                    },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      controller: password,
                      style: TextStyle(),
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Mot de passe",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                       validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return 'Veuillez entrer un mot de passe valide';
                      }
                      return null;
                      },

                    ),
                  ),
                ],
              ),
            ),
          ),
          registerButton,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 2),
                title,
                Spacer(flex: 2),
                registerForm,
                Spacer(flex: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

