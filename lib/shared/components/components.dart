import 'package:WorkShop/modules/search/search_screen.dart';
import 'package:WorkShop/modules/teesst/test_screen.dart';
import 'package:WorkShop/shared/colors/colors_common.dart';
import 'package:WorkShop/shared/styles/styles.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

Future<void> initPref() async {
  prefs = await SharedPreferences.getInstance();
}

Future<void> saveToken(String token) async {
  prefs.setString('token', token);
}

String getToken() {
  return prefs.getString("token");
}

Future<void> removeToken() async {
  await prefs.remove('token');
}

Widget defaultButoon({
  @required String text,
  @required Function function,
  Color background = defaultColor1,
  double radius = 5,
}) =>
    Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(radius)),
      child: FlatButton(
          onPressed: function,
          child: Text(
            text.toUpperCase(),
            style: TextStyle(color: Colors.white),
          )),
    );

Widget captionText(
  String text,
) =>
    Text(
      text,
      style: TextStyle(fontSize: 15),
    );

void navigateTo(BuildContext context, Widget widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateToAndRemove(BuildContext context, Widget widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      ModalRoute.withName(''),
    );

Widget mycircleAvatar(
        {Color color = defaultColor1,
        String asset,
        Color logoColor = Colors.white}) =>
    CircleAvatar(
        radius: 20,
        backgroundColor: color,
        child: Image(
            color: logoColor, width: 15, height: 15, image: AssetImage(asset)));

Widget defaultTextForm(
        {String title,
        @required TextInputType keyboardType,
        @required TextEditingController controller,
        bool isPassword = false,
        String hintText = ''}) =>
    Container(
      padding: EdgeInsetsDirectional.only(end: 10, start: 10, top: 10),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) captionText(title),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: isPassword,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: hintText),
          )
        ],
      ),
    );

Widget logo() => Column(
      children: [
        Container(
            height: 150,
            width: double.infinity,
            child: Image.asset(
              'assets/images/cs.png',
              fit: BoxFit.fill,
            )),
        SizedBox(
          height: 30,
        )
      ],
    );

Future<Widget> showMyDialog(
    {BuildContext context,
    bool error = false,
    String title,
    String text}) async {
  return showDialog<Widget>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Row(
          children: [
            if (!error) CircularProgressIndicator(),
            SizedBox(
              width: 20,
            ),
            Expanded(child: Text(text))
          ],
        ),
        actions: <Widget>[
          if (error)
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
        ],
      );
    },
  );
}

showToast({String message, bool error = false}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: error ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

Widget settingsListComponent({String text, Function fun}) => Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      // color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: fun)
        ],
      ),
    );

Widget buildProfileItem(
    {@required String title, @required Function fun, Widget shape}) {
  return Expanded(
      child: GestureDetector(
    onTap: fun,
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            child: shape,
            radius: 30,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: black16Bold(),
          )
        ],
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 3.0), //(x,y)
            blurRadius: 20,
            spreadRadius: 2),
      ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
      height: 140,
    ),
  ));
}

Widget searchBuildScrollItem(CategortModel cat, BuildContext context) =>
    GestureDetector(
      onTap: () {
        navigateTo(context, TestScreen());
      },
      child: Container(
        width: 100,

        //height: 110,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Icon(cat.iconData),
              radius: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              cat.title,
              style: black16Bold(),
            )
          ],
        ),

        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
      ),
    );

Widget searchItemBuilder(course) => Container(
      padding: EdgeInsets.all(10),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: 1),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(course['image']),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        course['title'],
                        style: black16Bold(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    /*              RatingBar.builder(
                      ignoreGestures: true,
                      initialRating: 4,
                      itemSize: 10,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.zero,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ), */
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  course["description"],
                  style: grey14().copyWith(fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );

Widget searchItemBuilderExpanded(course) => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: 1),
        ],
      ),
      child: ExpansionTileCard(
        elevation: 0,
        baseColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(course['image']),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          course["title"],
                          style: black16Bold(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    course["description"],
                    style: grey14().copyWith(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text("test"),
            ),
          ),
        ],
      ),
    );
