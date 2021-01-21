import 'package:WorkShop/modules/courses/cubit/states.dart';
import 'package:WorkShop/network/online/dio_helper.dart';
import 'package:WorkShop/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesCubit extends Cubit<CoursesStates> {
  CoursesCubit() : super(CoursesInitialState());

  static CoursesCubit get(context) => BlocProvider.of(context);

  List courses = [];

  getCourses() {
    emit(CoursesLoadingState());
    DioHelper()
        .postData(path: "lms/api/v1/courses", token: getToken())
        .then((value) {
      courses = value.data["result"]["data"] as List;
      emit(CoursesSuccessState());
    }).catchError((e) {
      emit(CoursesErrorState());
    });
  }
}
