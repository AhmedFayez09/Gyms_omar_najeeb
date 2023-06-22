import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyms/features/logic/auth/auth_cubit.dart';
import 'package:gyms/utils/pop_uo.dart';
import 'package:gyms/utils/styles/colors.dart';

class SignUpViewBody extends StatelessWidget {
  TextEditingController nameCotroller = TextEditingController();
  TextEditingController locationCotroller = TextEditingController();
  TextEditingController emailCotroller = TextEditingController();
  TextEditingController passwrodCotroller = TextEditingController();
  TextEditingController phoneCotroller = TextEditingController();

  SignUpViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h, right: 60.w),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.albertSans(
                      color: AppColors.white1Color,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                children: [
                  Text(
                    'User Name',
                    style: GoogleFonts.albertSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      height: 1.h,
                      color: AppColors.white1Color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              height: 40.h,
              child: TextFormField(
                // textAlign: TextAlign.right,
                keyboardType: TextInputType.emailAddress,
                controller: nameCotroller,
                cursorColor: AppColors.borderColor,
                cursorHeight: 18.h,
                // textDirection: TextDirection.rtl,
                style: GoogleFonts.albertSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  // height: 1.h,
                  color: AppColors.black1Color,
                ),
                decoration: InputDecoration(
                  fillColor: AppColors.white1Color,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 0.8.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 0.8.w,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 0.8.w,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                children: [
                  Text(
                    'Location',
                    style: GoogleFonts.albertSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      height: 1.h,
                      color: AppColors.white1Color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              height: 40.h,
              child: TextFormField(
                // textAlign: TextAlign.right,
                keyboardType: TextInputType.emailAddress,
                controller: locationCotroller,
                cursorColor: AppColors.borderColor,
                cursorHeight: 18.h,
                // textDirection: TextDirection.rtl,
                style: GoogleFonts.albertSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  // height: 1.h,
                  color: AppColors.black1Color,
                ),
                decoration: InputDecoration(
                  fillColor: AppColors.white1Color,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 0.8.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 0.8.w,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 0.8.w,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                children: [
                  Text(
                    'Phone',
                    style: GoogleFonts.albertSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      height: 1.h,
                      color: AppColors.white1Color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              height: 40.h,
              child: TextFormField(
                // textAlign: TextAlign.right,
                keyboardType: TextInputType.emailAddress,
                controller: phoneCotroller,
                cursorColor: AppColors.borderColor,
                cursorHeight: 18.h,
                // textDirection: TextDirection.rtl,
                style: GoogleFonts.albertSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  // height: 1.h,
                  color: AppColors.black1Color,
                ),
                decoration: InputDecoration(
                  fillColor: AppColors.white1Color,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 0.8.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 0.8.w,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 0.8.w,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                children: [
                  Text(
                    'Email',
                    style: GoogleFonts.albertSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      height: 1.h,
                      color: AppColors.white1Color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              height: 40.h,
              child: TextFormField(
                // textAlign: TextAlign.right,
                keyboardType: TextInputType.emailAddress,
                controller: emailCotroller,
                cursorColor: AppColors.borderColor,
                cursorHeight: 18.h,
                // textDirection: TextDirection.rtl,
                style: GoogleFonts.albertSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  // height: 1.h,
                  color: AppColors.black1Color,
                ),
                decoration: InputDecoration(
                  fillColor: AppColors.white1Color,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 0.8.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 0.8.w,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 0.8.w,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                children: [
                  Text(
                    'Password',
                    style: GoogleFonts.albertSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      height: 1.h,
                      color: AppColors.white1Color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              height: 40.h,
              child: TextFormField(
                // textAlign: TextAlign.right,
                keyboardType: TextInputType.emailAddress,
                controller: passwrodCotroller,
                cursorColor: AppColors.borderColor,
                cursorHeight: 18.h,
                // textDirection: TextDirection.rtl,
                style: GoogleFonts.albertSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  // height: 1.h,
                  color: AppColors.black1Color,
                ),
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: AppColors.white1Color,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 0.8.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 0.8.w,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 0.8.w,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'loginView', (route) => false);
                } else if (state is RegisterError) {
                  flutterToast(
                      msg: "Some Thing has Error",
                      color: Theme.of(context).primaryColor);
                }
              },
              builder: (context, state) {
                var cubit = AuthCubit.get(context);
                return GestureDetector(
                  onTap: () {
                    cubit.register(
                      username: nameCotroller.text,
                      homeLocation: locationCotroller.text,
                      phone: phoneCotroller.text,
                      email: emailCotroller.text,
                      password: passwrodCotroller.text,
                    );
                  },
                  child: Container(
                    // width: 327.w,
                    margin: EdgeInsets.symmetric(horizontal: 32.w),
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.white1Color,
                      borderRadius: BorderRadius.circular(18.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey2Color.withOpacity(0.06),
                          offset: const Offset(0, 2),
                          spreadRadius: 0.2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: state is RegisterLoading
                          ? const CircularProgressIndicator()
                          : Text(
                              'Signup',
                              style: GoogleFonts.albertSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 18.sp,
                                height: 1.h,
                                color: AppColors.black1Color,
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          
            SizedBox(height: 34.h),
          ],
        ),
      ),
    );
  }
}
