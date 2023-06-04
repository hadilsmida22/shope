import 'package:ecommerce_int2/model_api/produits.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/models/teteSuggPage.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/models/textSugg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../controllers_api/liste.controllers.dart';
import '../../model_api/liste.dart';
import 'dart:io';
class SuggListPage extends StatefulWidget {
  @override
  _SuggListPageState createState() => _SuggListPageState();
}
class _SuggListPageState extends State<SuggListPage> {

      static const port = '192.168.1.5';

  final listeService = ListService();
    String ipAddress = '';
  @override
void initState() {
  super.initState();
  _getIpAddress().then((value) {
    setState(() {
      getTop3Produits(ipAddress);
      ipAddress = value;
    });
  });
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
    Future<List<Produits>> getTop3Produits(String adresseIP) async {
      final response = await http.get(Uri.parse('http://$port:3000/api/liste/effectuer/top3Produits/$adresseIP'));
      if (response.statusCode == 200) {
        final List jsonResponse = json.decode(response.body)['data']['data'];
        return jsonResponse.map((json) => Produits.fromJson(json)).toList();
      } else {
        throw Exception('Failed to get top 3 produits.');
      }
    }
    Future<Listes> creerListeSugg(Listes listeDto,String adresseIP) async {
      final response = await http.post(Uri.parse('http://$port:3000/api/liste/new/listeSugge/$adresseIP'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(listeDto.toJson()));

      if (response.statusCode == 200) {
        return Listes.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to add list.');
      }
  }
  @override
  Widget build(BuildContext context) {
    List<Produits> myList = [];
    Size size = MediaQuery.of(context).size;
    return Flexible(
      child: Column(
        children: [
          HeadSugg(size: size,txt: 'Ma Liste Suggérée',),
          TextSugg(text: 'Utilisé recemment'),
          Container(
            width: size.width * 2,
            child:FutureBuilder<List<Produits>>(
              future: getTop3Produits(ipAddress),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  myList = snapshot.data!;
                  return GridView.count(
                              shrinkWrap: true,
                              childAspectRatio: 1.0,
                              padding: EdgeInsets.only(left: 16,right: 16),
                              crossAxisCount: 3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 12,
                              children: myList.map((data){
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 21, 189, 184),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        data.image ?? 'placeholder_image_url',
                                        width: 40,
                                      ),
                                      SizedBox(height: 8,),
                                      Text(
                                         data.libelle!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                          
                                    ]),
                              );
                              }).toList());
                }else if (snapshot.hasError) {
                  return Text("Une erreur est survenue");
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200),
            child: ElevatedButton(
              onPressed:() async{
                try {
                  Listes liste = Listes();
                  await  creerListeSugg(liste,ipAddress);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('echec!'),
                    duration: Duration(seconds: 2),
                  ));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('succée'),
                    duration: Duration(seconds: 2),
                  ));
                  print('Erreur lors de l\'ajout des produit à votre liste: $e');
                } finally {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => CartPage()));
                }
              },
              child: Text('Continuer',
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 21, 189, 184),),
                shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                ),
            ),),
          ),
                  
        ]
      ),
    );
  }
}


