import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyms/config/app_routes.dart';
import 'package:gyms/config/user_local.dart';
import 'package:gyms/features/layout/presentation/home/presentation/widgets/custom_search_bar.dart';
import 'package:gyms/features/layout/presentation/home/presentation/widgets2/all_clubs_wigets.dart';
import 'package:gyms/features/layout/presentation/home/presentation/widgets2/beat_clubs.dart';
import 'package:gyms/features/layout/presentation/home/presentation/widgets2/lowest_clubs.dart';
import 'package:gyms/features/layout/presentation/home/presentation/widgets2/nearby_clubs.dart';
import 'package:gyms/features/layout/presentation/widgets/custom_app_bar.dart';
import 'package:gyms/features/logic/home/home_cubit.dart';

import 'package:gyms/utils/styles/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  void initState() {
    context.read<HomeCubit>().getBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      backgroundColor: AppColors.grey1Color,
      drawer: Drawer(
        backgroundColor: AppColors.black2Color,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: 26.sp,
                        color: AppColors.white1Color,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Text(
                      'Wallet',
                      style: GoogleFonts.albertSans(
                        color: AppColors.white1Color,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Text(
                      'Subscription',
                      style: GoogleFonts.albertSans(
                        color: AppColors.white1Color,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Text(
                      'Booking',
                      style: GoogleFonts.albertSans(
                        color: AppColors.white1Color,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Text(
                      'Language',
                      style: GoogleFonts.albertSans(
                        color: AppColors.white1Color,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 6.5.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: AppColors.white1Color,
                        borderRadius: BorderRadius.circular(40.sp),
                      ),
                      child: Text(
                        'English',
                        style: GoogleFonts.albertSans(
                          color: AppColors.black2Color,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'support-view');
                  },
                  child: Row(
                    children: [
                      Text(
                        'Support',
                        style: GoogleFonts.albertSans(
                          color: AppColors.white1Color,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'privacy-view');
                  },
                  child: Row(
                    children: [
                      Text(
                        'Privacy and Policy',
                        style: GoogleFonts.albertSans(
                          color: AppColors.white1Color,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'about-view');
                  },
                  child: Row(
                    children: [
                      Text(
                        'About',
                        style: GoogleFonts.albertSans(
                          color: AppColors.white1Color,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),

UserLoacl.token == null
          ? Center(
            child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(
                          horizontal: 40.w,
                          vertical: 7.h,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.loginView);
                    },
                    child: const Text(
                      "Join Us",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )),
              ),
          ): SizedBox.shrink()


              ],
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          50.h,
        ),
        child:  CustomAppBar(title: 'HOME'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image.asset(AppAssets.mainBannerImage),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                var cubit = HomeCubit.get(context);
                return Container(
                  width: double.infinity,
                  height: 100.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(cubit.banner ??
                            "https://res.cloudinary.com/ddj0r3yzi/image/upload/v1687192328/j90fdljjcfdko0bqquy6.png"),
                        // AssetImage('assets/images/banner1.png'),
                        fit: BoxFit.fitWidth),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 34.w, vertical: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The Best way',
                          style: TextStyle(
                            color: AppColors.white1Color,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'To improve',
                          style: TextStyle(
                            color: AppColors.white1Color,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Body',
                          style: TextStyle(
                            color: AppColors.white1Color,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
            const CustomSearchBar(),
            SizedBox(height: 20.h),
            SizedBox(
              child: TabBar(
                controller: tabController,
                isScrollable: true,
                labelColor: AppColors.black2Color,
                unselectedLabelColor: AppColors.grey2Color,
                indicator: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(color: AppColors.black2Color, width: 1.w),
                  ),
                ),
                tabs: const [
                  Tab(text: 'All Clubs'),
                  Tab(text: 'Nearby'),
                  Tab(text: 'Best'),
                  Tab(text: 'Lowest price High rating'),
                ],
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 1.6,
              child: TabBarView(
                controller: tabController,
                children: [
                  AllClubsWidget(),
                  NearbyClubs(),
                  BestClubs(),
                  LowestClubs(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CircleTabIndicator extends Decoration {
//   final Color color;
//   double radius;

//   CircleTabIndicator({Key? key, required this.color, required this.radius});

//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     return CirclePainter(color: color, radius: radius);
//   }
// }

// class CirclePainter extends BoxPainter {
//   final double radius;
//   late Color color;

//   CirclePainter({required this.color, required this.radius});

//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
//     late Paint paint;
//     paint = Paint()..color = color;
//     paint = paint..isAntiAlias = true;
//     final Offset circleOffset = Offset(8.w, cfg.size!.height - radius);
//     canvas.drawCircle(circleOffset, radius, paint);
//   }
// }
