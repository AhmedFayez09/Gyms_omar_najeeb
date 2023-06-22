import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyms/config/app_routes.dart';
import 'package:gyms/config/cache.dart';
import 'package:gyms/config/user_local.dart';
import 'package:gyms/features/layout/presentation/home/presentation/widgets2/sub_item.dart';
import 'package:gyms/features/logic/favorite/favorite_cubit.dart';
import 'package:gyms/features/logic/home/home_cubit.dart';
import 'package:gyms/features/logic/models/club_details_model.dart';
import 'package:gyms/features/logic/payment/payment_cubit.dart';
import 'package:gyms/utils/constants/assets.dart';
import 'package:gyms/utils/constants/custom_slider.dart';
import 'package:gyms/utils/pop_uo.dart';
import 'package:gyms/utils/styles/colors.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class DetailsView extends StatefulWidget {
  DetailsView({Key? key}) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  int selectSub = 0;
  Subscriptions? selectSubscribtion;
  bool isFavorite = false;

  dynamic listFavoriteInCache;

  @override
  void initState() {
    context.read<FavoriteCubit>().getFavoriteList();

    // print(CacheHelper.getData(key: MyCacheMy.listFavorite).runtimeType);
    listFavoriteInCache =
        CacheHelper.getData(key: MyCacheMy.listFavorite) ?? [];

    print("this list in Chache favorite $listFavoriteInCache");
    print(
        "the list :  ${context.read<HomeCubit>().clubDetailsModel!.subscriptions!.length}");
    if (context.read<HomeCubit>().clubDetailsModel!.subscriptions!.isEmpty) {
      print("Empty List");
    } else {
      selectSubscribtion =
          context.read<HomeCubit>().clubDetailsModel!.subscriptions![0];
      log("${selectSubscribtion!.sId}");

      print("مليانه");
    }
    // if (HomeCubit.get(context).clubDetailsModel != null) {
    //   if (listFavoriteInCache != null) {
    //     if (listFavoriteInCache!
    //         .contains(HomeCubit.get(context).clubDetailsModel!.club!.sId!)) {
    //       setState(() {
    //         isFavorite = true;
    //       });
    //     }
    //   }
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("the sub is user :  ${context.read<HomeCubit>().clubDetailsInAuthModel!.sub}");
    return Stack(
      children: [
        Image.asset(AppAssets.backgroundImage, fit: BoxFit.cover),
        Scaffold(
          backgroundColor: AppColors.transparentColor,
          body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 36.h),
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    var cubit = HomeCubit.get(context);
                    ClubDetailsModel? club = cubit.clubDetailsModel;
                    //  cubit
                    //     .getClubDetailsInAuth(
                    //   clubId: club
                    //       !.club!
                    //       .sId!,
                    //   lat: UserLoacl
                    //       .lat
                    //       .toString(),
                    //   long: UserLoacl
                    //       .long
                    //       .toString(),
                    // );
                    var clubinAuth = cubit.clubDetailsInAuthModel;

                    return club == null
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: AppColors.white1Color,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    club.club == null
                                        ? '...'
                                        : club.club!.name ?? '..',
                                    style: GoogleFonts.albertSans(
                                      color: AppColors.white1Color,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  // Image.asset(AppAssets.detailsIcon),
                                  Container(
                                    width: 160.w,
                                    height: 184.h,
                                    // margin: EdgeInsets.symmetric(horizontal: 0.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      // image: DecorationImage(
                                      //   image: AssetImage('assets/images/banner15.png'),
                                      //   fit: BoxFit.fitHeight,
                                      // ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          club.club == null
                                              ? "https://res.cloudinary.com/ddj0r3yzi/image/upload/v1687002107/mcitd6pvigdnqafflwcz.jpg"
                                              : club.club!.logo ??
                                                  "https://res.cloudinary.com/ddj0r3yzi/image/upload/v1687002107/mcitd6pvigdnqafflwcz.jpg",
                                          height: 150.h,
                                          width: 150.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.monetization_on,
                                            color: AppColors.white1Color,
                                          ),
                                          Text(
                                            context
                                                    .read<HomeCubit>()
                                                    .clubDetailsModel!
                                                    .subscriptions!
                                                    .isEmpty
                                                ? ".."
                                                : '${club.subscriptions![0].price} sar.', //////////////////////////////////////////////
                                            style: GoogleFonts.albertSans(
                                              color: AppColors.white1Color,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                          SizedBox(width: 20.w),

                                          // Favorite

                                          BlocConsumer<FavoriteCubit,
                                              FavoriteState>(
                                            listener: (context, state) {
                                              if (state
                                                  is AddOrRemoveFavSuccess) {
                                                cubit.getClubDetailsInAuth(
                                                  clubId: club.club!.sId!,
                                                  lat: UserLoacl.lat.toString(),
                                                  long:
                                                      UserLoacl.long.toString(),
                                                );
                                                context
                                                    .read<FavoriteCubit>()
                                                    .getFavoriteList();
                                              }
                                            },
                                            builder: (context, state) {
                                              var cubit =
                                                  FavoriteCubit.get(context);
                                              return UserLoacl.token == null
                                                  ? SizedBox.shrink()
                                                  : IconButton(
                                                      onPressed: () {
                                                        cubit.addOrRemoveFav(
                                                            id: club
                                                                .club!.sId!);
                                                      },
                                                      icon: clubinAuth == null
                                                          ? SizedBox.shrink()
                                                          : Icon(
                                                              state is AddOrRemoveFavLoading
                                                                  ? CupertinoIcons
                                                                      .alt
                                                                  : Icons
                                                                      .favorite,
                                                              color: clubinAuth
                                                                          .isFave ==
                                                                      true
                                                                  ? Colors.red
                                                                  : AppColors
                                                                      .grey2Color,
                                                            ),
                                                    );
                                            },
                                          )
                                        ],
                                      ),

                                      ////List<String> myList = prefs.getStringList('myList') ?? [];
                                      SizedBox(height: 6.h),
                                      Row(
                                        children: [
                                          const Icon(Icons.add_location,
                                              color: AppColors.white1Color),
                                          Text(
                                            '${club.distance ?? 11}',
                                            style: GoogleFonts.albertSans(
                                              color: AppColors.white1Color,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 6.h),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_city_sharp,
                                              color: AppColors.white1Color),
                                          Text(
                                            'Opent to ${club.club == null ? '' : club.club!.to}',
                                            style: GoogleFonts.albertSans(
                                              color: AppColors.white1Color,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 6.h),
                                      SizedBox(height: 6.h),
                                      Row(
                                        children: [
                                          Text(
                                            'Day Per Week : ${club.club == null ? '' : club.club!.days ?? '..'}',
                                            style: GoogleFonts.albertSans(
                                              color: AppColors.white1Color,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 6.h),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              //////
                              SliderImages(
                                imagesList:
                                    cubit.clubDetailsModel!.club!.images ?? [],
                              ),
                              SizedBox(height: 10.h),

// if(UserLoacl.token != null)
// if(cubit.clubDetailsInAuthModel!.sub == true)
                              cubit.clubDetailsInAuthModel == null
                                  ?
                                  // CircularProgressIndicator()

                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 100),
                                        alignment: Alignment.center,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white),
                                              padding: MaterialStateProperty.all(
                                                EdgeInsets.symmetric(
                                                  horizontal: 40.w,
                                                  vertical: 7.h,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pushReplacementNamed(
                                                  context, AppRoute.loginView);
                                            },
                                            child: const Text(
                                              "Join Us",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            )),
                                      ),
                                  )
                                  : UserLoacl.token != null &&
                                          cubit.clubDetailsInAuthModel!.sub ==
                                              true
                                      ? Container(
                                          // height: 200,
                                          color: Colors.black45,
                                          padding: EdgeInsets.all(15.w),
                                          // width: 200,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "الاسم :  ${cubit.clubDetailsInAuthModel!.data!.username}",
                                                style: _style(),
                                              ),
                                              SizedBox(height: 10.h),
                                              Text(
                                                " أسم النادي :  ${cubit.clubDetailsInAuthModel!.data!.clubName}",
                                                style: _style(),
                                              ),
                                              Text(
                                                ": عنوان النادي ",
                                                style: _style(),
                                              ),
                                              Text(
                                                " ${cubit.clubDetailsInAuthModel!.data!.clubLocation}",
                                                style: _style(),
                                              ),
                                              Text(
                                                "الكود :  ${cubit.clubDetailsInAuthModel!.data!.code}",
                                                style: _style(),
                                              ),
                                              Text(
                                                "تاريخ البداية : ${cubit.clubDetailsInAuthModel!.data!.startDate}",
                                                style: _style(),
                                              ),
                                              Text(
                                                "تاريخ الانتهاء :  ${cubit.clubDetailsInAuthModel!.data!.endDate}",
                                                style: _style(),
                                              ),
                                              Text(
                                                "الاشتراك :  ${cubit.clubDetailsInAuthModel!.data!.subscriptionName}",
                                                style: _style(),
                                              ),
                                              Text(
                                                "سعر الاشتراك ${cubit.clubDetailsInAuthModel!.data!.subscriptionPrice}",
                                                style: _style(),
                                              ),
                                              SizedBox(height: 15.h),
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: Center(
                                                              child: Container(
                                                                  height: 120.h,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(10
                                                                              .w),
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(10
                                                                              .w),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF333333),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                  ),
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          "Choose one ",
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style:
                                                                              GoogleFonts.albertSans(
                                                                            color:
                                                                                AppColors.white1Color,
                                                                            fontWeight:
                                                                                FontWeight.w900,
                                                                            fontSize:
                                                                                22.sp,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                15.h),
                                                                        Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              //paypal
                                                                              BlocConsumer<PaymentCubit, PaymentState>(
                                                                                listener: (context, state) {
                                                                                  if (state is PressPayPalLoading) {
                                                                                    showDialog(
                                                                                      context: context,
                                                                                      barrierDismissible: false,
                                                                                      builder: (context) {
                                                                                        return const Center(child: CircularProgressIndicator());
                                                                                      },
                                                                                    );
                                                                                  } else if (state is PressPayPalSuccess) {
                                                                                    Navigator.pop(context);
                                                                                    Navigator.pushNamed(context, AppRoute.renewClubWithPayPal, arguments: {
                                                                                      'link': state.link,
                                                                                      'subId': selectSubscribtion!.sId!,
                                                                                      'userSubId': context.read<HomeCubit>().clubDetailsInAuthModel!.data!.id!,
                                                                                    });
                                                                                  }
                                                                                },
                                                                                builder: (context, state) {
                                                                                  var payCubit = PaymentCubit.get(context);
                                                                                  return InkWell(
                                                                                    onTap: () {
                                                                                      // log(amountController.text);
                                                                                      // payCubit.pressWallet(amount: amountController.text);
                                                                                      payCubit.pressPayPal(subId: selectSubscribtion!.sId!, type: 'paypal');
                                                                                    },
                                                                                    child: Container(
                                                                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                                                                                        child: Image.asset(
                                                                                          "assets/images/paypal.png",
                                                                                          height: 30.h,
                                                                                          width: 80.w,
                                                                                          fit: BoxFit.fill,
                                                                                        )),
                                                                                  );
                                                                                },
                                                                              ),
//////////////////////////////////////////////////////
                                                                              ///
                                                                              ///
                                                                              ///     wallect
                                                                              ///

                                                                              BlocConsumer<PaymentCubit, PaymentState>(
                                                                                listener: (context, state) {
                                                                                  // if (state is RenewWalletLoading) {
                                                                                  //   Navigator.pop(context);
                                                                                  //   showDialog(
                                                                                  //     context: context,
                                                                                  //     // barrierDismissible: false,
                                                                                  //     builder: (context) {
                                                                                  //       return const Center(child: CircularProgressIndicator());
                                                                                  //     },
                                                                                  //   );

                                                                                  // }
                                                                                  if (state is RenewWalletSuccess) {
                                                                                    // Navigator.pop(context);
                                                                                    flutterToast(msg: "success", color: Theme.of(context).primaryColor);
                                                                                    Navigator.pop(context);

                                                                                    cubit.getClubDetailsInAuth(
                                                                                      clubId: club.club!.sId!,
                                                                                      lat: UserLoacl.lat.toString(),
                                                                                      long: UserLoacl.long.toString(),
                                                                                    );
                                                                                  }
                                                                                },
                                                                                builder: (context, state) {
                                                                                  var cubit = PaymentCubit.get(context);
                                                                                  return InkWell(
                                                                                    onTap: () {
                                                                                      cubit.renewWallet(
                                                                                        subId: context.read<HomeCubit>().clubDetailsInAuthModel!.data!.subscriptionId!,
                                                                                        userSubId: context.read<HomeCubit>().clubDetailsInAuthModel!.data!.id!,
                                                                                      );
                                                                                    },
                                                                                    child: Container(
                                                                                      width: MediaQuery.of(context).size.width * 0.4,
                                                                                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                                                                                      decoration: BoxDecoration(
                                                                                        color: const Color(0xFFEDD185),
                                                                                        borderRadius: BorderRadius.circular(16.sp),
                                                                                      ),
                                                                                      child: Row(
                                                                                        children: [
                                                                                          const Icon(
                                                                                            Icons.account_balance_wallet,
                                                                                            color: AppColors.black2Color,
                                                                                          ),
                                                                                          Text(
                                                                                            'My Wallet',
                                                                                            textAlign: TextAlign.center,
                                                                                            style: GoogleFonts.albertSans(
                                                                                              color: AppColors.black2Color,
                                                                                              fontWeight: FontWeight.w900,
                                                                                              fontSize: 20.sp,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              )
                                                                            ])
                                                                      ]))));
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 32.w),
                                                  height: 40.h,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColors.white1Color,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.r),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors
                                                            .grey2Color
                                                            .withOpacity(0.06),
                                                        offset:
                                                            const Offset(0, 2),
                                                        spreadRadius: 0.2,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'تجديد الاشتراك',
                                                      style: GoogleFonts
                                                          .albertSans(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18.sp,
                                                        height: 1.h,
                                                        color: AppColors
                                                            .black1Color,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Column(
                                          children: [
                                            SizedBox(
                                              height: 100.h,
                                              child: ListView.separated(
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                  width: 10.w,
                                                ),
                                                itemCount: cubit
                                                    .clubDetailsModel!
                                                    .subscriptions!
                                                    .length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  Subscriptions item = cubit
                                                      .clubDetailsModel!
                                                      .subscriptions![index];
                                                  return InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectSub = index;
                                                        selectSubscribtion =
                                                            item;
                                                      });
                                                      log("${selectSubscribtion!.sId}");
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: selectSub ==
                                                                    index
                                                                ? Colors.black
                                                                : Colors
                                                                    .transparent,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                      child: SubItem(
                                                        image:
                                                            "assets/images/background-img.png",
                                                        r: "رسوم الاشتراك",
                                                        title:
                                                            item.name ?? '..',
                                                        price: item.price ?? 0,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(height: 10.h),
                                            UserLoacl.token == null
                                                ? Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: ElevatedButton(
                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(Colors
                                                                      .white),
                                                          padding:
                                                              MaterialStateProperty
                                                                  .all(
                                                            EdgeInsets
                                                                .symmetric(
                                                              horizontal: 40.w,
                                                              vertical: 7.h,
                                                            ),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator
                                                              .pushReplacementNamed(
                                                                  context,
                                                                  AppRoute
                                                                      .loginView);
                                                        },
                                                        child: const Text(
                                                         " Join Us",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        )),
                                                  )
                                                :

                                                // this column incloub my payments
                                                Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Payment',
                                                            style: GoogleFonts
                                                                .albertSans(
                                                              color: AppColors
                                                                  .white1Color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontSize: 18.sp,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: 4.h),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                            child: Text(
                                                              'How you’ll pay it?',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .albertSans(
                                                                color: AppColors
                                                                    .grey2Color,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                fontSize: 11.sp,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: 4.h),
                                                      Row(
                                                        children: [
                                                          BlocConsumer<
                                                              PaymentCubit,
                                                              PaymentState>(
                                                            listener: (context,
                                                                state) {
                                                              if (state
                                                                  is SubWalletLoading) {
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
                                                                  is SubWalletSuccess) {
                                                                Navigator.pop(
                                                                    context);

                                                                QuickAlert.show(
                                                                  context:
                                                                      context,
                                                                  type: QuickAlertType
                                                                      .success,
                                                                  text:
                                                                      'Transaction Completed Successfully!',
                                                                  onConfirmBtnTap:
                                                                      () {
                                                                    cubit
                                                                        .getClubDetailsInAuth(
                                                                      clubId: club
                                                                          .club!
                                                                          .sId!,
                                                                      lat: UserLoacl
                                                                          .lat
                                                                          .toString(),
                                                                      long: UserLoacl
                                                                          .long
                                                                          .toString(),
                                                                    );
                                                                    Navigator.pop(
                                                                        context);

                                                                    // 4444444444444444444
                                                                  },
                                                                );
                                                              } else if (state
                                                                  is SubWalletError) {
                                                                flutterToast(
                                                                    msg:
                                                                        "Some Thing Error",
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor);
                                                              }
                                                            },
                                                            builder: (context,
                                                                state) {
                                                              var payCubit =
                                                                  PaymentCubit.get(
                                                                      context);
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  payCubit.subwallet(
                                                                      subId: selectSubscribtion!
                                                                          .sId!
                                                                          .toString(),
                                                                      type:
                                                                          'wallet');
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.4,
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          6.w,
                                                                      vertical:
                                                                          6.h),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                        0xFFEDD185),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.sp),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .account_balance_wallet,
                                                                        color: AppColors
                                                                            .black2Color,
                                                                      ),
                                                                      Text(
                                                                        'My Wallet',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: GoogleFonts
                                                                            .albertSans(
                                                                          color:
                                                                              AppColors.black2Color,
                                                                          fontWeight:
                                                                              FontWeight.w900,
                                                                          fontSize:
                                                                              20.sp,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 4.h),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        50.w),
                                                            child: Text(
                                                              'OR',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .albertSans(
                                                                color: const Color(
                                                                    0xFF707070),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                fontSize: 15.sp,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: 4.h),
                                                      Row(
                                                        children: [
                                                          BlocConsumer<
                                                              PaymentCubit,
                                                              PaymentState>(
                                                            listener: (context,
                                                                state) {
                                                              if (state
                                                                  is PressPayPalLoading) {
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
                                                                  is PressPayPalSuccess) {
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.pushNamed(
                                                                    context,
                                                                    AppRoute
                                                                        .webViewPayment,
                                                                    arguments: {
                                                                      'link': state
                                                                          .link,
                                                                      'subId':
                                                                          selectSubscribtion!
                                                                              .sId!
                                                                    });
                                                              } else if (state
                                                                  is PressPayPalError) {
                                                                Navigator.pop(
                                                                    context);
                                                                flutterToast(
                                                                    msg:
                                                                        "Some Thing Error",
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor);
                                                              }
                                                            },
                                                            builder: (context,
                                                                state) {
                                                              var payCubit =
                                                                  PaymentCubit.get(
                                                                      context);
                                                              return InkWell(
                                                                onTap: () {
                                                                  log("${selectSubscribtion!.sId}");
                                                                  payCubit.pressPayPal(
                                                                      subId: selectSubscribtion!
                                                                          .sId!,
                                                                      type:
                                                                          'paypal');
                                                                },
                                                                child:
                                                                    Container(
                                                                        decoration: BoxDecoration(
                                                                            color: Colors
                                                                                .white,
                                                                            borderRadius: BorderRadius.circular(
                                                                                12)),
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/images/paypal.png",
                                                                          height:
                                                                              30.h,
                                                                          width:
                                                                              80.w,
                                                                          fit: BoxFit
                                                                              .fill,
                                                                        )),
                                                              );
                                                            },
                                                          ),
                                                          Image.asset(AppAssets
                                                              .companiesIcon),
                                                        ],
                                                      )
                                                    ],
                                                  )
                                          ],
                                        )
                            ],
                          );
                  },
                )),
          ),
        ),
      ],
    );
  }

  TextStyle _style() => GoogleFonts.albertSans(
        color: AppColors.white1Color,
        fontWeight: FontWeight.w900,
        fontSize: 18.sp,
      );
}
