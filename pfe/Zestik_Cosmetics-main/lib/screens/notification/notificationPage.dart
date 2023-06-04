import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ecommerce_int2/screens/notification/widget/custom_fllow_notification.dart';
class NotificationPartage extends StatefulWidget {
  const NotificationPartage({Key? key}) : super(key: key);

  @override
  State<NotificationPartage> createState() => _NotificationPartageState();
}

class _NotificationPartageState extends State<NotificationPartage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            title: Text(
              "Notifications",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 30,
                  color: Colors.black),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(

          icon: Icon(Icons.arrow_back,color: Colors.black,),

          onPressed: () => Navigator.of(context).pop(),

        ),
          ),
        ),
         body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "12/03/2023",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFollowNotifcation(),
                 
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "02/03/2023",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  CustomFollowNotifcation(),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "22/01/2023",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  CustomFollowNotifcation()
                ],
              ),
            ),
          ),
        ),
    );
  }
}