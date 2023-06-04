import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/custom_background.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/category/category_list_page.dart';
import 'package:ecommerce_int2/screens/category/components/staggered_category_card.dart';
import 'package:ecommerce_int2/screens/profile_page.dart';
import 'package:ecommerce_int2/screens/search_page.dart';
import 'package:ecommerce_int2/screens/MesListes/mesListes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ecommerce_int2/screens/category/components/boissons.dart';
import 'package:ecommerce_int2/screens/category/components/epicerie.dart';
import 'package:ecommerce_int2/screens/category/components/fruit.dart';
import 'package:ecommerce_int2/screens/category/components/legumes.dart';
import 'package:ecommerce_int2/screens/category/components/poulets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model_api/categories.dart';

class RayonAlimenatire extends StatefulWidget {
  const RayonAlimenatire({Key? key}) : super(key: key);

  @override
  State<RayonAlimenatire> createState() => _RayonAlimenatireState();
}

class _RayonAlimenatireState extends State<RayonAlimenatire>
    with TickerProviderStateMixin<RayonAlimenatire>  {


  late TabController tabController;
  late TabController bottomTabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    bottomTabController = TabController(length: 4, vsync: this);
  } 
  
  @override
  Widget build(BuildContext context) {
    
   
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: 'Légumes'),
            Tab(text: 'Fruits'),
            Tab(text: 'Poulet & Oeufs'),
            Tab(text: 'Boissons'),
            Tab(text: 'Epiceries'),
        ],
      labelStyle: TextStyle(fontSize: 16.0),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.0,
      ),
      labelColor: darkGrey,
      unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
      isScrollable: true,
      
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TabBarView(
          controller: tabController,
          children: [
              LegumesPage(),
              FruitPage(),
              PouletPage(),
              BoissonPage(),
              EpicPage(),
          ],
        ),
      ),
      
    );
  }
}
