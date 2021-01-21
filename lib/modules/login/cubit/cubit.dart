import 'package:WorkShop/modules/login/cubit/states.dart';
import 'package:WorkShop/network/online/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:WorkShop/shared/components/components.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  login(String email, String password) {
    emit(LoginLoadingState());

    DioHelper().postData(path: "lms/oauth/token", data: {
      "username": "$email",
      "password": "$password",
      "client_secret": "UFj2FJ7X2jQfSjtptUIadua4rb0yeZjKvVaS55T9",
      "grant_type": "password",
      "client_id": "1"
    }).then((value) {
      saveToken(value.data['access_token']);
      emit(LoginSuccessState());
    }).catchError((e) {
      emit(LoginErrorState());
    });
  }
}
