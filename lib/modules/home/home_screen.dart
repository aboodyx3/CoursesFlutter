import 'package:WorkShop/modules/home/cubit/cubit.dart';
import 'package:WorkShop/modules/home/cubit/states.dart';
import 'package:WorkShop/modules/welcome/welcome_screen.dart';
import 'package:WorkShop/network/online/dio_helper.dart';
import 'package:WorkShop/shared/colors/colors_common.dart';
import 'package:WorkShop/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeSignoutState) {
          navigateToAndRemove(context, WelcomeScreen());
        }
      },
      builder: (context, state) {
        var currentIndex = HomeCubit.get(context).currentIndex;
        return Scaffold(
          appBar: PreferredSize(
              child: AppBar(
                actions: [
                  IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                        color: Colors.black,
                      ),
                      onPressed: () {})
                ],
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {}),
                elevation: 0,
                backgroundColor: scaffoldColor,
              ),
              preferredSize: Size.fromHeight(40.0)),
          body: HomeCubit.get(context).screens[currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  spreadRadius: 2,
                  color: Colors.grey,
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                currentIndex: currentIndex,
                onTap: (int index) {
                  HomeCubit.get(context).changeIndex(index);
                },
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Search"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.folder), label: "Courses"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Profile"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "Settings")
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
