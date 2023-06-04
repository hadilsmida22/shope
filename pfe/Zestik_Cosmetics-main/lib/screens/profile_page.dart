import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/cart.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/cartes/affiche_cart.dart';
import 'package:ecommerce_int2/screens/cartes/AjoutCarte.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
import 'dart:convert';
import 'package:ecommerce_int2/screens/cartes/AjoutCarte.dart';
import 'dart:io';
import '../model_api/Cartes.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

      static const port = '192.168.1.5';

  SwiperController swiperController = SwiperController();
   ScrollController scrollController = ScrollController();
  
  String ipAddress = '';

@override
void initState() {
  super.initState();
  _getIpAddress().then((value) {
    setState(() {
      fetchAll(ipAddress);
      ipAddress = value;
    });
  });
}
  Future<List<Cartes>> fetchAll(String adresseIP) async {
  final response = await http.get(
    Uri.parse('http://$port:3000/api/carte/$adresseIP/byAdresse'),
  );
  if (response.statusCode == 200) {
    final List jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((json) => Cartes.fromJson(json)).toList();
  } else {
    throw Exception('Impossible de récupérer la liste des cartes.');
  }
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
 
  //List<Cartes> myList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Mes cartes',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30
             
            ),),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_card_rounded, color: Colors.black),
              onPressed: () { Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PaymentPage(),
                            ),
                          );},
            ),
            
          ],
          elevation: 0.0,
          ),
      body: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: EdgeInsets.only( left: 10, right: 10,bottom: 8,top: 0),
        child:FutureBuilder<List<Cartes>>(
        future: fetchAll(ipAddress),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 13.0,horizontal: 20),
                child: InkWell(
                  onTap: () {
                    int? idCarte = snapshot.data![index].idCart;
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => Affiche(carte: idCarte!)),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 200,
                    child: Center(
                      child: Stack(
                        children: [
                          if (snapshot.data![index].enseigne != null &&
                              snapshot.data![index].enseigne!.image != null &&
                              snapshot.data![index].enseigne!.image!.isNotEmpty)
                            Image.network(
                              snapshot.data![index].enseigne!.image!,
                              fit: BoxFit.cover,
                            ),
                          if (snapshot.data![index].enseigne == null ||
                              snapshot.data![index].enseigne!.image == null ||
                              snapshot.data![index].enseigne!.image!.isEmpty)
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 127, 226, 223),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                snapshot.data![index].nom!,
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

              ),
            ));
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const CircularProgressIndicator();
        },
      ),

           
    ),
    );
  }
}

class Scroll extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    LinearGradient grT = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    LinearGradient grB = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter);

    canvas.drawRect(
        Rect.fromLTRB(0, 0, size.width, 30),
        Paint()
          ..shader = grT.createShader(Rect.fromLTRB(0, 0, size.width, 30)));

    canvas.drawRect(Rect.fromLTRB(0, 30, size.width, size.height - 40),
        Paint()..color = Color.fromRGBO(50, 50, 50, 0.4));

    canvas.drawRect(
        Rect.fromLTRB(0, size.height - 40, size.width, size.height),
        Paint()
          ..shader = grB.createShader(
              Rect.fromLTRB(0, size.height - 40, size.width, size.height)));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
/*String ipAddress = '';

@override
void initState() {
  super.initState();
  _getIpAddress().then((value) {
    setState(() {
      ipAddress = value;
    });
  });
}
  Future<List<Cartes>> fetchAll(String adresseIP) async {
  final response = await http.get(
    Uri.parse('http://192.168.1.7:3000/api/carte/$adresseIP'),
  );
  if (response.statusCode == 200) {
    final List jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((json) => Cartes.fromJson(json)).toList();
  } else {
    throw Exception('Impossible de récupérer la liste des cartes.');
  }
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
 
  //List<Cartes> myList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Mes cartes',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30
             
            ),),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_card_rounded, color: Colors.black),
              onPressed: () { Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PaymentPage(),
                            ),
                          );},
            ),
            
          ],
          elevation: 0.0,
          ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: EdgeInsets.only( left: 8, right: 8,bottom: 10,top: 0),
        child: FutureBuilder<List<Cartes>>(
                      future: fetchAll(ipAddress), */