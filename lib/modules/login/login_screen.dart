import 'package:WorkShop/modules/home/home_screen.dart';
import 'package:WorkShop/modules/login/cubit/cubit.dart';
import 'package:WorkShop/modules/login/cubit/states.dart';
import 'package:WorkShop/modules/welcome/welcome_screen.dart';
import 'package:WorkShop/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final String email;
  final String password;
  LoginScreen({this.email, this.password});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (email != null && password != null) {
      emailController.text = email;
      passwordController.text = password;
    }
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showMyDialog(
              context: context, title: "Please wait..", text: "Logging in..");
        }
        if (state is LoginSuccessState) {
          navigateToAndRemove(context, HomeScreen());
        }
        if (state is LoginErrorState) {
          Navigator.of(context).pop();
          showMyDialog(
              context: context,
              error: true,
              title: "Cannot login",
              text: "Wrong email or password");
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    logo(),
                    defaultTextForm(
                        controller: emailController,
                        title: 'Email',
                        hintText: "enter email",
                        keyboardType: TextInputType.emailAddress),
                    SizedBox(
                      height: 10,
                    ),
                    defaultTextForm(
                        controller: passwordController,
                        title: 'Password',
                        isPassword: true,
                        hintText: "enter password",
                        keyboardType: TextInputType.visiblePassword),
                    SizedBox(
                      height: 40,
                    ),
                    defaultButoon(
                        text: "Login",
                        function: () {
                          String myEmail = emailController.text;
                          String myPassword = passwordController.text;
                          if (myEmail.isEmpty || myPassword.isEmpty) {
                            showMyDialog(
                                context: context,
                                error: true,
                                text: "Please complete the missing data",
                                title: "Missing Data");
                            return;
                          }
                          LoginCubit.get(context).login(myEmail, myPassword);
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(child: captionText("Forgor Password ?"))
                  ],
                )),
          ),
        );
      },
    );
  }
}
