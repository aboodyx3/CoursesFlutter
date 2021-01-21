import 'package:WorkShop/modules/courses/cubit/cubit.dart';
import 'package:WorkShop/modules/home/cubit/cubit.dart';
import 'package:WorkShop/modules/home/home_screen.dart';
import 'package:WorkShop/modules/login/cubit/cubit.dart';
import 'package:WorkShop/modules/register/cubit/cubit.dart';
import 'package:WorkShop/modules/welcome/welcome_screen.dart';
import 'package:WorkShop/network/online/dio_helper.dart';
import 'package:WorkShop/shared/colors/colors_common.dart';
import 'package:WorkShop/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget widget;

  await initPref().then((value) {
    if (getToken() != null && getToken().length > 0) {
      widget = HomeScreen();
    } else {
      widget = WelcomeScreen();
    }
  });
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget widget;
  MyApp(this.widget);
  @override
  Widget build(BuildContext context) {
    DioHelper();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => RegisterCubit(),
        ),
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context) => HomeCubit()),
        BlocProvider(create: (BuildContext context) => CoursesCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: scaffoldColor,
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(color: defaultColor1),
          ),
          home: widget),
    );
  }
}
