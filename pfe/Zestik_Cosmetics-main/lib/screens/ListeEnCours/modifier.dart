import 'package:ecommerce_int2/model_api/acheter.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/cart_model.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/cart_page.dart';
import 'package:ecommerce_int2/screens/main/components/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/models/teteSuggPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model_api/produits.dart';


class ModifierProduct extends StatefulWidget {
  String? product;
  int? oldIdP;
  ModifierProduct({required this.product,required this.oldIdP});
   
  @override
  _ModifierProductState createState() => _ModifierProductState(product);
}
class _ModifierProductState extends State<ModifierProduct> {

  static const port = '192.168.1.5';

  String? product;
  int? oldIdP;
  _ModifierProductState(this.product);
   @override
  void initState() {
    //getProductsByLibelle('Tomate'); 
    super.initState();
  }

 Future<List<dynamic>> getProductsByLibelle(String libelle) async {
  final response = await http.get(Uri.parse('http://$port:3000/api/produit/$libelle/autre'));
  
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    
    if (jsonResponse['data'] != null) {
      final products = jsonResponse['data'] as List<dynamic>;
      return products;
    } else {
      throw Exception('Aucun produit trouvé avec ce libellé');
    }
  } else {
    throw Exception('Erreur lors de la récupération des Produits : ${response.statusCode}');
  }
  }
  
 Future<void> updateProduit(int oldProductId, int newProductId) async {
  final response = await http.put(Uri.parse('http://$port:3000/api/produit/$oldProductId'), body: {
    'idP': newProductId.toString(),
  });
  if(response.statusCode == 200 || response.statusCode == 201){
   await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('succée!'),
            backgroundColor: Colors.greenAccent,
    ));
    Navigator.pop(context);
  }
  if (response.statusCode != 200) {
    throw Exception('Failed to update product.');
  }
 }

  bool isUpdateSuccessful = false;


  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Color.fromARGB(255, 21, 189, 184),
        leading: IconButton(

          icon: Icon(Icons.arrow_back,color: Colors.white,),

          onPressed: () => Navigator.of(context).pop(),

        ),
      ), 
      body: Column(
        children: [
          HeadSugg(size: size,txt:'Autre Prix' ,),
          Expanded(
            child: Container(
              child: FutureBuilder<List<dynamic>>(
                    future:getProductsByLibelle("${widget.product!}"),
                    builder: (context,snapshot){
                      
                      if (snapshot.hasData) {
                        
                        return ListView.separated(
                          itemCount:snapshot.data!.length ,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 15,
                              );
                            },
                            itemBuilder: (context, index) {
                              final produit = snapshot.data![index];
                              final id = produit['idp'];
                              final libelle = produit['libelle'];
                              final grammage = produit['grammage'];
                              final prixPdt = produit['prixpdt'];
                              final nomMagasin = produit['nommagasin'];
                              return GestureDetector(
                                onTap: () async {
                                  try {
                                    setState(() {
                                       updateProduit(widget.oldIdP!, id);
                                    });
                                    
                                    setState(() {
                                      isUpdateSuccessful = true;
                                    });
                                    print('Conteneur cliqué !');
                                  } catch (e) {
                                    setState(() {
                                      isUpdateSuccessful = false;
                                    });
                                    print('Erreur lors de la mise à jour du produit : $e');
                                  }
                                },

                                child: Container(
                                  height: 120,
                                  child: Row(
                                    children: [
                                      
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30,top: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                             FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                libelle,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                              ),),
                                            
                                            SizedBox(height: 10,),
                                            Text(
                                              nomMagasin,
                                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),
                                            ),
                                            SizedBox(height: 10,),
                                            Text(
                                              prixPdt.replaceAll("\n", "") ,
                                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),
                                            ),
                                            SizedBox(height: 15,),
                                            
                                          ],
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              );
                            },
                            
                         );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                        // By default show a loading spinner.
                        return const CircularProgressIndicator();
                    }
                  ),
          ),),

        ],
      )
    );
  }
}

