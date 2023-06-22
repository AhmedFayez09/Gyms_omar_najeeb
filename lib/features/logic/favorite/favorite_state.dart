part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class GetFavoriteListSuccess extends FavoriteState {}
class GetFavoriteListError extends FavoriteState {}
class GetFavoriteListLoading extends FavoriteState {}
class AddOrRemoveFavSuccess extends FavoriteState {}
class AddOrRemoveFavError extends FavoriteState {}
class AddOrRemoveFavLoading extends FavoriteState {}


