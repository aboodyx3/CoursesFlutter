import 'package:WorkShop/modules/courses/courses_screen.dart';
import 'package:WorkShop/modules/home/cubit/states.dart';
import 'package:WorkShop/modules/profile/profile_screen.dart';
import 'package:WorkShop/modules/search/search_screen.dart';
import 'package:WorkShop/modules/settings/settings_screen.dart';
import 'package:WorkShop/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  var screens = [
    SearchScreen(),
    CoursesScreen(),
    ProfileScreen(),
    SettingsScreen()
  ];

  var titles = ["Search", "Courses", "Profile", "Settings"];

  changeIndex(index) {
    currentIndex = index;
    emit(HomeChangeIndexState());
  }

  signOut() async {
    await removeToken();

    emit(HomeSignoutState());
  }
}
