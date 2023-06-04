import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/model_api/produits.dart';
import 'package:ecommerce_int2/screens/auth/register_page.dart';
import 'package:ecommerce_int2/screens/cartes/AjoutCarte.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_int2/screens/auth/welcome_back_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class PartageList extends StatefulWidget {
  final int? idListe;
  const PartageList({Key? key,required this.idListe}) : super(key: key);

  @override
  _PartageListState createState() => _PartageListState();
}

class _PartageListState extends State<PartageList> {

      static const port = '192.168.1.5';

  TextEditingController email = TextEditingController();

 Future<void> shareListByEmail(String recipientEmail,int idListe) async {
  final url = 'http://$port:3000/api/liste/partager/$idListe';

  final body = {'email': recipientEmail};

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(body),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    print('Email sent successfully');
    // Afficher un message de succès dans l'interface
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Succès'),
        content: Text('L\'e-mail a été envoyé avec succès.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  } else {
    print('Failed to send email');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    // Afficher un message d'erreur dans l'interface
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Erreur'),
        content: Text('Échec de l\'envoi de l\'e-mail.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

Future<void> partagerListe() async {
  await shareListByEmail(email.text,widget.idListe!);
}


Future<List<String>> getProduitsList(int idListe) async {
  final response = await http.get(Uri.parse('http://$port:3000/api/liste/$idListe/produits'));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body)['data'];
    List<String> result = data.cast<String>().toList();
    return result;
  } else {
    throw Exception('Failed to load produits');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'Partager la liste',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
        ),
        shadowColor: Color.fromARGB(255, 255, 255, 255),
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  maxRadius: 80,
                  backgroundImage: AssetImage('assets/partage1.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Partager votre liste ',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
               
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                         'Envoyé à ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 7),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          controller: email,
                          style: TextStyle(),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText:   "email de destinataire",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                   partagerListe();

                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Partager",
                   style: TextStyle(
                   color: Colors.white, fontWeight: FontWeight.normal, fontSize: 17),),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}