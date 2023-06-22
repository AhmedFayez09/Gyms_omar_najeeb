import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyms/utils/constants/assets.dart';
import 'package:gyms/utils/styles/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  CustomAppBar(
      {Key? key, required this.title, this.back = false, this.show = false})
      : super(key: key);
  bool back;
  bool show;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparentColor,
      elevation: 0,
      centerTitle: true,
      leading: back == true
          ? show == true
              ? SizedBox.shrink()
              : BackButton()
          : Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Image.asset(AppAssets.drawerIcon),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
      title: Text(
        title,
        style: GoogleFonts.albertSans(
          color: AppColors.black2Color,
          fontWeight: FontWeight.w900,
          fontSize: 18.sp,
        ),
      ),
      actions: [
        Image.asset(AppAssets.personIcon),
      ],
    );
  }
}
