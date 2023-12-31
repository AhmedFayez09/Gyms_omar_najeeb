import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyms/features/layout/presentation/widgets/custom_app_bar.dart';
import 'package:gyms/features/logic/profile/profile_cubit.dart';
import 'package:gyms/utils/constants/assets.dart';
import 'package:gyms/utils/styles/colors.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  void initState() {
    context.read<ProfileCubit>().getRoules();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1Color,
      // drawer: Drawer(
      //   backgroundColor: AppColors.black2Color,
      //   child: SafeArea(
      //     child: Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      //       child: Column(
      //         children: [
      //           Row(
      //             children: [
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.pop(context);
      //                 },
      //                 child: Icon(
      //                   Icons.close,
      //                   size: 26.sp,
      //                   color: AppColors.white1Color,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(height: 15.h),
      //           Row(
      //             children: [
      //               Text(
      //                 'Wallet',
      //                 style: GoogleFonts.albertSans(
      //                   color: AppColors.white1Color,
      //                   fontSize: 22.sp,
      //                   fontWeight: FontWeight.w900,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(height: 12.h),
      //           Row(
      //             children: [
      //               Text(
      //                 'Subscription',
      //                 style: GoogleFonts.albertSans(
      //                   color: AppColors.white1Color,
      //                   fontSize: 22.sp,
      //                   fontWeight: FontWeight.w900,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(height: 12.h),
      //           Row(
      //             children: [
      //               Text(
      //                 'Booking',
      //                 style: GoogleFonts.albertSans(
      //                   color: AppColors.white1Color,
      //                   fontSize: 22.sp,
      //                   fontWeight: FontWeight.w900,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(height: 12.h),
      //           Row(
      //             children: [
      //               Text(
      //                 'Language',
      //                 style: GoogleFonts.albertSans(
      //                   color: AppColors.white1Color,
      //                   fontSize: 22.sp,
      //                   fontWeight: FontWeight.w900,
      //                 ),
      //               ),
      //               Container(
      //                 margin: EdgeInsets.only(left: 8.w),
      //                 padding: EdgeInsets.symmetric(
      //                     horizontal: 6.5.w, vertical: 2.h),
      //                 decoration: BoxDecoration(
      //                   color: AppColors.white1Color,
      //                   borderRadius: BorderRadius.circular(40.sp),
      //                 ),
      //                 child: Text(
      //                   'English',
      //                   style: GoogleFonts.albertSans(
      //                     color: AppColors.black2Color,
      //                     fontSize: 20.sp,
      //                     fontWeight: FontWeight.w900,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(height: 12.h),
      //           Row(
      //             children: [
      //               Text(
      //                 'Support',
      //                 style: GoogleFonts.albertSans(
      //                   color: AppColors.white1Color,
      //                   fontSize: 22.sp,
      //                   fontWeight: FontWeight.w900,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(height: 12.h),
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.pushNamed(context, 'privacy-view');
      //             },
      //             child: Row(
      //               children: [
      //                 Text(
      //                   'Privacy and Policy',
      //                   style: GoogleFonts.albertSans(
      //                     color: AppColors.white1Color,
      //                     fontSize: 22.sp,
      //                     fontWeight: FontWeight.w900,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(height: 12.h),
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.pushNamed(context, 'about-view');
      //             },
      //             child: Row(
      //               children: [
      //                 Text(
      //                   'About',
      //                   style: GoogleFonts.albertSans(
      //                     color: AppColors.white1Color,
      //                     fontSize: 22.sp,
      //                     fontWeight: FontWeight.w900,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(height: 8.h),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
     
     
     
     
     
     
     
     
     
     
     
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          50.h,
        ),
        child:  CustomAppBar(title: 'About Us',back: true),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.infoIcon),
            SizedBox(height: 10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    var cubit = ProfileCubit.get(context);
                    return Text(
                      cubit.about ?? '',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.albertSans(
                        color: AppColors.grey2Color,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.sp,
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
