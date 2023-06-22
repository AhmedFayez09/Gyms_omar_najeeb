import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gyms/config/bloc_observer.dart';
import 'package:gyms/config/cache.dart';
import 'package:gyms/features/logic/auth/auth_cubit.dart';
import 'package:gyms/features/logic/favorite/favorite_cubit.dart';
import 'package:gyms/features/logic/home/home_cubit.dart';
import 'package:gyms/features/logic/payment/payment_cubit.dart';
import 'package:gyms/features/logic/profile/profile_cubit.dart';
import 'package:gyms/features/logic/report/report_cubit.dart';
import 'package:gyms/gyms_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await CacheHelper.initCacheHelper();
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (c) => AuthCubit()),
    BlocProvider(create: (c) => PaymentCubit()),
    BlocProvider(create: (c) => ReportCubit()),
    BlocProvider(create: (c) => FavoriteCubit()..getFavoriteList()),
    BlocProvider(create: (c) => ProfileCubit()..getRoules()),
    BlocProvider(
      create: (c) => HomeCubit()
        ..getAllClubs()
        ..getbestClubs()
        ..getlowestClubs()
        ..getNearbyClubs()
        ..getBanner()
        ..getSplashBg()
        ..allBooking()
        ..getWalleet(),
    ),
  ], child: const GymsApp()));
}
