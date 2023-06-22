import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gyms/config/app_routes.dart';
import 'package:gyms/config/cache.dart';
import 'package:gyms/config/user_local.dart';
import 'package:gyms/features/logic/home/home_cubit.dart';
import 'package:gyms/features/splash/data/data_provider/local/my_config_cache.dart';
import 'package:gyms/features/splash/data/data_provider/local/my_config_cache_keys.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gyms/utils/constants/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getSplashBg();
    initSlidingAnimation();
    
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetSplashSuccess) {
          navigationToHome();
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        print("**********************************************************");
        print(cubit.splahBg);
        print("**********************************************************");
        print("**********************************************************");
        // return Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     AnimatedBuilder(
        //       animation: fadingAnimation!,
        //       builder: (context, child) {
        //         return Opacity(
        //           opacity: fadingAnimation!.value,
        //           child: Center(
        //             child: Padding(
        //               padding: EdgeInsets.symmetric(horizontal: 55.h),
        //               child: CachedNetworkImage(
        //                 imageUrl: cubit.splahBg ??
        //                     "https://res.cloudinary.com/ddj0r3yzi/image/upload/v1687001895/car3teol0pznr2hbfle1.jpg",
        //                 imageBuilder: (context, imageProvider) => Container(
        //                   decoration: BoxDecoration(
        //                     image: DecorationImage(
        //                         image: imageProvider,
        //                         fit: BoxFit.cover,
        //                         colorFilter: const ColorFilter.mode(
        //                             Colors.red, BlendMode.colorBurn)),
        //                   ),
        //                 ),
        //                 progressIndicatorBuilder:
        //                     (context, url, downloadProgress) => Container(
        //                   margin: EdgeInsets.only(top: 100.h, bottom: 100.h),
        //                   child: CircularProgressIndicator(
        //                       value: downloadProgress.progress,
        //                       color: Colors.black),
        //                 ),
        //                 // placeholder: (context, url) =>
        //                 //     const CircularProgressIndicator(),
        //                 errorWidget: (context, url, error) =>
        //                     const Icon(Icons.error),
        //               ),
        //               // Image.network(cubit.splahBg ?? "https://res.cloudinary.com/ddj0r3yzi/image/upload/v1687001895/car3teol0pznr2hbfle1.jpg" ),
        //               // Image.asset(AppAssets.logoImage),
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   ],
        // );

        return Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 300.h,
            width: 300.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: cubit.splahBg ??
                    "https://wallpapers.com/images/featured/xbsfzsltjksfompa.jpg",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                          Colors.transparent, BlendMode.colorBurn),
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Container(
                  margin: EdgeInsets.only(top: 100.h, bottom: 100.h),
                  child: Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress, color: Colors.black),
                  ),
                ),
                // placeholder: (context, url) =>
                //     const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        );
      },
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(animationController!);

    animationController!.repeat(reverse: true);
  }

  void navigationToHome() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        UserLoacl.check == true
            ? Navigator.pushReplacementNamed(context, AppRoute.layoutView)
            : Navigator.pushReplacementNamed(context, AppRoute.checkView);
      },
    );
  }
}
