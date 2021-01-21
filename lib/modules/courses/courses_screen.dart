import 'package:WorkShop/modules/courses/cubit/cubit.dart';
import 'package:WorkShop/modules/courses/cubit/states.dart';
import 'package:WorkShop/modules/search/search_screen.dart';
import 'package:WorkShop/shared/components/components.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CategortModel> category = [
      CategortModel("Mobile App", Icons.access_alarm),
      CategortModel("Front End", Icons.access_alarm),
      CategortModel("Back End", Icons.access_alarm),
      CategortModel("UI & UX", Icons.access_alarm),
      CategortModel("AI", Icons.access_alarm),
      CategortModel("ML", Icons.access_alarm),
      CategortModel("IOT", Icons.access_alarm),
    ];
    CoursesCubit.get(context).getCourses();

    return BlocConsumer<CoursesCubit, CoursesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var courses = CoursesCubit.get(context).courses;
          print("lol");
          return ConditionalBuilder(
            condition: state is! CoursesLoadingState,
            builder: (context) => Scaffold(
                body: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Courses",
                    style: TextStyle(fontSize: 30),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
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
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      itemBuilder: (context, index) =>
                          searchItemBuilderExpanded(courses[index]),
                      itemCount: courses.length,
                      physics: BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                    ),
                  ))
                ],
              ),
            )),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        });
  }
}
