import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gyms/config/user_local.dart';
import 'package:gyms/features/logic/models/favorite_model.dart';
import 'package:gyms/utils/service/dio_helper.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);
  DioHelper dioHelper = DioHelper();
  FavoriteModel? favoriteModel;
  void getFavoriteList() {
    emit(GetFavoriteListLoading());
    dioHelper
        .getData(
      endPoint: 'user/fav',
      token: UserLoacl.token,
    )
        .then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);
      emit(GetFavoriteListSuccess());
    }).catchError((e) {
      emit(GetFavoriteListError());
    });
  }

  void addOrRemoveFav({required String id}) {
    emit(AddOrRemoveFavLoading());
    dioHelper
        .putData(
      endPoint: 'user/fav/$id',
      token: UserLoacl.token,
    )
        .then((value) {
      emit(AddOrRemoveFavSuccess());
    }).catchError((e) {
      emit(AddOrRemoveFavError());
    });
  }
}
