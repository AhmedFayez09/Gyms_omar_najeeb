import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gyms/utils/styles/colors.dart';

class ClubItem extends StatelessWidget {
  ClubItem({
    super.key,
    required this.clubName,
    required this.onTap,
    required this.city,
    required this.image
  });
  VoidCallback onTap;
  String clubName;
  String city;
  String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        width: double.infinity,
        // height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 26.w,vertical: 10.h),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          image: const DecorationImage(
              image: AssetImage('assets/images/banner11.png'),
              fit: BoxFit.fitWidth),
        ),
        child: Row(
          children: [
            Image.network(image,width: 50.w,height: 50.h,),
            SizedBox(width: 10.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clubName,
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
                    Image.asset('assets/images/location.png'),
                    SizedBox(width: 5.w),
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        city,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.white1Color,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
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
  }
}
