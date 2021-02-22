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
                    "https://scontent-hbe1-1.xx.fbcdn.net/v/t1.0-9/146220650_2908719269363240_66804566686350728_o.jpg?_nc_cat=101&ccb=3&_nc_sid=09cbfe&_nc_ohc=eBTohsQq8KcAX_Q3C0N&_nc_ht=scontent-hbe1-1.xx&oh=d598c0dec9e0d813296e9998ea862138&oe=605AA63B"),
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
