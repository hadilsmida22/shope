import 'package:ecommerce_int2/model_api/liste.dart';
import 'package:ecommerce_int2/screens/MesListes/mesListes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../ListeEnCours/cart_page.dart';
import '../ListeEnCours/rayons.dart';


class ListProductNouvelle extends StatefulWidget {
  final int? idListe;
  ListProductNouvelle({Key? key, this.idListe}) : super(key: key);

  @override
  State<ListProductNouvelle> createState() => _ListProductNouvelleState();
}

class _ListProductNouvelleState extends State<ListProductNouvelle> {

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

  Future<void> acheterProduit(int listeId, int achatId) async {
    final response = await http.put(Uri.parse('http://$port:3000/api/liste/$listeId/achats/$achatId/acheter'));
    if (response.statusCode != 200) {
      throw Exception('Failed to acheter produit.');
    }else if (response.statusCode == 200){
      print('produit acheté');
    }
  }

  Future<void> acheterrtousProduit(int listeId) async {
    final response = await http.put(Uri.parse('http://$port:3000/api/liste/$listeId/achats/acheter'));
    if (response.statusCode != 200) {
      throw Exception('Failed to acheter produit.');
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
    listeDto.produits!.clear();
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

 List<List<bool>> checkedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            checkedList = List<List<bool>>.generate(
                              snapshot.data?.length ?? 0,
                              (_) => List<bool>.filled(snapshot.data?[0].achats?.length ?? 0, false),
                            );
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
                                    if(achats[i].acheterNonAcheter == true)
                                       checkedList[index][i] = !checkedList[index][i];
                                                    
                                    return Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            title: Text(
                                              libelle,
                                               style: TextStyle(decoration:  checkedList[index][i] ? TextDecoration.lineThrough : null,fontSize: 20,fontWeight: FontWeight.bold),
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
                                            onTap: () async {
                                                try {
                                                  print('widget.idListe: ${widget.idListe!}');
                                                  print('achats[i].idAchete: ${achats[i].idAchete!}');
                                                  
                                                  print('Before acheterProduit');
                                                  await acheterProduit(widget.idListe!, achats[i].idAchete!);
                                                  print('After acheterProduit');
                                                  
                                                  setState(() {
                                                    checkedList[index][i] = !checkedList[index][i];
                                                  });
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('Achat effectué avec succès'),
                                                      backgroundColor: Colors.green,
                                                    ),
                                                  );
                                                } catch (e) {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('Erreur lors de l\'achat'),
                                                      backgroundColor: Colors.red,
                                                    ),
                                                  );
                                                }
                                              },
                                    
                                            trailing: TaskCheckbox(
                                            checkedList[index][i],
                                            (bool? newValue) {
                                              setState(() {
                                                checkedList[index][i] = newValue!;
                                              });
                                            },
                                            
                                            ), 
                                            
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 150,),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                
                                    child:Container(
                                      margin: EdgeInsets.all(10),
                                      child: ElevatedButton(
                                        child: Text(
                                          'Course Effectuée',
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.black
                                          ),
                                        ),
                                        onPressed: () async {
                                            setState(() {
                                              for (int i = 0; i < checkedList.length; i++) {
                                                for (int j = 0; j < checkedList[i].length; j++) {
                                                  checkedList[i][j] = true;
                                                }
                                              }
                                            });

                                            await acheterrtousProduit(widget.idListe!);
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => CheckOutPage()));
                                            
                                          },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255, 137, 228, 218),
                                          minimumSize: Size(60, 60),
                                          elevation: 10,
                                        ),
                                      ),
                                    ),
                                ),
                                SizedBox(height: 10,),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                
                                    child:Container(
                                      margin: EdgeInsets.all(10),
                                      child: ElevatedButton(
                                        child: Text(
                                          'Ajouter produit',
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.black
                                          ),
                                        ),
                                        onPressed: () async {
                                              try {
                                                List<Listes> listeDetails = await findListesWithProduits_id(widget.idListe!);
                                                
                                                await reutiliserListe(widget.idListe!,listeDetails[0],ipAddress);
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
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
            '',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 30
             
            ),),
      leading: IconButton(
            // Ajouter le bouton de retour en arrière
            icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
