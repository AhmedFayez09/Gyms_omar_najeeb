import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gyms/features/logic/models/rules_model.dart';
import 'package:gyms/utils/service/dio_helper.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  DioHelper dioHelper = DioHelper();
  RulesModel? rules;
  String? about;
  void getRoules() {
    emit(GetRulesLoading());
    dioHelper.getData(endPoint: 'user/rules').then(
      (value) {
        rules = RulesModel.fromJson(value.data);
        if (rules != null) {
          rules!.rules!.forEach((element) {
            if (element.type == 'uses') {
              about = element.textBody;
            }
          });
        }
        emit(GetRulesSuccess());
      },
    ).catchError((e) {
      emit(GetRulesError());
    });
  }
}
