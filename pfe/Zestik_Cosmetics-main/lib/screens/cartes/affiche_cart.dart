import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/cart.dart';

import 'package:ecommerce_int2/screens/cartes/catalogues/carrf.dart';
import 'package:ecommerce_int2/screens/cartes/catalogues/monprix.dart';
import 'package:ecommerce_int2/screens/cartes/catalogues/geant.dart';
import 'package:ecommerce_int2/screens/profile_page.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_int2/screens/cartes/AjoutCarte.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ecommerce_int2/screens/cartes/affiche_cart.dart';
import 'package:http/http.dart' as http; 
import 'dart:convert';
import '../../model_api/Cartes.dart';

class Affiche extends StatefulWidget {
  final int? carte;
  Affiche({Key? key,required this.carte}) : super(key: key);

  @override
  _AfficheState createState() => _AfficheState();

}

class _AfficheState extends State<Affiche> {

          static const port = '192.168.1.5';


  @override
  void initState() {
    super.initState();
    //trouverCarteParId(widget.carte!);
  }
  
  Future<Cartes> getCarteById(int id) async {
  final response = await http.get(Uri.parse('http://$port:3000/api/carte/$id/affiche'));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return Cartes.fromJson(jsonResponse['data']);
  } else {
    throw Exception('Failed to load Cartes');
  }
  }

  Future<http.Response> supprimerCarte(int id) async {
    final response = await http.delete(Uri.parse('http://$port:3000/api/carte/$id'));
    if (response.statusCode == 204) {
      return response;
    } else {
      throw Exception('Impossible de supprimer la carte avec l\'id $id');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<Cartes>(
                    future: getCarteById(widget.carte!),
                    builder: (context,snapshot){
                      if (snapshot.hasData) {
                        return Scaffold(
                        backgroundColor: Colors.white,
                        appBar: PreferredSize(
                          preferredSize: Size.fromHeight(250.0),
                          child: AppBar(
                            backgroundColor: Color.fromARGB(255, 21, 189, 184),
                            leading: IconButton(
                              // Ajouter le bouton de retour en arrière
                              icon: Icon(Icons.arrow_back),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            toolbarHeight: 50, // Définir la hauteur de l'AppBar
                            title: Text(""),
                            centerTitle: true,
                            flexibleSpace: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 50.0),
                                  child:  Text(
                                          snapshot.data!.nom!,
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                ),
                              ],
                            ),
                            actions: [
                              IconButton(
                                icon: Icon(Icons.auto_stories_rounded),
                                onPressed: (){
                                  if(snapshot.data!.nom! == "carrefour"){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => CatalogCarrefour()));
                                  }
                                  
                                  if(snapshot.data!.nom! == "geant"){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => CatalogGeant()));
                                  }

                                  if(snapshot.data!.nom! =="monoprix"){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => CatalogMonoprix()));
                                  }
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    supprimerCarte(widget.carte!);
                                  });
                                  
                                  
                                },
                              ),

                            ],
                          ),
                          
                        ),
                        body:Center(
                          child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                       
                                        SizedBox(height: 20),
                                         BarcodeWidget(
                                          barcode: Barcode.code128(), // Utilisez le type de code-barres souhaité
                                          data: snapshot.data!.numero!, // Numéro à afficher dans le code-barres
                                          width: 350,
                                          height: 150,
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                                        ),
                                        
                                      ],
                            ),
                          ),
                       );
                     }else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                     }
                       return const CircularProgressIndicator();
                    }
                  ); 
}
}
