import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/config/routing/routes.dart';
import 'package:fruit_market/config/service_locator.dart';
import 'package:fruit_market/core/constants/constants_keys.dart';
import 'package:fruit_market/core/services/app_storage.dart';
import 'package:fruit_market/features/auth/presentation/screens/login_screen.dart';
import 'package:fruit_market/features/auth/presentation/screens/phone_screen.dart';
import 'package:fruit_market/features/auth/presentation/screens/signup_screen.dart';
import 'package:fruit_market/features/auth/presentation/screens/welcome_screen.dart';
import 'package:fruit_market/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:fruit_market/features/splash/splash_screen.dart';

class AppRouter {
  const AppRouter();

  static final Map<String, Widget Function(BuildContext)> _routes = {
    /// --- Welcome Screen ---
    Routes.splashScreen: (_) => const SplashScreen(),
    Routes.onboardingScreen: (_) => const OnboardingScreen(),
    Routes.welcomeScreen: (_) => const WelcomeScreen(),

    /// --- Auth Screen ---
    Routes.loginScreen: (_) => const LoginScreen(),
    Routes.signupScreen: (_) => const SignupScreen(),
    Routes.phoneScreen: (_) => const PhoneScreen(),

    // Routes.resetPasswordScreen: (_) => BlocProvider(
    //   create: (context) => ResetPasswordCubit(),
    //   child: const ResetPasswordScreen(),
    // ),
    // Routes.forgetPasswordScreen: (_) => BlocProvider(
    //   create: (context) => ResetPasswordCubit(),
    //   child: const ForgetPasswordScreen(),
    // ),
    // Routes.otpVerificationScreen: (_) => const OtpScreen(),

    // /// --- Navigation Screen ---
    // Routes.navigationScreen: (_) => const NavigationScreen(),
    // Routes.eventHomeScreen: (_) => const EventHomeScreen(),
    // Routes.searchScreen: (_) => const SearchSecreen(),
    // Routes.scheduleScreen: (_) => const ScheduleScreen(),
    // Routes.createEventScreen: (_) => const CreateEventScreen(),

    // /// --- User Events Screen ---
    // Routes.favoriteScreen: (_) => const FavoriteEventsScreen(),
    // Routes.pendingEvenstScreen: (_) => const PendingEventsScreen(),
    // Routes.joinedEventScreen: (_) => const JoinedEventsScreen(),

    // /// --- Other Screen ---
    // Routes.chatBotScreen: (_) => const ChatBotScreen(),
    // Routes.requestLocationScreen: (_) => const RequestLocationScreen(),
    // Routes.eventDetailsScreen: (_) => const EventDetailsScreen(),

    // /// --- Personalization Screen ---
    // Routes.profileScreen: (_) => const ProfileScreen(),
    // Routes.editPersonalInfoScreen: (_) => const EditPersonalInfoScreen(),
    // Routes.settingsScreen: (_) => const SettingsScreen(),

    // /// --- Payment Screen ---
    // Routes.paymentOptionsScreen: (_) => const PaymentOptionsScreen(),
  };

  static Future<String> getInitialRoute() async {
    //final secureStorage = getIt.get<SecureStorage>();
    final appStorage = getIt<AppStorage>();

    bool? onBoardingShown = appStorage.getBool(kOnBoardingShown);
    //final accessToken = await secureStorage.getAccessToken();

    if (!onBoardingShown) {
      return Routes.onboardingScreen;
    } else {
      //return accessToken != null ? Routes.navigationScreen : Routes.loginScreen;
      return Routes.welcomeScreen;
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    final pageBuilder = _routes[settings.name];

    if (pageBuilder != null) {
      return settings.name == Routes.navigationScreen
          ? scaleTransitionNavigation(pageBuilder, settings: settings)
          : systemNavigation(pageBuilder, settings: settings);
    }

    return null;
  }

  Route? systemNavigation(
    Widget Function(BuildContext) pageBuilder, {
    RouteSettings? settings,
  }) {
    final isIOS = defaultTargetPlatform == TargetPlatform.iOS;

    return isIOS
        ? CupertinoPageRoute(builder: pageBuilder, settings: settings)
        : MaterialPageRoute(builder: pageBuilder, settings: settings);
  }

  PageRouteBuilder<dynamic> scaleTransitionNavigation(
    Widget Function(BuildContext) pageBuilder, {
    RouteSettings? settings,
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) =>
          pageBuilder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut;
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return ScaleTransition(scale: curvedAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 400),
    );
  }
}
