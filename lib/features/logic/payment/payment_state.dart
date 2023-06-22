part of 'payment_cubit.dart';

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}
class PressPayPalSuccess extends PaymentState {
dynamic link;
PressPayPalSuccess({required this.link});
}
class PressPayPalError extends PaymentState {}
class PressPayPalLoading extends PaymentState {}


class ConfirmPayPalSuccess extends PaymentState {}
class ConfirmPayPalError extends PaymentState {}
class ConfirmPayPalLoading extends PaymentState {}


class WalletConfirmSuccess extends PaymentState {}
class WalletConfirmError extends PaymentState {}
class WalletConfirmLoading extends PaymentState {}
class SubWalletSuccess extends PaymentState {}
class SubWalletError extends PaymentState {}
class SubWalletLoading extends PaymentState {}

class RenewWalletSuccess extends PaymentState {}
class RenewWalletError extends PaymentState {}
class RenewWalletLoading extends PaymentState {}

class RenewPaypalSuccess extends PaymentState {}
class RenewPaypalError extends PaymentState {}
class RenewPaypalLoading extends PaymentState {}


class ConfirmRenewPayPalSuucess extends PaymentState {}
class ConfirmRenewPayPalError extends PaymentState {}
class ConfirmRenewPayPalLoading extends PaymentState {}













class PressWalletSuccess extends PaymentState {
  final String link;
  PressWalletSuccess({required this.link});
}
class PressWalletLoading extends PaymentState {}
class PressWalletError extends PaymentState {}

