import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gyms/config/cache.dart';
import 'package:gyms/features/logic/models/login_model.dart';
import 'package:gyms/utils/service/dio_helper.dart';
import 'package:meta/meta.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();
  LoginModel? loginModel;
  void register({
    required String username,
    required String homeLocation,
    required String phone,
    required String email,
    required String password,
  }) {
    emit(RegisterLoading());
    dioHelper.postData(
      endPoint: ApiPath.register,
      body: {
        "username": username,
        "home_location": homeLocation,
        "phone": phone,
        "email": email,
        "password": password,
        "gender": "male"
      },
    ).then((value) {
      emit(RegisterSuccess());
    }).catchError((e) {
      print(e);
      emit(RegisterError());
    });
  }

  void login({
    required String email,
    required String password,
  }) {
    emit(LoginLoading());
    dioHelper.postData(
      endPoint: ApiPath.login,
      body: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print('Success');
      String token = value.data['token'];
      CacheHelper.saveData(key: MyCacheMy.token, value: token);
      CacheHelper.saveData(
          key: MyCacheMy.username, value: loginModel!.user!.username);
      CacheHelper.saveData(
          key: MyCacheMy.userEmail, value: loginModel!.user!.email);
      CacheHelper.saveData(
          key: MyCacheMy.userPhone, value: loginModel!.user!.phone);
      CacheHelper.saveData(
          key: MyCacheMy.usercity, value: loginModel!.user!.homeLocation);
      if (loginModel!.user!.role == 'client') {
        emit(LoginSuccess());
      } else {
        emit(UnClientState());
      }
    }).catchError((e) {
      print(e);
      emit(LoginError());
    });
  }
}
