
import 'package:ecommerce_int2/screens/notification/widget/custum_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ecommerce_int2/screens/MesListes/listProdNouvelle.dart';
class CustomFollowNotifcation extends StatefulWidget {
  const CustomFollowNotifcation({Key? key}) : super(key: key);

  @override
  State<CustomFollowNotifcation> createState() =>
      _CustomFollowNotifcationState();
}

class _CustomFollowNotifcationState extends State<CustomFollowNotifcation> {
  bool follow = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: const AssetImage("assets/per1.jpg"),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Dean Winchester",
              style:TextStyle(
                color: Color(0xFF2E3E5C),
                fontSize: 20
              )
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "A partager une liste",
              style:TextStyle(
                color: Color(0xFF9FA5C0),
                fontSize: 15
              )
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: follow == false ? 50 : 30),
            child: CustomButton(
              height: 40,
              color: follow == false ?Color.fromARGB(255, 21, 189, 184) : Color(0xFFF4F5F7),
              textColor: follow == false ? Colors.white : Color(0xFF2E3E5C),
              onTap: () {
                setState(() {
                  follow = !follow;
                });
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListProductNouvelle()));
              },
              text: "Voir Liste",
            ),
          ),
        ),
      ],
    );
  }
}