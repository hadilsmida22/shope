import 'package:ecommerce_int2/screens/Acceuil/hotel_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ecommerce_int2/screens/Acceuil/publicite/pubDelice.dart';
import 'package:ecommerce_int2/screens/Acceuil/publicite/pubWarda.dart';
import 'package:ecommerce_int2/screens/Acceuil/publicite/pubLilas.dart';
import 'package:ecommerce_int2/screens/Acceuil/publicite/pubJudy.dart';
import 'package:ecommerce_int2/screens/Acceuil/bloc.dart';

class HotelListView extends StatelessWidget {
  
  HotelListView(
      {Key? key,
      this.hotelData,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);
  
  final VoidCallback? callback;
  final HotelListData? hotelData;
  final AnimationController? animationController;
  final Animation<double>? animation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: callback,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 2,
                              child: Image.asset(
                                hotelData!.imagePath,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              color: HotelAppTheme.buildLightTheme()
                                  .backgroundColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 20, bottom: 20),
                                        
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16, top: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            /*if (hotelData!.titleTxt == 'Delice'){
                                               Navigator.push(context,
                                               MaterialPageRoute(builder: (context) => Pub1()));
                                            }else if(hotelData!.titleTxt  == 'Warda'){
                                               Navigator.push(context,
                                               MaterialPageRoute(builder: (context) => Pub2()));
                                            }else if(hotelData!.titleTxt  == 'Lilas'){
                                               Navigator.push(context,
                                               MaterialPageRoute(builder: (context) => Pub3()));
                                            }else if(hotelData!.titleTxt  == 'Judy'){
                                               Navigator.push(context,
                                               MaterialPageRoute(builder: (context) => Pub4()));
                                            }*/
                                          },
                                          icon: Icon( // <-- Icon
                                            Icons.assignment_add,
                                            size: 24.0,
                                            color: Colors.black,
                                          ),
                                          label: Text(
                                            'Ajouter des articles',
                                            style: TextStyle(color: Colors.black),),
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.white),
                                               // <-- Text
                                          ),
                                        ),
                                        SizedBox(height: 10,) 
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
