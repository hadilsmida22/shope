import 'package:ecommerce_int2/model_api/liste.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/rayons.dart';
import 'package:ecommerce_int2/screens/MesListes/mesListes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/models/teteSuggPage.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/modifier.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../controllers_api/liste.controllers.dart';
import '../../model_api/produits.dart';
class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> 
  with SingleTickerProviderStateMixin{

          static const port = '192.168.1.5';

  @override
  void initState() {
    getListeProduitsDerniereListe(); 
    getLists();
    super.initState();
  }
  Future<void> removeProduitFromListe(int idProduit) async {
  final response = await http.delete(
    Uri.parse('http://$port:3000/api/liste/produit/$idProduit'),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to remove product from list.');
  }
  }
  
  Future<void> terminerListe() async {
    final response = await http.put(Uri.parse('http://$port:3000/api/liste/terminer'));
    if (response.statusCode != 200) {
      throw Exception('Failed to terminer liste.');
    }
  }

  Future<List<Listes>> getLists() async {
  final response = await http.get(Uri.parse('http://$port:3000/api/liste/produits/tous'));

  if (response.statusCode == 200) {
    final List jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((json) => Listes.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load listes');
  }
  }

  Future<List<String>> getListeProduitsDerniereListe() async {
  final response = await http.get(Uri.parse('http://$port:3000/api/liste/lastListe/produits'));

  if (response.statusCode == 200) {
    List data = jsonDecode(response.body)['data'];
    for(var element in data){ print('[$element]');}
    List<String> result = data.map((produit) => produit.toString()).toList();
    return result;
  } else {
    throw Exception('Failed to load lists');
  }
  }

   Future<void> updateAchatQuantite(int idAchat, int quantite) async {
    try {
      final url = Uri.parse('http://$port:3000/api/acheter/$idAchat/quantite');
      final response = await http.put(
        url,
        body: {'quantite': quantite.toString()},
      );

      if (response.statusCode == 200) {
        // Succès de la mise à jour de la quantité
        print('Quantité mise à jour avec succès');
      } else {
        // Gestion des erreurs
        print('Erreur lors de la mise à jour de la quantité');
      }
    } catch (e) {
      print('Erreur lors de la mise à jour de la quantité: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        
        backgroundColor: Color.fromARGB(255, 21, 189, 184),
        leading: IconButton(

          icon: Icon(Icons.arrow_back,color: Colors.white,),

          onPressed: () => Navigator.of(context).pop(),

        ),
      ), 
      body: Column(
        children: [
          HeadSugg(size: size,txt:'Liste En Cours' ,),
          Expanded(
            child: Container(
              child: FutureBuilder<List<Listes>>(
                      future: getLists(),
                      builder: (context, snapshot) {
                        
                         if (snapshot.hasData) {
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
                                    itemCount: achats?.length ?? 0,// Use the null-aware operator and provide a default value if snapshot.data![index].achats is null
                                    itemBuilder: (BuildContext context, int i) {
                                      final produit = achats![i].produit;
                                      final libelle = produit?.libelle ?? '';
                                      final nomMagasin = produit?.nomMagasin ?? '';
                                      final marque = produit?.marque ?? '';
                                      final grammage = produit?.grammage ?? '';
                                      final prix = produit?.prixPdt ?? '';
                                      int quantite = achats[i].quantite!;

                                      return  Row(
                                                children:[
                                                  Padding(
                                                    padding: EdgeInsets.all(13),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      
                                                      children:[
                                                         Text(
                                                            libelle,
                                                            style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold),
                                                          ),
                                                          
                                                          Text(
                                                              nomMagasin + ' , ' +prix.replaceAll("\n", ""),
                                                              style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.normal),
                                                              textAlign: TextAlign.start,
                                                          ),
                                                          Text(
                                                              marque.trim()+' , '+grammage.trim(),
                                                              style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.normal),
                                                              textAlign: TextAlign.start,
                                                          ),
                                                        SizedBox(height: 10,),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    String? libelleProduit = snapshot.data![index].achats![i].produit!.libelle!;
                                                                    int? idProduit =  snapshot.data![index].achats![i].produit!.idP!;
                                                                    Navigator.of(context)
                                                                  .push(MaterialPageRoute(builder: (_) =>  ModifierProduct(product:libelleProduit,oldIdP: idProduit,),fullscreenDialog: true));
                                                                  
                                                                  },
                                                                  child: Container(
                                                                    child: Icon(
                                                                      Icons.remove_red_eye_outlined,
                                                                      color: Colors.black,
                                                                      size: 30,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(width: 10,),
                                                                InkWell(
                                                                  onTap: () {
                                                                    int? idProd = snapshot.data![index].achats![i].produit!.idP!;
                                                                    removeProduitFromListe(idProd);
                                                                    setState(() {
                                                                      getLists();
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    child: Icon(
                                                                      Icons.delete_rounded,
                                                                      color: Colors.black,
                                                                      size: 30,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(width: 180),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                  children: [
                                                                    IconButton(
                                                                      icon: Icon(
                                                                        Icons.add,
                                                                        color: Colors.black,
                                                                        size: 25,
                                                                      ),
                                                                      onPressed: () async{
                                                                        setState(() {
                                                                          quantite++; // Incrémenter la quantité localement dans le widget
                                                                        });

                                                                        // Mettre à jour la quantité dans la base de données
                                                                        await updateAchatQuantite(achats[i].idAchete!, quantite);
                                                                        await getListeProduitsDerniereListe();
                                                                      },
                                                                    ),
                                                                    SizedBox(width: 10,),
                                                                    Text(
                                                                      quantite.toString(),
                                                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
                                                                    ),
                                                                    SizedBox(width: 10,),
                                                                    IconButton(
                                                                      icon: Container(
                                                                        padding: EdgeInsets.only(bottom: 13),
                                                                        child: Icon(
                                                                          Icons.minimize,
                                                                          color: Colors.black,
                                                                          size: 25,
                                                                        ),
                                                                      ),
                                                                      onPressed: () async{
                                                                       if (quantite > 0) {
                                                                          setState(() {
                                                                            quantite--; // Décrémenter la quantité localement dans le widget
                                                                          });
                                                                          // Mettre à jour la quantité dans la base de données
                                                                          await updateAchatQuantite(achats[i].idAchete!, quantite);
                                                                          await getListeProduitsDerniereListe();
                                                                         }}
                                                                    ),
                                                                  ],
                                                                )

                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 8,),
                                                      ] 
                                                    ),
                                                 ),
                                                 
                                                 
                                              ] 
                                              );
                                           
                                      
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'TOTAL',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              ),
                                              SizedBox(height: 9,),
                                            Text(
                                              snapshot.data![index].total!.toString()+" DT",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold
                                              ),
                                            )  
                                          ],
                                        ),
                                        Spacer(flex: 1,), 
                                        Column(
                                          children: [
                                            Container(
                                            height: 100,
                                            padding: EdgeInsets.all(25),
                                            width: 160,
                                            child: ElevatedButton(
                                              onPressed:() {
                                                  Navigator.of(context)
                                                  .pushReplacement(MaterialPageRoute(builder: (_) =>  RayonPage(),));
                                              },
                                              child: Text('Continuer',
                                              style: TextStyle(
                                              fontSize: 15,
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
                                        
                                        Container(
                                          height: 100,
                                          padding: EdgeInsets.all(25),
                                          width: 160,
                                          child: ElevatedButton(
                                            onPressed:() async {
                                              await terminerListe();
                                               
                                               Navigator.of(context)
                                                .pushReplacement(MaterialPageRoute(builder: (_) =>  CheckOutPage(),));
                                            },
                                            child: Text('Terminer',
                                            style: TextStyle(
                                            fontSize: 15,
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
                                          ],
                                        )
                                        ],
                                    ),
                                  )
                                ],
                              );
                            },
                            
                          );
                        }else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }
                    
                        // By default show a loading spinner.
                        return const CircularProgressIndicator();
                    }
                  
                   ),
            ),
          ),
          
        ],
      )
    );
  }
}

