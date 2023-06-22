import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gyms/config/user_local.dart';
import 'package:gyms/features/logic/models/all_clubs.dart';
import 'package:gyms/features/logic/models/best_model.dart';
import 'package:gyms/features/logic/models/booking_model.dart';
import 'package:gyms/features/logic/models/club_details_model.dart';
import 'package:gyms/features/logic/models/clubs_details_in_auth_model.dart';
import 'package:gyms/features/logic/models/get_wallet.dart';
import 'package:gyms/features/logic/models/nearby_model.dart';
import 'package:gyms/utils/service/dio_helper.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();
  AllClubsModel? allClubs;
  BestModel? bestClubs;
  AllClubsModel? lowestClubs;
  NearbyModel? nearbyClubs;
  void getAllClubs() async {
    emit(GetAllClubsLoading());
    dioHelper.getData(endPoint: ApiPath.allClubs).then((value) {
      allClubs = AllClubsModel.fromJson(value.data);
      emit(GetAllClubsSuccess());
    }).catchError((e) {
      emit(GetAllClubsError());
    });
  }

  void getbestClubs() {
    emit(GetBestdCulbLoading());
    dioHelper.getData(
      endPoint: ApiPath.filterClubs(filter: 'best'),
      body: {
        'lat': UserLoacl.lat,
        'long': UserLoacl.long,
      },
    ).then((value) {
      bestClubs = BestModel.fromJson(value.data);
      emit(GetBestdCulbSuccess());
    }).catchError((e) {
      emit(GetBestdCulbError());
    });
  }

  void getlowestClubs() {
    emit(GetlowestCulbLoading());
    dioHelper
        .getData(endPoint: ApiPath.filterClubs(filter: 'lowest'))
        .then((value) {
      print(
          "*****************************lowestClubs*********************************************");
      print(value.data);
      print(
          "*****************************lowestClubs *********************************************");
      lowestClubs = AllClubsModel.fromJson(value.data);
      emit(GetlowestCulbSuccess());
    }).catchError((e) {
      emit(GetlowestCulbError());
    });
  }

  void getNearbyClubs() {
    emit(GetnearbyCulbLoading());
    dioHelper
        .getData(
      endPoint: ApiPath.getNearby(
          lat: UserLoacl.lat ?? 00, long: UserLoacl.long ?? 00),
    )
        .then((value) {
      nearbyClubs = NearbyModel.fromJson(value.data);
      emit(GetnearbyCulbSuccess());
    }).catchError((e) {
      emit(GetnearbyCulbError());
    });
  }

  ClubDetailsModel? clubDetailsModel;
  void getClubDetails({required String clubId}) {
    emit(GetClubDetailsLoading());
    dioHelper
        .getData(endPoint: ApiPath.getClubDetails(clubId: clubId))
        .then((value) {
      clubDetailsModel = ClubDetailsModel.fromJson(value.data);
      emit(GetClubDetailsSuccess());
    }).catchError(((e) {
      emit(GetClubDetailsError());
    }));
  }

  ClubDetailsInAuthModel? clubDetailsInAuthModel;
  void getClubDetailsInAuth({
    required String clubId,
    required String lat,
    required String long,
  }) {
    emit(GetClubDetailsInAuthLoading());
    dioHelper
        .getData(
      endPoint: ApiPath.getClubDetailsInAuth(
        clubId: clubId,
        lat: lat,
        long: long,
      ),
      token: UserLoacl.token,
    )
        .then((value) {
      clubDetailsInAuthModel = ClubDetailsInAuthModel.fromJson(value.data);
      log("In Home Club The sub is ${clubDetailsInAuthModel!.sub ?? 'The sub is null'}");
      emit(GetClubDetailsInAuthSuccess());
    }).catchError((e) {
      print(e);
      emit(GetClubDetailsInAuthError());
    });
  }

  String? banner;
  void getBanner() {
    emit(GetBannerHomeLoading());
    dioHelper.getData(endPoint: ApiPath.getBanner).then((value) {
      banner = value.data['banner'];
      emit(GetBannerHomeSuccess());
    }).catchError((e) {
      emit(GetBannerHomeError());
    });
  }

  String? splahBg;

  void getSplashBg() {
    emit(GetSplashLoading());
    dioHelper.getData(endPoint: 'user/rules?type=app_bg').then((value) {
      splahBg = value.data['app_bg'];
      log("splash /////////////// =>     .. ${splahBg}");
      emit(GetSplashSuccess());
    }).catchError((e) {
      emit(GetSplashError());
    });
  }

  BookingModel? bookingModel;
  List<Subs>? finishedBooking = [];
  List<Subs>? newBooking = [];

  void allBooking() {
    finishedBooking = [];
    newBooking = [];
    emit(GetBookingLoading());
    dioHelper
        .getData(
      endPoint: "user/booking",
      token: UserLoacl.token,
    )
        .then((value) {
      bookingModel = BookingModel.fromJson(value.data);
      bookingModel!.subs!.forEach((e) {
        if (e.expired == true) {
          finishedBooking!.add(e);
        } else {
          newBooking!.add(e);
        }
      });
      emit(GetBookingSuccess());
    }).catchError((e) {
      print(e);
      emit(GetBookingError());
    });
  }

  WalletModel? walletModel;
  void getWalleet() {
    emit(GetWalleetLoading());
    dioHelper
        .getData(
      endPoint: "user/wallet",
      token: UserLoacl.token,
    )
        .then((value) {
      walletModel = WalletModel.fromJson(value.data);
      print(value.data);
      emit(GetWalleetSuccess());
    }).catchError((e) {
      emit(GetWalleetError());
    });
  }

  AllClubsModel? searchedClubs;

  void getSearchedListClub({required String searched}) {
    emit(GetSearchedListLoading());
    dioHelper
        .getData(
      endPoint: 'user/club?search=$searched',
    )
        .then((value) {
      searchedClubs = AllClubsModel.fromJson(value.data);
      emit(GetSearchedListSuucess());
    }).catchError((e) {
      emit(GetSearchedListError());
    });
  }
}
