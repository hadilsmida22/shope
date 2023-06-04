import 'package:ecommerce_int2/app_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:math' as math;
import 'dart:io';
import '../../controllers_api/Cartes.controllers.dart';
import '../../model_api/Cartes.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _cardNumber = TextEditingController();
  TextEditingController _cardHolder = TextEditingController();

  ScrollController scrollController = ScrollController();
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
  Future<void> ajouterCarteFidelite(Cartes carte) async {
    String ipAddress = await _getIpAddress();
  await CartesService.ajouterCarteFidelite(carte,ipAddress);
  }
  
  String? errorMessage;

// Méthode _createCarte
void _createCarte() async {
  if (_formKey.currentState!.validate()) {
    final String num = _cardNumber.text;
    final String nom = _cardHolder.text;

    print('numero: $num, nom: $nom'); // ajouter un log
    final Cartes carte = Cartes(numero: num, nom: nom);

    try {
      await ajouterCarteFidelite(carte);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Succès!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('vous avez déja une carte avec la meme magasin!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection.index == 1) {
        FocusScope.of(context).requestFocus(FocusNode());
      }
    });
  }
  String? scanResult;

  @override
  Widget build(BuildContext context) {
    Widget addThisCard = InkWell(
      onTap: () {
  setState(() {
    _createCarte();
  });

},
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Ajouter à mes cartes",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) => GestureDetector(
          onPanDown: (val) {},
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            controller: scrollController,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: kToolbarHeight),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Ajouter une carte',
                          style: TextStyle(
                            color: darkGrey,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CloseButton()
                      ],
                    ),
                    
                    SizedBox(height: 30,),
                    Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadow,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 16.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey[200],
                              ),
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(16)
                                ],
                                controller: _cardNumber,
                                onChanged: (val) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Numéro de la carte'),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 8) {
                                  return 'Veuillez entrer un numero de plus de 8 chiffres';
                                  }
                                  return null;
                                  },    
                              ),
                            ),
                            
                            Container(
                              padding: EdgeInsets.only(left: 16.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey[200],
                              ),
                              child: TextFormField(
                                controller: _cardHolder,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Nom de la carte'),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 2) {
                                  return 'Veuillez entrer un nom de plus de 2 caractéres ';
                                  }
                                  return null;
                                  },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 10,),

                      Text("Scanner le code !",
                      style: TextStyle(color: Colors.black , fontSize: 18),),

                      SizedBox(width: 30,),

                      ElevatedButton.icon(
                        onPressed:() {
                          _scanBarcode(context);
                        }, 
                        icon: Icon(Icons.camera_alt_outlined),
                        label: Text("scanner"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black),), 
                        ),
                          
                    ],
                  ),
                  SizedBox(height: 150,),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: addThisCard,
                  ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

Future<void> _scanBarcode(BuildContext context) async {
  final String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
    "#ff6666", // The color of the scan line
    "Cancel", // The text of the cancel button
    true, // Whether to show the flash icon
    ScanMode.BARCODE, // The type of code to scan (barcode or QR code)
  );

  if (barcodeScanRes != '-1') {
    // The scan was successful, handle the result here
    print('Barcode scanned: $barcodeScanRes');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Barcode scanned: $barcodeScanRes'),
        duration: const Duration(seconds: 2),
      ),
    );

    // Update the card number controller with the scanned barcode
    _cardNumber.text = barcodeScanRes;
  } else {
    // The user canceled the scan
    print('Scan canceled');
  }
}


}
