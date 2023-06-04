import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/screens/intro_page.dart';
import 'package:ecommerce_int2/screens/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../controllers_api/User.controllers.dart';
import '../model_api/user.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  static const port = '192.168.1.5';    

  var _uuid = Uuid();
    
  late Animation<double> opacity;
  late AnimationController controller;


  @override
  void initState() {
    super.initState();
    //_saveUserId();
    getPref();
    
    controller = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sendUserIdToApi();
  }

Future<void> _sendUserIdToApi() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('idUser');  //pour récupérer la valeur associée à la clé 'idUser' dans les SharedPreferences. La valeur retournée est assignée à la variable userId
  bool isMobile = Platform.isAndroid || Platform.isIOS; 
  String ipAddress = await _getIpAddress();   // pour récuperer l'adresse ip de l'appareil
  //|| !await checkUserExistsInDatabase(ipAddress)
  if (userId == null || (isMobile && _isFirstTimeOnDevice(prefs))) {
    // Génération d'un nouvel UUID si l'identifiant n'est pas déjà stocké
    userId = Uuid().v4();
    await prefs.setString('idUser', userId);  //stocker le uuid dans sharedprefernces 

    // Création de l'utilisateur dans la base de données
    await createUser(userId,ipAddress);

  }else{
   // Envoi de l'identifiant utilisateur et de l'adresse IP à l'API
  print('Adresse IP : $ipAddress');
  print('Envoi de l\'identifiant utilisateur : $userId');
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


Future<void> createUser(String userId,String ip) async {
  bool userExists = await checkUserExistsInDatabase(ip);

  if (userExists) {
    print('Utilisateur existant avec l\'ID : $ip');
  } else {
    User newUser = User(
      idUser: userId,
      email: '',
      password: '',
      role: Role.INTERNAUTE,
      adresseIP: ip,
    );

    // Appel de la méthode pour créer l'utilisateur
    try {
      await UserService.createUser(newUser);
      print('Utilisateur créé avec succès');
    } catch (e) {
      print('Erreur lors de la création de l\'utilisateur : $e');
    }
  }
}

//|| !await checkUserExistsInDatabase(ipAddress)
 Future<bool> checkUserExistsInDatabase(String deviceId) async {
  final apiUrl = 'http://$port:3000/api/user/checkDevice/$deviceId';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final responseData = response.body;
    return responseData == 'true';
  } else {
    throw Exception('Failed to check user existence: ${response.statusCode}');
  }
}

  bool _isFirstTimeOnDevice(SharedPreferences prefs) {
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      prefs.setBool('isFirstTime', false);
      return true;
    }
    return false;
  }



  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs .getString("idUser");
    if (id != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MainPage()));
    }
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => IntroPage()));
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/photo.png'), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(color: transparentYellow),
        child: SafeArea(
          child: new Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Opacity(
                      opacity: opacity.value,
                      child: new Image.asset('assets/logo.png')),
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}