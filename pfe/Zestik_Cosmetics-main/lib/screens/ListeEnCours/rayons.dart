import 'package:ecommerce_int2/model_api/produits.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_int2/models/category.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_int2/screens/category/components/staggered_category_card.dart';
import 'package:ecommerce_int2/screens/ListeEnCours/models/teteSuggPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../controllers_api/rayon.controllers.dart';
import '../../model_api/rayonsModel.dart';
class RayonPage extends StatefulWidget {
  const RayonPage({Key? key}) : super(key: key);

  @override
  State<RayonPage> createState() => _RayonPageState();
}

class _RayonPageState extends State<RayonPage>
  with SingleTickerProviderStateMixin  {

              static const port = '192.168.1.5';

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync:this);
    searchResults = categories;
    fetchAllRayons(); 
    super.initState();
  }
  Future<List<Rayons>> fetchAllRayons() async {
  final response = await http.get(Uri.parse('http://$port:3000/api/rayon'));

  if (response.statusCode == 200) {
    final List jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((json) => Rayons.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load rayons');
  }
 } 

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<Category> categories = [
    Category(
      Color.fromARGB(255, 85, 116, 114),
      Color.fromARGB(255, 21, 189, 184),
      '',
     
    ),
    Category(
      Color.fromARGB(255, 85, 116, 114),
      Color.fromARGB(255, 21, 189, 184),
      '',
      
    ),
    Category(
      Color.fromARGB(255, 85, 116, 114),
      Color.fromARGB(255, 21, 189, 184),
      '',
      
    ),
    Category(
      Color.fromARGB(255, 85, 116, 114),
      Color.fromARGB(255, 21, 189, 184),
      '',
      
    ),
    Category(
      Color.fromARGB(255, 85, 116, 114),
      Color.fromARGB(255, 21, 189, 184),
      '',
      
    ),
   
  ];
  List<Produits> searchproduits = []; 
  List<Category> searchResults = [];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: Container(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[ 
              HeadSugg(size: size,txt:'Créer Liste' ,), 

              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(top: 7),
                  padding: EdgeInsets.only( left: 8, right: 8,bottom: 10,top: 0),
                  child: FutureBuilder<List<Rayons>>(
                    future: fetchAllRayons(),
                    builder: (context,snapshot){
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) => Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 16.0,
                              ),
                              child: StaggeredCardCard(
                                  begin: searchResults[index].begin,
                                  end: searchResults[index].end,
                                  categoryName: snapshot.data![index].nomR.toString(),
                                  //assetPath: searchResults[index].image,
                              ),
                              
                        ),
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                        return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

            /*Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: EdgeInsets.only( left: 8, right: 8,bottom: 10,top: 0),
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (_, index) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: StaggeredCardCard(
                      begin: searchResults[index].begin,
                      end: searchResults[index].end,
                      categoryName: searchResults[index].category,
                      assetPath: searchResults[index].image,
                    ),
                  ),
                ),
              ),
            ),*/
          
      
    );
  }
}
