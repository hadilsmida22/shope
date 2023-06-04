import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class CustomBottomBar extends StatelessWidget {
  final TabController controller;

  const CustomBottomBar({
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            
            icon: Image.asset(
              'assets/icons/Homee.png',
              fit: BoxFit.cover,
              height: 100.0,
              width: 30.0,
              
            ),
            onPressed: () {
              controller.animateTo(0);
            },
            
          ),
          IconButton(
            
            icon: Image.asset(
              'assets/icons/crrerListe.png',
              fit: BoxFit.cover,
              height: 200.0,
              width: 300.0,),
            onPressed: () {
              controller.animateTo(1);
            },
           
          ),
          IconButton(
            
            icon: Image.asset(
              'assets/icons/AncienneListe.png',
              fit: BoxFit.cover,
              height: 300.0,
              width: 300.0,),
            onPressed: () {
              controller.animateTo(2);
            },
            
          ),
          IconButton(
            
            icon: Image.asset(
              'assets/icons/carte.png',
              fit: BoxFit.cover,
              height: 300.0,
              width: 300.0,
              ),
            onPressed: () {
              controller.animateTo(3);
            },
            
          )
        ],
      ),
    );
  }
}
