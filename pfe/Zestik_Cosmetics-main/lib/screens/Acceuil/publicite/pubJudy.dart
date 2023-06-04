import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ecommerce_int2/models/images.dart';
import 'package:ecommerce_int2/screens/Acceuil/bloc.dart';

class Pub4 extends StatelessWidget {
  Product p2 =new Product('assets/icons/liquide.png', '', '', '', '');
  Product p3 =new Product('assets/icons/Nettoyantj.png', '', '', '', '');
  Product p4 =new Product('assets/icons/solcitron.png', '', '', '', '');
  Product p5 =new Product('assets/icons/solj.png', '', '', '', '');
  Product p6=new Product('assets/icons/soljj.png', '', '', '', '');
  @override
  Widget build(BuildContext context) {
    List<Product> myList =[p2,p3,p4,p5,p6];
   return Scaffold(
    backgroundColor: Colors.white,
     body: Column(
       children: [
         ImageContainer (
            width: 700.0,
            height: 300.0,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(2.0),
            imageUrl: "assets/judy.jpg",
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.black,size: 30),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              
            ),
          ),
          SizedBox(height: 10,),
          Text(
            HotelListData.hotelList[3].titleTxt,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              inherit: false,
              letterSpacing: 2.0),),
          SizedBox(height: 8,), 
          Flexible(
            child: GridView.builder(
              itemCount: myList.length,
              padding: EdgeInsets.only(left: 16,right: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.0,),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2 ),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image:AssetImage(myList[index].image),
                      fit: BoxFit.contain)
                  ),
                  
            );
           }),
          ),        
       ],
     ),
   );
  }
}
class Product{
  String image;
  String marque;
  String libelle;
  String grammage;
  String prix;

  Product(this.image, this.marque, this.libelle,this.grammage, this.prix);
}