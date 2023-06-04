import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_int2/screens/profil/registerPage.dart';
import 'package:ecommerce_int2/screens/profil/welecomPage.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> 
 with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mon profil',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
        ),
        backgroundColor: Colors.white,
        shadowColor: Color.fromARGB(255, 0, 0, 0),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
          padding: EdgeInsets.all(0.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  
                  Container(
                    //height: 50,
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
                          Tab(
                            text: "S'inscrire",
                          ),
                          Tab(
                            text: "Se connecter ",
                          ),
                        ]),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        WelcomeBackPage(),
                        RegisterPage(),
                        
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
