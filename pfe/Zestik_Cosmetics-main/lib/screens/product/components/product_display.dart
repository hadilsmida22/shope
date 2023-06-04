import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:flutter/material.dart';

import '../../../model_api/produits.dart';

class ProductDisplay extends StatelessWidget {
  final Produits product;

  const ProductDisplay({
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 10.0,
            right: 0,
            child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 100,
                padding: EdgeInsets.only(right: 24),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(253, 192, 84, 1),
                          offset: Offset(0, 3),
                          blurRadius: 6.0),
                    ]),
                
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: ' ${product.libelle}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Montserrat",
                              fontSize: 26.0,),
                            ),
                     
                    ])),
                  ),
                ),
        Align(
          alignment: Alignment(-1, 1),
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0,),
            child: Container(
              height: screenAwareSize(220, context),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 50.0,
                    ),
                    /*child: Container(
                      child: Hero(
                        tag: product.image,
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.contain,
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),*/
                  )
                ],
              ),
            ),
          ),
        ),
      
      ],
    );
  }
}
