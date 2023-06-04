import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
class TextSugg extends StatelessWidget {
  const TextSugg({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Padding(padding: const EdgeInsets.only(left: 10),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),),
          Positioned(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              height: 30,
              color: Colors.white.withOpacity(0.5),
            ))
        ],
      ),
    );
  }
}

