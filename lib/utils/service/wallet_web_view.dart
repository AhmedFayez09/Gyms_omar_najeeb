import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gyms/features/logic/home/home_cubit.dart';
import 'package:gyms/features/logic/payment/payment_cubit.dart';
import 'package:gyms/utils/pop_uo.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WalletWebView extends StatefulWidget {
  final String paymentLink;
  final String amount;

  const WalletWebView(
      {Key? key, required this.paymentLink, required this.amount})
      : super(key: key);

  @override
  State<WalletWebView> createState() => _WalletWebViewState();
}

class _WalletWebViewState extends State<WalletWebView> {
  WebViewController controller = WebViewController();

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    // String urlLink =
    //     'https://accept.paymobsolutions.com/api/acceptance/post_pay';

    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is WalletConfirmSuccess) {
          context.read<HomeCubit>().getWalleet();
          Navigator.pop(context);
          Navigator.pop(context);
          // QuickAlert.show(
          //   context: context,
          //   type: QuickAlertType.success,
          //   text: 'Transaction Completed Successfully!',
          //   onConfirmBtnTap: () {
          //     Navigator.pop(context);
          //     Navigator.pop(context);
          //   },
          // );
        } 
      },
      builder: (context, state) {
        var cubit = PaymentCubit.get(context);
        controller
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(NavigationDelegate(
            onProgress: (int progress) {
              log("progress : $progress");
              // if(progress == 100) {
              // setState(() {
              //   print('isLoading is = {$isLoading}');
              //   isLoading = false;
              // });
              // }
            },
            onPageStarted: (String url) {
              log(" onPageStarted :  $url");
            },
            onPageFinished: (String url) async {
              log("onPageFinished :  $url");
              if (url.contains('paymentId')) {
                String paramsString = url.split('?').last;
                List<String> paramsList = paramsString.split('&');
                String paymentId = paramsList
                    .firstWhere((param) => param.startsWith('paymentId='))
                    .split('=')
                    .last;
                String payerId = paramsList
                    .firstWhere((param) => param.startsWith('PayerID='))
                    .split('=')
                    .last;
                log("paymentId : $paymentId"); // سيتم طباعة "PAYID-MSIKEFA8XC06621XR2173601"
                log("payerId : ${payerId}"); // سيتم طباعة "VT669RSXWTX5S"

                cubit.confirmWalletPayment(
                    amount: widget.amount,
                    payerId: payerId,
                    paymentId: paymentId);
              }

              // if(url.contains('success=true')) {
              //   print("Success URL = $url");
              //   // Navigator.pushReplacementNamed(context, 'successAfterPayment', arguments: {
              //   //   "totalPrice": widget.totalPrice,
              //   //   "cartItems": widget.cartItems,
              //   // });
              // } else if(url.contains('success=false')){
              //   // Navigator.pushReplacementNamed(context, 'errorAfterPayment');
              // }
            },
            onWebResourceError: (error) {
              print('error');
            },
            onNavigationRequest: (request) {
              log(" onNavigationRequest:  $request");
              // if (request.url.startsWith(MyConfigCach.getString(key: MyConfigCacheKeys.WalletWebView))) {
              //   return NavigationDecision.prevent;
              // }
              return NavigationDecision.navigate;
            },
          ))
          ..loadRequest(
            Uri.parse(widget.paymentLink),
          );

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: WebViewWidget(controller: controller),
        );
      },
    );
  }
}
