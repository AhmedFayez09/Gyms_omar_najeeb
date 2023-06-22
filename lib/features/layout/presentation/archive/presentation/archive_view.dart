import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyms/config/user_local.dart';
import 'package:gyms/features/layout/presentation/widgets/custom_app_bar.dart';
import 'package:gyms/features/logic/home/home_cubit.dart';
import 'package:gyms/features/logic/models/booking_model.dart';
import 'package:gyms/utils/constants/assets.dart';
import 'package:gyms/utils/pop_uo.dart';
import 'package:gyms/utils/styles/colors.dart';

class ArchiveView extends StatefulWidget {
  const ArchiveView({Key? key}) : super(key: key);

  @override
  State<ArchiveView> createState() => _ArchiveViewState();
}

class _ArchiveViewState extends State<ArchiveView> {
  @override
  void initState() {
    context.read<HomeCubit>().allBooking();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1Color,
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          50.h,
        ),
        child:  CustomAppBar(title: 'My Booking',back: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 10.h),
              child: Row(
                children: [
                  Text(
                    'Now',
                    style: GoogleFonts.albertSans(
                      color: AppColors.black2Color,
                      fontWeight: FontWeight.w900,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 6.h),
            SizedBox(
                height: 200.h,
                child: BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {
                    if (state is GetClubDetailsSuccess) {
                      Navigator.pushNamed(context, 'details-view');
                    } else if (state is GetClubDetailsError) {
                      flutterToast(
                          msg: 'Some Thing Error',
                          color: Theme.of(context).primaryColor);
                    }
                  },
                  builder: (context, state) {
                    var cubit = HomeCubit.get(context);
                    var list = cubit.newBooking;
                    return list!.isEmpty
                        ? Text('No')
                        : ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              width: 15.w,
                            ),
                            itemCount: list.length,
                            padding: EdgeInsets.only(left: 15.w),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var item = list[index];
                              return InkWell(
                                onTap: () {
                                  cubit.getClubDetails(clubId: item.sId!);
                                  cubit.getClubDetailsInAuth(
                                    clubId: item.sId!,
                                    lat: UserLoacl.lat.toString(),
                                    long: UserLoacl.long.toString(),
                                  );
                                },
                                child: Container(
                                  width: 160.w,
                                  height: 180.h,
                                  // margin: EdgeInsets.symmetric(horizontal: 15.w),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/banner15.png'),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(vertical: 10.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.network(
                                            item.clubLogo ?? '',
                                            width: 90.w,
                                            height: 70.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          item.clubName ?? '',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: AppColors.black2Color,
                                            fontSize: 16.8.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        // Text(
                                        //   'Ex : ${item.expireIn}',
                                        //   style: TextStyle(
                                        //     color: Color(0xFF4E5153),
                                        //     fontSize: 14.8.sp,
                                        //     fontWeight: FontWeight.w500,
                                        //   ),
                                        // ),
                                        SizedBox(height: 20.h),
                                        Text(
                                          '${item.price} sar.',
                                          style: TextStyle(
                                            color: AppColors.white1Color,
                                            fontSize: 13.8.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '${item.expireIn} days',
                                          style: TextStyle(
                                            color: AppColors.white1Color,
                                            fontSize: 13.8.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                  },
                )),
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ///
            ///
            ///

            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 10.h),
              child: Row(
                children: [
                  Text(
                    'Finished',
                    style: GoogleFonts.albertSans(
                      color: AppColors.black2Color,
                      fontWeight: FontWeight.w900,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is GetClubDetailsSuccess) {
                  Navigator.pushNamed(context, 'details-view');
                } else if (state is GetClubDetailsError) {
                  flutterToast(
                      msg: 'Some Thing Error',
                      color: Theme.of(context).primaryColor);
                }
              },
              builder: (context, state) {
                var cubit = HomeCubit.get(context);
                var list = cubit.finishedBooking;
                return list!.isEmpty
                    ? const Text("No")
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(left: 10),
                        // physics: const BouncingScrollPhysics(
                        //           parent: AlwaysScrollableScrollPhysics()),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 0.2,
                          mainAxisSpacing: 5.0,
                          maxCrossAxisExtent: 220,
                        ),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          Subs item = list[index];
                          return InkWell(
                            onTap: () {
                              cubit.getClubDetails(clubId: item.clubId!);
                              cubit.getClubDetailsInAuth(
                                clubId: item.clubId!,
                                lat: UserLoacl.lat.toString(),
                                long: UserLoacl.long.toString(),
                              );
                            },
                            child: Container(
                              width: 160.w,
                              height: 180.h,
                              margin: EdgeInsets.only(right: 10.w),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/banner15.png'),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 20.h),
                                  Image.network(
                                    item.clubLogo ?? '',
                                    width: 50.w,
                                    height: 70.h,
                                  ),
                                  Text(
                                    item.clubName ?? '',
                                    style: TextStyle(
                                      color: AppColors.black2Color,
                                      fontSize: 16.8.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Finished',
                                    style: TextStyle(
                                      color: Color(0xFF4E5153),
                                      fontSize: 14.8.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 14.h),
                                  Text(
                                    '${item.price} sar.',
                                    style: TextStyle(
                                      color: AppColors.white1Color,
                                      fontSize: 13.8.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  // Text(
                                  //   's days',
                                  //   style: TextStyle(
                                  //     color: AppColors.white1Color,
                                  //     fontSize: 13.8.sp,
                                  //     fontWeight: FontWeight.w600,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
