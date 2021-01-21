import 'package:WorkShop/modules/login/login_screen.dart';
import 'package:WorkShop/modules/register/register_screen.dart';
import 'package:WorkShop/shared/components/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String _message = '';

  _registerOnFirebase() {
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('received message');
      setState(() => _message = message["notification"]["body"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["body"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["body"]);
    });
  }

  @override
  void initState() {
    _registerOnFirebase();
    getMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Welcome Screen ")),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(),
              defaultButoon(
                  text: "Login",
                  function: () {
                    navigateTo(context, LoginScreen());
                  }),
              SizedBox(
                height: 10,
              ),
              defaultButoon(
                  text: "Sign up",
                  function: () {
                    navigateTo(context, RegisterScreen());
                  }),
              SizedBox(
                height: 30,
              ),
              captionText("Or Login With"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  mycircleAvatar(asset: 'assets/images/facebook.png'),
                  SizedBox(
                    width: 20,
                  ),
                  mycircleAvatar(
                      asset: 'assets/images/google.png', logoColor: null)
                ],
              )
            ],
          ),
        ));
  }
}
