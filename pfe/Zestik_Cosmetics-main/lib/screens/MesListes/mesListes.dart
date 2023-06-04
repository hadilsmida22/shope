import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_int2/app_properties.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/MesListes/listProdNouvelle.dart';
import 'package:ecommerce_int2/screens/MesListes/listeProductAncienne.dart';
import 'package:ecommerce_int2/screens/MesListes/partageList.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_int2/screens/cartes/AjoutCarte.dart';
import 'package:ecommerce_int2/screens/cartes/affiche_cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model_api/liste.dart';
import '../../model_api/user.dart';
import '../auth/welcome_back_page.dart';
import 'dart:io';
class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {

        static const port = '192.168.1.5';

  SwiperController swiperController = SwiperController();
  ScrollController scrollController = ScrollController();
  String ipAddress = '';
  @override
void initState() {
  super.initState();
  _getIpAddress().then((value) {
    setState(() {
      getLists(ipAddress);
      ipAddress = value;
    });
  });
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
  Future<List<Listes>> getLists(String adresseIP) async {
  final response = await http.get(Uri.parse('http://$port:3000/api/liste/$adresseIP/meslistes/desc'));

  if (response.statusCode == 200) {
    final List jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((json) => Listes.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load listes');
  }
}
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

 void _createAccount() async {
    if (_formKey.currentState!.validate()) {
      final String email1 = email.text;
      final String password1 = password.text;
      print('Email: $email, Password: $password');

      // Appeler la méthode pour mettre à jour ou créer l'utilisateur
      await updateAccount(email1, password1);
      
    }
  }

Future<String> getUserRoleByIpAddress(String ipAddress) async {
  final apiUrl = 'http://$port:3000/api/user/$ipAddress/role';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final data = responseData['data'];
    return data;
  } else {
    throw Exception('Failed to fetch user role: ${response.statusCode}');
  }
}
 
  Future<User> updateUser(String adresseIP, String email, String password) async {
    final String apiUrl = 'http://$port:3000/api/user/updateRole/$adresseIP';

      final Map<String, dynamic> requestData = {
        'adresseIP': adresseIP,
        'email': email,
        'password': password,
        
      };

      final http.Response response = await http.put(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return User.fromJson(responseData);
      } else {
        throw Exception('Failed to update user: ${response.statusCode}');
      }
  }
Future<void> updateAccount(String email, String password) async {
  String ipAddress = await _getIpAddress();

  if (ipAddress != '' && email.isNotEmpty && password.isNotEmpty) {
    print('adresseIp: $ipAddress'); // Ajoutez cette ligne pour afficher le userID

    // Appeler l'API pour mettre à jour l'utilisateur existant
    await updateUser(ipAddress, email, password);
    print(updateUser);
  } else {
    // Gérer les cas où l'UUID n'est pas disponible ou les champs email et password sont vides
    print('Impossible de mettre à jour le compte de l\'utilisateur');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text(
            "Mes listes",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 30,
                color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
      ),
      body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only( left: 8, right: 8,bottom: 10,top: 0),
                      child: FutureBuilder<List<Listes>>(
                        future: getLists(ipAddress),
                        builder: (context,snapshot){
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  
                                final numeroListe = index + 1;
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.0,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 137, 228, 218),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    height: 150,
                                    child: ListTile(
                                      title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Liste $numeroListe :\n ${snapshot.data![index].dateCreation.toString()}',
                                          style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
                                      ),
                                      subtitle: Row(
                                        children: [
                                         
                                           ElevatedButton(
                                              onPressed: () { },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(255, 23, 194, 180), // couleur de fond
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20), // rayon de bordure
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 30, vertical: 10), // marge interne
                                              ),
                                              child: 
                                                  Text(
                                                    snapshot.data![index].etat.toString(),
                                                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                                                  ),
                                             
                                            ),
                                            SizedBox(width: 10,),
                                            if(snapshot.data![index].etat.toString() == 'non effectuer')
                                              InkWell(
                                                      onTap: () async{
                                                          String ipAddress = await _getIpAddress();
                                                          String userRole = await getUserRoleByIpAddress(ipAddress);
                                                        if(userRole== "internaute"){
                                                          email.clear();
                                                          password.clear();
                                                          showDialog(
                                                          context: context,
                                                          builder: (context) => AlertDialog(
                                                            title: Text('Inscription',
                                                            style: TextStyle(
                                                                    color: Color.fromARGB(255, 18, 92, 87),fontSize:25,fontWeight: FontWeight.bold
                                                                  ),
                                                            textAlign: TextAlign.center,  
                                                            ),
                                                            contentPadding: EdgeInsets.symmetric(horizontal:50, vertical: 24),
                                                            content: Padding(
                                                              padding: const EdgeInsets.all(8),
                                                              child: SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  children: [
                                                                    TextFormField(
                                                                      autofocus: false,
                                                                      controller: email,
                                                                      decoration: InputDecoration(
                                                                        labelText: 'E-mail',
                                                                      ),
                                                                      validator: (value) {
                                                                        if (value!.isEmpty || !value.contains('@')) {
                                                                          return 'Veuillez entrer un e-mail valide';
                                                                        }
                                                                        return null;
                                                                    },  
                                                                    ),
                                                                    SizedBox(height: 10,),
                                                                    TextFormField(
                                                                      autofocus: false,
                                                                      controller: password,
                                                                      decoration: InputDecoration(
                                                                        labelText: 'Mot de passe',
                                                                      ),
                                                                      obscureText: true,
                                                                      validator: (value) {
                                                                        if (value!.isEmpty || value.length < 5) {
                                                                          return 'Veuillez entrer un mot de passe valide';
                                                                        }
                                                                        return null;
                                                                        },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(context).pop();
                                                                },
                                                                child: Text(
                                                                  'Annuler',
                                                                  style: TextStyle(
                                                                    color: Color.fromARGB(255, 18, 92, 87),fontSize: 15,fontWeight: FontWeight.bold
                                                                  )),
                                                              ),
                                                              TextButton(
                                                                onPressed: () async{
                                                                  updateAccount(email.text,password.text);
                                                                  Navigator.of(context).pop();
                                                                  },
                                                                child: Text(
                                                                  'Valider',
                                                                  style: TextStyle(
                                                                    color: Color.fromARGB(255, 18, 92, 87),fontSize: 15,fontWeight: FontWeight.bold
                                                                  )),
                                                              ),
                                                              
                                                            ],
                                                          ),
                                                        );
                                              
                                                      }else if(userRole== 'client'){
                                                        int? idList = snapshot.data![index].idListe;
                                                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PartageList(idListe: idList!)));
                                                      }
                                                        
                                                      },
                                                    child: Container(
                                                        margin: EdgeInsets.all(10),
                                                        padding: EdgeInsets.all(12),
                                                        decoration: BoxDecoration(
                                                          color: Color.fromARGB(255, 37, 39, 40),
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                        child: Text(
                                                          'Partager',
                                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                                        ),
                                                      ),
                                                    ),
                                              
                                            
                                          ],
                                        ),
                                      trailing: 
                                        InkWell(
                                          onTap: () {
                                            int? idList = snapshot.data![index].idListe;
                                            if(snapshot.data![index].etat.toString() == 'effectuer')
                                              Navigator.of(context).push(
                                              MaterialPageRoute(builder: (_) =>  ListProductAncienne(idListe: idList!)));
                                            if(snapshot.data![index].etat.toString() == 'non effectuer' || snapshot.data![index].etat.toString() == 'partager')
                                              Navigator.of(context).push(
                                              MaterialPageRoute(builder: (_) =>  ListProductNouvelle(idListe: idList!)));
                                          },
                                          child: Icon(Icons.arrow_forward_ios)
                                        
                                     ),
                                    ),
                                  ),
                                  
                                  
                            );}
                            );
                            } else if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            }
                            // By default show a loading spinner.
                            return const CircularProgressIndicator();
                          
                        },
                      ),
                    ),
              ),
            ],
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
