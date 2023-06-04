
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class CatalogCarrefour extends StatelessWidget {

  String url= "https://www.carrefour.tn/default/catalogslider/catalogpagedetails/catalogdetails?catalogueId=145";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Catalogue',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                
              ],
            ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),

        shadowColor: Color.fromARGB(255, 255, 255, 255),

        iconTheme: IconThemeData(color: Colors.black),

        leading: IconButton(

          icon: Icon(Icons.arrow_back),

          onPressed: () => Navigator.of(context).pop(),

        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(8.0),

        child: GestureDetector(

                onTap: () {

                  _launchUrl(url);

                },

                child: Container(

                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(15.0),

                      image: DecorationImage(

                          image: AssetImage( "assets/catalogue1.jpg",),

                          fit: BoxFit.contain)),

                ),

              ),
    ),
    );
  }
}
void _launchUrl(String url) async {

  // ignore: deprecated_member_use

  if (await canLaunch(url)) {

    await launchUrl(Uri.parse(url));

  } else {

    throw 'Could not launch $url';

  }

}