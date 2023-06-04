import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/cart_page.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/suggliste.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/rayons.dart';
import '../../controllers_api/liste.controllers.dart';
import '../../model_api/liste.dart';
import 'components/staggered_category_card.dart';
import 'dart:io';
class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage>
with SingleTickerProviderStateMixin  {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync:this);
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body:Padding(
            padding: EdgeInsets.only(top:5.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          ),
                      child: TabBar(
                          unselectedLabelColor: Colors.black,
                          labelColor: Colors.black,
                          indicatorColor: Colors.white,
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            color: Color.fromARGB(255, 205, 202, 202),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          controller: tabController,
                          tabs: [
                            Tab(child: Text(
                              "Suggestion Liste",
                               style: TextStyle(
                                color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                              ) ),
                            Tab(child: Text(
                              "Creation Liste",
                               style: TextStyle(
                                color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                              ) ),
                          ],
                          onTap: (index) async {
                            if (index == 1) {
                               Listes liste = Listes();
                               String ipAddress = await _getIpAddress();
                               print(ipAddress);
                               ListService listService = ListService();
                               await listService.ajouterListe(liste,ipAddress); // Appeler la fonction createList()
                            }
                          },
                          ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          SuggListPage(),
                          RayonPage(),
                         
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
      
    
    );
    
  }
}
