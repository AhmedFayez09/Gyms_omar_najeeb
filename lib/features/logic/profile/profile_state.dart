part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class GetRulesSuccess extends ProfileState {}
class GetRulesLoading extends ProfileState {}
class GetRulesError extends ProfileState {}


