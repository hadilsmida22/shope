import 'package:flutter/material.dart';

const Color yellow = Color.fromARGB(255, 105, 206, 243);
const Color mediumYellow = Color.fromARGB(255, 116, 201, 220);
const Color darkYellow = Color.fromARGB(255, 78, 191, 222);
const Color transparentYellow = Colors.white;
const Color darkGrey = Color(0xff202020);

const LinearGradient mainButton = LinearGradient(colors: [
  Colors.white,
  Colors.white,
  Colors.white,
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}