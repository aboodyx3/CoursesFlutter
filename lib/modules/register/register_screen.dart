import 'package:WorkShop/modules/login/login_screen.dart';
import 'package:WorkShop/modules/register/cubit/cubit.dart';
import 'package:WorkShop/modules/register/cubit/states.dart';
import 'package:WorkShop/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final firstController = TextEditingController();

  final lastController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterStateSuccess) {
          navigateToAndRemove(
              context,
              LoginScreen(
                email: emailController.text,
                password: passwordController.text,
              ));
        }

        if (state is RegisterStateLoading) {
          showMyDialog(
              context: context,
              text: "Please wait until creating your account",
              title: "Please Wait..");
        }
        if (state is RegisterStateError) {
          Navigator.of(context).pop();
          showMyDialog(
              context: context,
              error: true,
              text: "This Email is already used",
              title: "Wrong email");
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Register"),
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    logo(),
                    defaultTextForm(
                        controller: firstController,
                        title: 'First name',
                        hintText: "enter first name",
                        keyboardType: TextInputType.name),
                    SizedBox(
                      height: 10,
                    ),
                    defaultTextForm(
                        controller: lastController,
                        title: 'Last name',
                        hintText: "enter last name",
                        keyboardType: TextInputType.name),
                    SizedBox(
                      height: 10,
                    ),
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
                        hintText: "enter password",
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword),
                    SizedBox(
                      height: 10,
                    ),
                    defaultTextForm(
                        controller: cityController,
                        title: 'City',
                        hintText: "enter city",
                        keyboardType: TextInputType.name),
                    SizedBox(
                      height: 40,
                    ),
                    defaultButoon(
                        text: "register",
                        function: () {
                          String myFirst = firstController.text;
                          String myLast = lastController.text;
                          String myEmail = emailController.text;
                          String myPassword = passwordController.text;
                          String myCity = cityController.text;
                          if (myFirst.isEmpty ||
                              myLast.isEmpty ||
                              myEmail.isEmpty ||
                              myPassword.isEmpty ||
                              myCity.isEmpty) {
                            showMyDialog(
                                context: context,
                                error: true,
                                text: "Please complete the missing data",
                                title: "Missing data");
                            return;
                          }
                          RegisterCubit.get(context).register(
                              myFirst, myLast, myEmail, myPassword, myCity);
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
