part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class RegisterLoading extends AuthState {}
class RegisterError extends AuthState {}
class RegisterSuccess extends AuthState {}

class LoginLoading extends AuthState {}
class LoginError extends AuthState {}
class LoginSuccess extends AuthState {}
class UnClientState extends AuthState {}


