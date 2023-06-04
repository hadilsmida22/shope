import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/model_api/produits.dart';
import 'package:ecommerce_int2/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../controllers_api/liste.controllers.dart';
import 'components/product_display.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/cart_page.dart';
class ProductPage extends StatefulWidget {
  final Produits product;

  ProductPage({required this.product});
   
  @override
  _ProductPageState createState() => _ProductPageState(product);
}

class _ProductPageState extends State<ProductPage> {

      static const port = '192.168.1.5';

  final Produits product;
  _ProductPageState(this.product);
  final listeService = ListService();

 Future<void> addProduitToListe(int idProduit, int quantite) async {
  final response = await http.post(
    Uri.parse('http://$port:3000/api/liste/produit/$idProduit'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'idProduit': idProduit,
      'quantite': quantite,
    }),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to add product to list.');
  }
}


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    Widget viewProductButton = InkWell(
      onTap: () async {
        
        try {
          await  addProduitToListe(widget.product.idP!, 1);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('echec!'),
            duration: Duration(seconds: 2),
          ));
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('succée'),
            duration: Duration(seconds: 2),
          ));
          print('Erreur lors de l\'ajout du produit à votre liste: $e');
        } finally {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => CartPage()));
        }
         Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => CartPage()));
        
  
      },
      child: Container(
        
        height: 80,
        width: width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Ajouter à votre liste",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Material(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 21, 189, 184),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: darkGrey),
          title: Text(
            '',
            style: const TextStyle(
                color: darkGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
          ),
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 16.0),
                    child: Text(
                      product.libelle!,
                      style: const TextStyle(
                          color: const Color(0xFFFEFEFE),
                          fontWeight: FontWeight.w600,
                          fontSize: 30.0),
                    ),
                  ),
                  
                  SizedBox(
                    height: 20.0,
                  ),
                   Padding(
                     padding: const EdgeInsets.only(left: 20.0, right: 40.0,),
                     child: Text(
                            "marque",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                   ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                      width: 150,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(      
                           product.marque != null ? product.marque!.trim() : 'Null',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontFamily: "NunitoSans",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0))
                       
                     ),
                  ),
                   SizedBox(
                    height: 10.0,
                  ),
                   Padding(
                     padding: const EdgeInsets.only(left: 20.0, right: 40.0,),
                     child: Text(
                            "grammage",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                   ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                      width: 150,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        product.grammage != null ? product.grammage!.trim() : 'Null',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontFamily: "NunitoSans",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0))
                       
                     ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 8.0, bottom: bottomPadding != 20 ? 20 : bottomPadding),
                      
                          width: width,
                          height: 100,
                          child: Center(child: viewProductButton),
                    ),
                  ),
    
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

