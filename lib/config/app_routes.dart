import 'package:flutter/material.dart';
import 'package:gyms/features/check/presentation/check_view.dart';
import 'package:gyms/features/check/presentation/login_view.dart';
import 'package:gyms/features/check/presentation/widgets/check2_view_body.dart';
import 'package:gyms/features/check/presentation/widgets/check3_view_body.dart';
import 'package:gyms/features/check/presentation/widgets/signup_view.dart';
import 'package:gyms/features/layout/presentation/home/presentation/about_view.dart';
import 'package:gyms/features/layout/presentation/home/presentation/details_view.dart';
import 'package:gyms/features/layout/presentation/home/presentation/privacy_view.dart';
import 'package:gyms/features/layout/presentation/home/presentation/support_view.dart';
import 'package:gyms/features/layout/presentation/walet/presentation/my_wallet_view.dart';
import 'package:gyms/features/splash/presentation/splash_view.dart';
import 'package:gyms/utils/service/my_web_view.dart';
import 'package:gyms/utils/service/renew_club_with_paypal.dart';
import 'package:gyms/utils/service/wallet_web_view.dart';
import 'package:page_transition/page_transition.dart';
import '../features/layout/presentation/layout_view.dart';

class AppRoute {
  static const String splashView = 'splash-view';
  static const String loginView = 'loginView';
  static const String layoutView = 'layoutView';
  static const String webViewPayment = 'WebViewPayment';
  static const String checkView = 'check-view';
  static const String splashViewBody2 = 'SplashViewBody2';
  static const String walletWebView = 'WalletWebView';
  static const String renewClubWithPayPal = 'RenewClubWithPayPal';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // splash
      case AppRoute.splashView:
        return PageTransition(
          child: const SplashView(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case AppRoute.renewClubWithPayPal:
        final map = settings.arguments as Map<String, dynamic>;
        return PageTransition(
          child: RenewClubWithPayPal(
            paymentLink: map['link'],
            subId: map['subId'],
            userSubId: map['userSubId'],
          ),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );

      case AppRoute.webViewPayment:
        final map = settings.arguments as Map<String, dynamic>;
        return PageTransition(
          child: WebViewPayment(
            paymentLink: map['link'],
            subId: map['subId'],
          ),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      // login
      case AppRoute.loginView:
        return PageTransition(
          child: const LoginView(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case AppRoute.walletWebView:
        final map = settings.arguments as Map<String, dynamic>;
        return PageTransition(
          child: WalletWebView(amount: map['amount'], paymentLink: map['link']),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      // sign up
      case 'signup-view':
        return PageTransition(
          child: const SignUpView(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case AppRoute.checkView:
        return PageTransition(
          child: const CheckView(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'check2-view':
        return PageTransition(
          child: const Check2ViewBody(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'check3-view':
        return PageTransition(
          child: const Check3ViewBody(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      // layout
      case AppRoute.layoutView:
        return PageTransition(
          child: LayoutView(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'my-walet-view':
        return PageTransition(
          child: MyWalletView(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'details-view':
        return PageTransition(
          child: DetailsView(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'about-view':
        return PageTransition(
          child: AboutView(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'privacy-view':
        return PageTransition(
          child: PrivacyView(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'support-view':
        return PageTransition(
          child: SupportView(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'No Route',
          ),
        ),
        body: const Center(
          child: Text(
            'No Route',
          ),
        ),
      ),
    );
  }
}
