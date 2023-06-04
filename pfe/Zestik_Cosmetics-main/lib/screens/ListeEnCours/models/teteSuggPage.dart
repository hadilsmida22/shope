import 'package:flutter/material.dart';
class HeadSugg extends StatelessWidget {
  const HeadSugg({
    Key? key,
    required this.size,
    required this.txt,
  }) : super(key: key);

  final Size size;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: size.height *0.2 ,
      child:Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10,right: 10,bottom: 30),
            height: size.height *0.2-24,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 21, 189, 184),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
           )),),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              txt,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28
              ),
            ),
          ),
          
        ],
      ),   
    );
  }
}