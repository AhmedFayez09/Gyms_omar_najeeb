part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}


class GetAllClubsSuccess extends HomeState{}
class GetAllClubsError extends HomeState{}
class GetAllClubsLoading extends HomeState{}

class GetClubDetailsLoading extends HomeState{}
class GetClubDetailsError extends HomeState{}
class GetClubDetailsSuccess extends HomeState{}
class GetClubDetailsInAuthSuccess extends HomeState{}
class GetClubDetailsInAuthError extends HomeState{}
class GetClubDetailsInAuthLoading extends HomeState{}

class GetBestdCulbSuccess extends HomeState{}
class GetBestdCulbError extends HomeState{}
class GetBestdCulbLoading extends HomeState{}

class GetlowestCulbSuccess extends HomeState{}
class GetlowestCulbError extends HomeState{}
class GetlowestCulbLoading extends HomeState{}

class GetnearbyCulbSuccess extends HomeState{}
class GetnearbyCulbError extends HomeState{}
class GetnearbyCulbLoading extends HomeState{}

class GetBannerHomeLoading extends HomeState{}
class GetBannerHomeError extends HomeState{}
class GetBannerHomeSuccess extends HomeState{}

class GetSplashSuccess extends HomeState{}
class GetSplashLoading extends HomeState{}
class GetSplashError extends HomeState{}



class GetBookingLoading extends HomeState{}
class GetBookingError extends HomeState{}
class GetBookingSuccess extends HomeState{}


class GetWalleetSuccess extends HomeState{}
class GetWalleetError extends HomeState{}
class GetWalleetLoading extends HomeState{}



class GetSearchedListSuucess extends HomeState{}
class GetSearchedListError extends HomeState{}
class GetSearchedListLoading extends HomeState{}





