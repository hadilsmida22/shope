import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/model_api/produits.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/MesListes/partageList.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_int2/screens/cartes/AjoutCarte.dart';
import 'package:ecommerce_int2/screens/cartes/affiche_cart.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_int2/models/todo2.dart';
import 'package:ecommerce_int2/models/todo_item2.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/suggliste.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../../model_api/liste.dart';
import '../ListeEnCours/cart_page.dart';
class ListProductAncienne extends StatefulWidget {
  final int? idListe;
  const ListProductAncienne({Key? key,required this.idListe}) : super(key: key);

  @override
  State<ListProductAncienne> createState() => _ListProductAncienneState();
}

class _ListProductAncienneState extends State<ListProductAncienne> {

  static const port = '192.168.1.5'; 

  
  String ipAddress = '';
  @override
  void initState() {
    super.initState();
     _getIpAddress().then((value) {
    setState(() {
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
  Future<List<String>> getProduitsList(int idListe) async {
  final response = await http.get(Uri.parse('http://$port:3000/api/liste/$idListe/produits'));
  if (response.statusCode == 200) {
    List data = jsonDecode(response.body)['data'];
    for(var element in data){ print('[$element]');}
    List<String> result = data.map((produit) => produit.toString()).toList();
    return result;
  } else {
    throw Exception('Failed to load produits');
  }
 }

 Future<List<Listes>> findListesWithProduits_id(int idListe) async {
  final response = await http.get(Uri.parse('http://$port:3000/api/liste/$idListe/idListe/details'));
  
  if (response.statusCode == 200) {
  final List jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((json) => Listes.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Listes');
  }
  }

 Future<Listes> reutiliserListe(int listeId, Listes listeDto,String adresseIP) async {
    final url = 'http://$port:3000/api/liste/$listeId/reutliser/$adresseIP';
    
    final response = await http.post(
      Uri.parse(url),
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
  
 List<bool> checkedList = [];
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body:  Column(
        children: [
          //HeadSugg(size: size,txt:'Liste En Cours' ,),
          Expanded(
            child: Container(
              child: FutureBuilder<List<Listes>>(
                      future: findListesWithProduits_id(widget.idListe!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (checkedList.isEmpty) {
                              checkedList = List<bool>.generate(snapshot.data?.length ?? 0, (_) => true);
                            }
                          return ListView.separated(
                            itemCount: snapshot.data?.length ?? 0, // Use the null-aware operator and provide a default value if snapshot.data is null
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 30,
                              );
                            },
                           itemBuilder: (BuildContext context, int index) {
                            final achats = snapshot.data![index].achats;
                            return Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: achats?.length ?? 0,
                                  itemBuilder: (BuildContext context, int i) {
                                    final produit = achats![i].produit;
                                    final libelle = produit?.libelle ?? '';
                                    final nomMagasin = produit?.nomMagasin ?? '';
                                    final marque = produit?.marque ?? '';
                                    final grammage = produit?.grammage ?? '';
                                    return Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            title: Text(
                                              libelle,
                                               style: TextStyle(decoration: checkedList[index] ? TextDecoration.lineThrough : null,fontSize: 20,fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    nomMagasin,
                                                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.normal),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                Text(
                                                    marque.trim()+' , '+grammage.trim(),
                                                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.normal),
                                                    textAlign: TextAlign.start,
                                                  ),
                                              ],
                                            ),
                                            onTap: () {
                                              //acheterProduit(widget.idListe!,)
                                              setState(() {
                                                checkedList[index] = !checkedList[index];
                                              });
                                            },
                                    
                                            trailing: TaskCheckbox(
                                              checkedList[index],
                                              (bool? newValue) {
                                                setState(() {
                                                  checkedList[index] = newValue!;
                                                });
                                            },
                                            ), 
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                
                                    child:Container(
                                      margin: EdgeInsets.all(10),
                                      child: ElevatedButton(
                                        child: Text(
                                          'Réutiliser La Liste',
                                          style: TextStyle(
                                            fontSize: 30,
                                          ),
                                        ),
                                        onPressed:() async{
                                          try {
                                             Listes liste = Listes();
                                             await reutiliserListe(widget.idListe!,liste,ipAddress);
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
                                        
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255, 137, 228, 218),
                                          minimumSize: Size(60, 60),
                                          elevation: 10,
                                        ),
                                      ),
                                    ),
                                  
                                ),
                                /*InkWell(
                                                onTap: () {
                                                  Produits? produit = snapshot.data![index].achats;
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => PartageList(Pdt: produit)));
                                                },
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor:
                                                      Color.fromARGB(255, 37, 39, 40),
                                                  child: Icon(Icons.add,
                                                      size: 20, color: Colors.white),
                                                ),
                                              )*/
                              ],
                              );
                            },
          
                            );
                          }else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          // By default show a loading spinner.
                          return const CircularProgressIndicator();
                        
                        },
                      ),
            ),
          ),
          
        ],
      )
    );
  }


  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey.shade200,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function(bool?) checkBoxChange;
  TaskCheckbox(this.checkboxState, this.checkBoxChange) ;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.teal[400],
      value: checkboxState,
      onChanged: checkBoxChange,
    );
  }

}