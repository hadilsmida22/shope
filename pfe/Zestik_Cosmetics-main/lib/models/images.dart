import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer({
    Key? key,
    this.height =400.0,
    this.width=400.0,
    this.borderRadius =20,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.child,
    }) : super(key: key);
    
    final double height;
    final double width;
    final String imageUrl;
    final EdgeInsets? padding;
    final EdgeInsets? margin;
    final double borderRadius;
    final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.fill,
          alignment: Alignment.topCenter ) 
          ),
          child: child,
    );
  }
}