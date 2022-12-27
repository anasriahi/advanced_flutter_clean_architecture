import 'package:advanced_flutter_clean_architecture/presentation/forgot_password/forgot_password_view.dart';
import 'package:advanced_flutter_clean_architecture/presentation/login/login_view.dart';
import 'package:advanced_flutter_clean_architecture/presentation/main/main_view.dart';
import 'package:advanced_flutter_clean_architecture/presentation/onboarding/onboarding_view.dart';
import 'package:advanced_flutter_clean_architecture/presentation/register/register_view.dart';
import 'package:advanced_flutter_clean_architecture/presentation/splash/splash_view.dart';
import 'package:advanced_flutter_clean_architecture/presentation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgoPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text("No Route Found"),
          ),
          body: const Center(
            child: Text("No Route Found"),
          ),
        ));
  }
}