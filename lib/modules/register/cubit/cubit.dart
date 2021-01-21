import 'package:WorkShop/modules/register/cubit/states.dart';
import 'package:WorkShop/network/online/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterStateInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  register(
      String first, String last, String email, String password, String city) {
    emit(RegisterStateLoading());

    DioHelper().postData(path: "lms/api/v1/auth/signup-save", data: {
      "first_name": "$first",
      "last_name": "$last",
      "email": "$email",
      "password": "$password",
      "city": "$city",
    }).then((value) {
      print(value.data);
      emit(RegisterStateSuccess());
    }).catchError((e) {
      emit(RegisterStateError());
    });
  }
}
