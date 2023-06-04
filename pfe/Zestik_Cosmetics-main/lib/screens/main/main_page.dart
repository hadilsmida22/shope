import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/custom_background.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/category/category_list_page.dart';
import 'package:ecommerce_int2/screens/profile_page.dart';
import 'package:ecommerce_int2/screens/search_page.dart';
import 'package:ecommerce_int2/screens/MesListes/mesListes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/custom_bottom_bar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_int2/screens/cartes/affiche_cart.dart';
import 'package:ecommerce_int2/screens/cartes/AjoutCarte.dart';
import 'package:ecommerce_int2/screens/Acceuil/bloc.dart';
import 'package:ecommerce_int2/screens/Acceuil/hotel_app_theme.dart';
import 'package:ecommerce_int2/screens/Acceuil/hotel_list_view.dart';
import 'package:ecommerce_int2/screens/profil/profile.dart';
import 'package:ecommerce_int2/screens/notification/notificationPage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
  AnimationController? animationController;   
  late TabController tabController;
  late TabController bottomTabController;
    String _location = '';

  String _country = '';

  String _administrativeArea = '';  
  List<HotelListData> hotelList = HotelListData.hotelList;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000), vsync: this);
    tabController = TabController(length: 5, vsync: this);
    bottomTabController = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
    child: Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      //bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
      body: CustomPaint(
        painter: MainBackground(),
        child: PersistentTabView(
          context,
          
          screens: [
            SafeArea(
                    child: Stack(
                      children: <Widget>[
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          child: Column(
                            children: <Widget>[
                              getAppBarUI(),
                              Expanded(
                                child: NestedScrollView(
                                  controller: _scrollController,
                                  headerSliverBuilder:
                                      (BuildContext context, bool innerBoxIsScrolled) {
                                    return <Widget>[
                                      
                                      SliverPersistentHeader(
                                        pinned: true,
                                        floating: true,
                                        delegate: ContestTabHeader(
                                          getFilterBarUI(),
                                        ),
                                      ),
                                    ];
                                  },
                                  body: Container(
                                    color:
                                        HotelAppTheme.buildLightTheme().backgroundColor,
                                    child: ListView.builder(
                                      itemCount: hotelList.length,
                                      padding: const EdgeInsets.only(top: 8),
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (BuildContext context, int index) {
                                        final int count =
                                            hotelList.length > 10 ? 10 : hotelList.length;
                                        final Animation<double> animation =
                                            Tween<double>(begin: 0.0, end: 1.0).animate(
                                                CurvedAnimation(
                                                    parent: animationController!,
                                                    curve: Interval(
                                                        (1 / count) * index, 1.0,
                                                        curve: Curves.fastOutSlowIn)));
                                        animationController?.forward();
                                        return HotelListView(
                                          callback: () {},
                                          hotelData: hotelList[index],
                                          animation: animation,
                                          animationController: animationController!,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                          
                            ],
                          ),
                        ),
                      ],
                    ),
              ),
            CategoryListPage(),
            CheckOutPage(),
            ProfilePage(),
          ],
          items: [
            PersistentBottomNavBarItem(
              icon: Image.asset(
              'assets/icons/Homee.png',
              fit: BoxFit.cover,
              height: 100.0,
              width: 30.0,
              
              ),
              title: "Acceuil",
              textStyle: TextStyle(fontSize: 20.0,color: Colors.black),
              activeColorPrimary: Color.fromARGB(255, 8, 79, 77),
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              
            icon: Image.asset(
              'assets/icons/crrerListe.png',
              fit: BoxFit.fill,
              height: 100.0,
              width: 50.0,),
              title: "Créer liste",
              textStyle: TextStyle(fontSize: 35.0,color: Colors.black),
              activeColorPrimary: Color.fromARGB(255, 8, 79, 77),
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: Image.asset(
              'assets/icons/AncienneListe.png',
              fit: BoxFit.fill,
              height: 100.0,
              width: 50.0,),
              title: "Mes listes",
              textStyle: TextStyle(fontSize: 35.0,color: Colors.black),
              activeColorPrimary: Color.fromARGB(255, 8, 79, 77),
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: Image.asset(
              'assets/icons/carte.png',
              fit: BoxFit.cover,
              height: 300.0,
              width: 300.0,
              ),
              title: "Mes cartes",
              textStyle: TextStyle(fontSize: 35.0,color: Colors.black),
              activeColorPrimary: Color.fromARGB(255, 8, 79, 77),
              inactiveColorPrimary: Colors.grey,
            ),
          ],
        ),
      ),
    ),
  );
}
  Widget getFilterBarUI() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              color: HotelAppTheme.buildLightTheme().backgroundColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(0, -2),
                    blurRadius: 8.0),
              ],
            ),
          ),
        ),
        Container(
          color: HotelAppTheme.buildLightTheme().backgroundColor,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nouveaux Produits',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Divider(
            height: 1,
          ),
        )
      ],
    );
  }

 

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: HotelAppTheme.buildLightTheme().backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
              
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bonjour',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),
                    ),
                    SizedBox(height: 5,),
                    /*Text(
                      '$_location, $_administrativeArea',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20
                      ),
                    ),*/
                  ],
                ),   
              ),

            /*IconButton(
              icon: Icon(Icons.location_on_outlined,size: 34,),
              onPressed: () {
                _getLocation();
              },
            ),*/
           
            InkWell(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPartage()));
              },
              child: Icon(
                Icons.notifications_rounded,
                size: 34,
            )),
            SizedBox(width: 10,),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Profile()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.person_sharp,size: 35,),
                ),
              ),
            ),

        
          ],
        ),
      ),
    );
  }
  Future<void> _getLocation() async {

    Position position = await Geolocator.getCurrentPosition(

      desiredAccuracy: LocationAccuracy.high,

    );

    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(

        position.latitude, position.longitude,

        localeIdentifier: 'fr_FR');

    geo.Placemark placemark = placemarks[0];

    String location = '${placemark.locality}';

    String country = placemark.country!;

    String administrativeArea = placemark.administrativeArea!;

    setState(() {

      _location = location;

      _country = country;

      _administrativeArea = administrativeArea;

    });

    print(

        'Location: $_location, Country: $_country, AdministrativeArea: $_administrativeArea');

  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.searchUI,
  );
  final Widget searchUI;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
