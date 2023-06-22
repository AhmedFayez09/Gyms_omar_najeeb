import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gyms/config/user_local.dart';
import 'package:gyms/utils/service/dio_helper.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  static PaymentCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  void pressPayPal({required String subId, required String type}) {
    emit(PressPayPalLoading());
    dioHelper
        .postData(
      endPoint: ApiPath.pressPaypayEndPoint(subId: subId, type: type),
      token: UserLoacl.token,
    )
        .then((value) {
      emit(PressPayPalSuccess(link: value.data['approvalUrl']));
    }).catchError((e) {
      print('**************************************************');
      print(e);
      print('**************************************************');
      emit(PressPayPalError());
    });
  }

  void subwallet({required String subId, required String type}) {
    emit(SubWalletLoading());
    dioHelper
        .postData(
            endPoint: ApiPath.pressPaypayEndPoint(subId: subId, type: type),
            token: UserLoacl.token)
        .then((value) {
      emit(SubWalletSuccess());
    }).catchError((e) {
      emit(SubWalletError());
    });
  }

  void pressWallet({required String amount}) {
    log(amount);
    emit(PressWalletLoading());
    dioHelper.postData(
      endPoint: 'user/wallet?type=paypal',
      body: {"amount": amount},
    ).then((value) {
      String link = value.data['approvalUrl'];
      emit(PressWalletSuccess(link: link));
    }).catchError((e) {
      emit(PressWalletError());
    });
  }

  void confirmPaymentPayPal(
      {required String subId,
      required String payerId,
      required String paymentId}) {
    emit(ConfirmPayPalLoading());
    dioHelper.postData(
        endPoint: ApiPath.confrimPayment(subId: subId),
        token: UserLoacl.token,
        body: {
          "payerId": payerId,
          "paymentId": paymentId,
        }).then((value) {
      emit(ConfirmPayPalSuccess());
    }).catchError((e) {
      emit(ConfirmPayPalError());
    });
  }

  void confirmWalletPayment(
      {required String amount,
      required String payerId,
      required String paymentId}) {
    emit(WalletConfirmLoading());
    dioHelper.postData(
      endPoint: 'user/wallet_confirm?type=paypal',
      token: UserLoacl.token,
      body: {
        "paymentId": paymentId,
        "payerId": payerId,
        "amount": amount,
      },
    ).then((value) {
      emit(WalletConfirmSuccess());
    }).catchError((e) {
      emit(WalletConfirmError());
    });
  }

//  localhost:8080/user/renew_club_wallet/:subId
  void renewWallet({required String subId, required String userSubId}) {
    emit(RenewWalletLoading());
    dioHelper.postData(
        endPoint: 'user/renew_club_wallet/$subId',
        token: UserLoacl.token,
        body: {"userSubId": userSubId}).then((value) {
      emit(RenewWalletSuccess());
    }).catchError((e) {
      print(e);
      emit(RenewWalletError());
    });
  }

//{{base}}user/confirm_payment/:subId

  void confirmRenewPayPal({
    required String subId,
    required String userSubId,
    required String paymentId,
    required String payerId,
  }) {
    emit(ConfirmRenewPayPalLoading());
    dioHelper.postData(
      endPoint: 'user/confirm_payment/$subId',
      token: UserLoacl.token,
      body: {
        "paymentId": paymentId,
        "payerId": payerId,
        "userSubId": userSubId,
      },
    ).then((value) {
      emit(ConfirmRenewPayPalSuucess());
    }).catchError((e) {
      emit(ConfirmRenewPayPalError());
    });
  }
}
