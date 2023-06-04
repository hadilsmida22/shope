import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/screens/category/components/acc.dart';
import 'package:ecommerce_int2/screens/category/components/desodor.dart';
import 'package:ecommerce_int2/screens/category/components/lessives.dart';


class RayonMenagers extends StatefulWidget {
  const RayonMenagers({Key? key}) : super(key: key);

  @override
  State<RayonMenagers> createState() => _RayonMenagersState();
}

class _RayonMenagersState extends State<RayonMenagers> 
 with TickerProviderStateMixin<RayonMenagers>  {
  late TabController tabController;
  late TabController bottomTabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
            Tab(text: 'Lessives & Soin du linge'),
            Tab(text: 'Désodorisants'),
            Tab(text: 'Accessoires Ménnagers'),
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
              LessivePage(),
              DesodorPage(),
              AccPage(),
          ],
        ),
      ),
    );
  }
}