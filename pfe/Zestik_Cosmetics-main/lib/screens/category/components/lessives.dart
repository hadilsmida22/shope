import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/product/product_page.dart';

import '../../../controllers_api/categorie.controllers.dart';
import '../../../model_api/produits.dart';
class LessivePage extends StatelessWidget {
  final categorieService = CategorieService(); 
  @override
  Widget build(BuildContext context) {
   List<Produits> myList = [];
   return FutureBuilder<List<Produits>>(
    future: categorieService.getProduitsByCategorie(7),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        myList = snapshot.data!;
        return Flexible(
                    child: GridView.count (
                      childAspectRatio: 1.0,
                      padding: EdgeInsets.only(left: 16,right: 16),
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      children: myList.map((data){
                        return InkWell(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ProductPage(product: data))),

                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 81, 120, 134),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               Image.network(
                                data.image ?? 'placeholder_image_url',
                                width: 55,
                              ),
                                SizedBox(height: 14,),
                                Text(
                                  data.libelle!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                            ]),
                          ),
                        );
                      }).toList()),
                 );
      }else if (snapshot.hasError) {
        return Text("Une erreur est survenue");
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
   );  
  }
}
