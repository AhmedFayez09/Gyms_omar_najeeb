import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gyms/config/app_routes.dart';
import 'package:gyms/features/logic/home/home_cubit.dart';

class GymsApp extends StatefulWidget {
  const GymsApp({Key? key}) : super(key: key);

  @override
  State<GymsApp> createState() => _GymsAppState();
}

class _GymsAppState extends State<GymsApp> {
  @override
  void initState() {
   context.read<HomeCubit>().getSplashBg();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Gill Sans',
          ),
          title: 'Gyms App',
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: 'splash-view',
        );
      },
    );
  }
}
