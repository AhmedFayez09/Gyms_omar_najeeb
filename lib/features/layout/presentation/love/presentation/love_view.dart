import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gyms/config/user_local.dart';
import 'package:gyms/features/layout/presentation/widgets/custom_app_bar.dart';
import 'package:gyms/features/logic/favorite/favorite_cubit.dart';
import 'package:gyms/utils/styles/colors.dart';

class LoveView extends StatefulWidget {
  const LoveView({Key? key}) : super(key: key);

  @override
  State<LoveView> createState() => _LoveViewState();
}

class _LoveViewState extends State<LoveView> {
  @override
  void initState() {
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
        child:  CustomAppBar(title: 'Favourites',back: true,show: true),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              var cubit = FavoriteCubit.get(context);
              var favList = cubit.favoriteModel;
              return favList == null
                  ? const Center(
                      child: CircularProgressIndicator()
                    )
                  : ListView.builder(
                      itemCount: favList.data!.length,
                      itemBuilder: (context, index) {
                        var item = favList.data![index];
                        return GestureDetector(
                          // onTap: () {
                          //   Navigator.pushNamed(context, 'details-view');
                          // },
                          child: Container(
                            width: double.infinity,
                            height: 100.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 26.w, vertical: 25.h),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/banner11.png'),
                                  fit: BoxFit.fitWidth),
                            ),
                            child: Row(
                              children: [
                                // Image.asset('assets/images/banner12.png'),
                                Image.network(item.clubLogo!),
                                SizedBox(width: 10.w),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.clubName ?? '',
                                      style: TextStyle(
                                        color: AppColors.white1Color,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Row(
                                      children: [
                                        Image.asset('assets/images/doller.png'),
                                        SizedBox(width: 5.w),
                                        Text(
                                          '35 sar.',
                                          style: TextStyle(
                                            color: AppColors.white1Color,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        Image.asset(
                                            'assets/images/location.png'),
                                        SizedBox(width: 5.w),
                                        Text(
                                          '2 km.',
                                          style: TextStyle(
                                            color: AppColors.white1Color,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
            },
          ),),
    );
  }
}
