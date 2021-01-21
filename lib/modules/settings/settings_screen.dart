import 'package:WorkShop/modules/home/cubit/cubit.dart';
import 'package:WorkShop/shared/colors/colors_common.dart';
import 'package:WorkShop/shared/components/components.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Container(
        color: scaffoldColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              HomeCubit.get(context).titles[3],
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Account Settings"),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  settingsListComponent(text: "Account Security"),
                  settingsListComponent(text: "Email Notifications"),
                  settingsListComponent(text: "Push Notifications"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Support"),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  settingsListComponent(text: "Account Security"),
                  settingsListComponent(text: "Email Notifications"),
                  settingsListComponent(text: "Push Notifications"),
                  settingsListComponent(
                    text: "Sign Out",
                    fun: () {
                      HomeCubit.get(context).signOut();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
