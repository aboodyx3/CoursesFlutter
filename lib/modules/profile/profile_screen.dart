import 'package:WorkShop/shared/components/components.dart';
import 'package:WorkShop/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://scontent-hbe1-1.xx.fbcdn.net/v/t1.0-9/66815023_2431453233756515_7296940034773483520_n.jpg?_nc_cat=103&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeGQtDXjM1fcU0tMP1vSU_oyGlXoFdBR8cUaVegV0FHxxVFm-H2OEk4sTVkAdP8su66MY1jXrpfoqtCNLnPtaJnI&_nc_ohc=FbnUYXR8hcgAX_mHEdr&_nc_oc=AQknvDXK0FrFWcqkUPSgtvxukyWbjSYYYwolG-BMiqVoELAljKcGCl_HbwIh-IU68jg&_nc_ht=scontent-hbe1-1.xx&oh=cde04ca3b1969a622df9f6fcef2730c6&oe=602B074B"),
                radius: 40,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Abdelrhman Azab  ",
                    textAlign: TextAlign.center,
                    style: black20Bold(),
                  ),
                  IconButton(icon: Icon(Icons.edit), onPressed: () {})
                ],
              ),
              Text("abdelrhman.azab@gmail.com"),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    buildProfileItem(
                        title: "My Courses", shape: Text("5"), fun: () {}),
                    SizedBox(
                      width: 20,
                    ),
                    buildProfileItem(
                        title: "My favourites",
                        shape: Icon(Icons.favorite_border_outlined),
                        fun: () {}),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    buildProfileItem(
                        title: "My Cart",
                        shape: Icon(Icons.shopping_cart_outlined),
                        fun: () {}),
                    SizedBox(
                      width: 20,
                    ),
                    buildProfileItem(
                        title: "My Reviews",
                        shape: Icon(Icons.star_half),
                        fun: () {}),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    buildProfileItem(
                        title: "Invite a friend",
                        shape: Icon(Icons.share),
                        fun: () {}),
                    SizedBox(
                      width: 20,
                    ),
                    buildProfileItem(
                        title: "Help & Support",
                        shape: Icon(Icons.question_answer_rounded),
                        fun: () {}),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          )),
    );
  }
}
