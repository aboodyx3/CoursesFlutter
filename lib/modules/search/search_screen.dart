import 'package:WorkShop/shared/colors/colors_common.dart';
import 'package:WorkShop/shared/components/components.dart';
import 'package:WorkShop/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CategortModel {
  String title;
  IconData iconData;
  CategortModel(this.title, this.iconData);
}

class SearchScreen extends StatelessWidget {
  List<CategortModel> category = [
    CategortModel("Mobile App", Icons.access_alarm),
    CategortModel("Front End", Icons.access_alarm),
    CategortModel("Back End", Icons.access_alarm),
    CategortModel("UI & UX", Icons.access_alarm),
    CategortModel("AI", Icons.access_alarm),
    CategortModel("ML", Icons.access_alarm),
    CategortModel("IOT", Icons.access_alarm),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Search Courses",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            width: double.infinity,
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Start Search",
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: defaultColor1,
                      borderRadius: BorderRadius.circular(15)),
                  width: 60,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {},
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            width: double.infinity,
            height: 100,
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    searchBuildScrollItem(category[index], context),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: category.length),
          ),
          /* Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20),
              itemBuilder: (context, index) => searchItemBuilderExpanded(),
              itemCount: 10,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
            ),
          )) */
        ],
      ),
    );
  }
}
