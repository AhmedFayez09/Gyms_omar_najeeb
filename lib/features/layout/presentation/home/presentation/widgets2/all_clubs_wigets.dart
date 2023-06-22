import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gyms/config/user_local.dart';
import 'package:gyms/features/layout/presentation/home/presentation/items/culd_item.dart';
import 'package:gyms/features/logic/home/home_cubit.dart';
import 'package:gyms/features/logic/models/all_clubs.dart';
import 'package:gyms/utils/pop_uo.dart';

class AllClubsWidget extends StatelessWidget {
  const AllClubsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is GetClubDetailsSuccess) {
            Navigator.pushNamed(context, 'details-view');
          } else if (state is GetClubDetailsError) {
            flutterToast(
                msg: 'Some Thing Error', color: Theme.of(context).primaryColor);
          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          AllClubsModel? clubs = cubit.searchedClubs ?? cubit.allClubs;
          // AllClubsModel? searchedlist = cubit.searchedClubs;

          return clubs == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                  separatorBuilder: (context, index) => SizedBox(height: 15.h),
                  itemCount: clubs.clubs!.length,
                  itemBuilder: (context, index) {
                    Clubs oneClub = clubs.clubs![index];
                    return ClubItem(
                      image: oneClub.images![0],
                      clubName: oneClub.name ?? '..',
                      onTap: () {
                        cubit.getClubDetails(clubId: oneClub.sId!);
                        cubit.getClubDetailsInAuth(
                          clubId: oneClub.sId!,
                          lat: UserLoacl.lat.toString(),
                          long: UserLoacl.long.toString(),
                        );
                      },
                      city: oneClub.city ?? '..',
                    );
                  },
                );
        },
      ),
    );
  }
}
