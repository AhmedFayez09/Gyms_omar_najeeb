import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyms/config/app_routes.dart';
import 'package:gyms/config/user_local.dart';
import 'package:gyms/features/layout/presentation/walet/widgets/deposite_button_paypal.dart';
import 'package:gyms/features/layout/presentation/widgets/custom_app_bar.dart';
import 'package:gyms/features/logic/home/home_cubit.dart';
import 'package:gyms/features/logic/payment/payment_cubit.dart';
import 'package:gyms/utils/constants/assets.dart';
import 'package:gyms/utils/pop_uo.dart';
import 'package:gyms/utils/styles/colors.dart';

class MyWalletView extends StatefulWidget {
  const MyWalletView({Key? key}) : super(key: key);

  @override
  State<MyWalletView> createState() => _MyWalletViewState();
}

class _MyWalletViewState extends State<MyWalletView> {
  @override
  void initState() {
    context.read<HomeCubit>().getWalleet();
    super.initState();
  }

  GlobalKey<FormState> mmKey = GlobalKey<FormState>();
  var amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            50.h,
          ),
          child:  CustomAppBar(title: 'Wallet',back: true),
        ),
        backgroundColor: AppColors.grey1Color,
        body:
        
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
                      Navigator.pushReplacementNamed(context, AppRoute.loginView);
                    },
                    child: const Text(
                      "Join Us",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )),
              ),
          )
        :
        
        
        
        
        
        
        
        
         BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            var item = cubit.walletModel;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/edit_image_wallet.jpg"),
                        ),
                        borderRadius: BorderRadius.circular(35)),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "My Wallet",
                              style: GoogleFonts.albertSans(
                                color: AppColors.black2Color,
                                fontWeight: FontWeight.w900,
                                fontSize: 22.sp,
                              ),
                            ),
                            Text(
                              "GYMs",
                              style: GoogleFonts.albertSans(
                                color: AppColors.black2Color,
                                fontWeight: FontWeight.w900,
                                fontSize: 22.sp,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Current Balance",
                                  style: GoogleFonts.albertSans(
                                    color: AppColors.black2Color,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22.sp,
                                  ),
                                ),
                                Text(
                                  '${item == null ? '' : item.wallet} SAR',
                                  style: GoogleFonts.albertSans(
                                    color: AppColors.black2Color,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22.sp,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: Center(
                                            child: Container(
                                              height: 200.h,
                                              padding: EdgeInsets.all(10.w),
                                              margin: EdgeInsets.all(10.w),
                                              decoration: BoxDecoration(
                                                color: Color(0xFF333333),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Form(
                                                key: mmKey,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Choose one of them to deposit your wallet",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts
                                                          .albertSans(
                                                        color: AppColors
                                                            .white1Color,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 22.sp,
                                                      ),
                                                    ),
                                                    SizedBox(height: 15.h),
                                                    TextFormField(
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return "Please enter value";
                                                        }
                                                      },
                                                      controller:
                                                          amountController,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      decoration:
                                                          InputDecoration(
                                                        enabledBorder:
                                                            _border(),
                                                        border: _border(),
                                                      ),
                                                    ),
                                                    SizedBox(height: 15.h),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        /////////

                                                        BlocConsumer<
                                                            PaymentCubit,
                                                            PaymentState>(
                                                          listener:
                                                              (context, state) {
                                                            if (state
                                                                is PressWalletLoading) {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                barrierDismissible:
                                                                    false,
                                                                builder:
                                                                    (context) {
                                                                  return const Center(
                                                                      child:
                                                                          CircularProgressIndicator());
                                                                },
                                                              );
                                                            } else if (state
                                                                is PressWalletSuccess) {
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  AppRoute
                                                                      .walletWebView,
                                                                  arguments: {
                                                                    'link': state
                                                                        .link,
                                                                    'amount':
                                                                        amountController
                                                                            .text
                                                                  });
                                                            }
                                                          },
                                                          builder:
                                                              (context, state) {
                                                            var payCubit =
                                                                PaymentCubit.get(
                                                                    context);
                                                            return InkWell(
                                                              onTap: () {
                                                                if (mmKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  log(amountController
                                                                      .text);
                                                                  payCubit.pressWallet(
                                                                      amount: amountController
                                                                          .text);
                                                                }
                                                              },
                                                              child: Container(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12)),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/paypal.png",
                                                                    height:
                                                                        30.h,
                                                                    width: 80.w,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  )),
                                                            );
                                                          },
                                                        ),

                                                        ///////////
                                                        Image.asset(AppAssets
                                                            .companiesIcon),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Deposit',
                                    style: GoogleFonts.albertSans(
                                      color: AppColors.black2Color,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22.sp,
                                    ),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${item == null ? '' : item.wallet} SAR',
                        style: GoogleFonts.albertSans(
                          color: AppColors.black2Color,
                          fontWeight: FontWeight.w900,
                          fontSize: 22.sp,
                        ),
                      ),
                      Text(
                        '${item == null ? '' : item.totalPrice} SAR',
                        style: GoogleFonts.albertSans(
                          color: AppColors.black2Color,
                          fontWeight: FontWeight.w900,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Balance',
                        style: GoogleFonts.albertSans(
                          color: AppColors.black2Color,
                          fontWeight: FontWeight.w900,
                          fontSize: 15.sp,
                        ),
                      ),
                      Text(
                        'Total Spent',
                        style: GoogleFonts.albertSans(
                          color: AppColors.black2Color,
                          fontWeight: FontWeight.w900,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Transactions',
                        style: GoogleFonts.albertSans(
                          color: AppColors.black2Color,
                          fontWeight: FontWeight.w900,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Expanded(
                    child: cubit.walletModel == null
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: cubit.walletModel!.subs!.length,
                            itemBuilder: (context, index) {
                              var item = cubit.walletModel!.subs![index];
                              return Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10.h, vertical: 10.h),
                                height: 80.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 8.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.sp),
                                    color: Color(0xFFEFEFEF),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: AppColors.black2Color,
                                        offset: Offset(-0.5, -0.5),
                                        spreadRadius: 0.8,
                                        blurRadius: 0.8,
                                      ),
                                    ]),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        border: Border.all(
                                          color: AppColors.black2Color,
                                          width: 1.4.w,
                                        ),
                                      ),
                                      child: Image.network(
                                        item.clubLogo ??
                                            "https://res.cloudinary.com/ddj0r3yzi/image/upload/v1687217265/rjaigyxoaharvv52nbnt.png",
                                      ),
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                    SizedBox(width: 10.w),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Text(
                                        //   item.clubName ?? '',
                                        //   style: TextStyle(
                                        //     color: AppColors.black2Color,
                                        //     fontSize: 18.sp,
                                        //     fontWeight: FontWeight.w500,
                                        //   ),
                                        // ),
                                        // SizedBox(height: 4.h),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 210.w,
                                              child: Text(
                                                item.clubName ?? '',
                                                maxLines: 1,
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  color: AppColors.black2Color,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),

                                            // Text(
                                            //   '${item.} SAR',
                                            //   style: TextStyle(
                                            //     color: AppColors.black2Color,
                                            //     fontSize: 14.sp,
                                            //     fontWeight: FontWeight.w600,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  )
                ],
              ),
            );
          },
        ));
  }

  OutlineInputBorder _border() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white),
      );
}
