import 'package:flutter/material.dart';
import 'package:seezntv/app_strings/app_strings.dart';
import 'package:seezntv/screens/auth_page.dart';
import 'package:seezntv/screens/create_password_page.dart';
import 'package:seezntv/screens/edit_profile_page.dart';
import 'package:seezntv/screens/language_page.dart';
import 'package:seezntv/screens/login_page.dart';
import 'package:seezntv/screens/movie_details_page.dart';
import 'package:seezntv/screens/payment_method_page.dart';
import 'package:seezntv/screens/premium_page.dart';
import 'package:seezntv/screens/register_page.dart';
import 'package:seezntv/screens/reset_password_page.dart';
import 'package:seezntv/screens/route_page.dart';
import 'package:seezntv/screens/splash_page.dart';
import 'package:seezntv/screens/wishlist_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromRGBO(31, 29, 43, 1),
        primaryColor: const Color(0xFFFF4D4D),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF4D4D),
          secondary: Color.fromRGBO(37, 40, 54, 1),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/splash-page',
      routes: {
        '/splash-page': (context) => SplashPage(),
        '/auth-page': (context) => AuthPage(),
        '/login-page': (context) => LoginPage(),
        '/sign-up-page': (context) => RegisterPage(),
        '/reset-password': (context) => ResetPasswordPage(),
        '/create-password': (context) => CreatePasswordPage(),
        '/route': (context) => RoutePage(),
        '/movie-detail': (context) => MovieDetailsPage(),
        '/wishlist-page': (context) => WishlistPage(),
        '/premium-page': (context) => PremiumPage(),
        '/payment-method': (context) => PaymentMethodPage(),
        '/edit-profile-page': (context) => EditProfilePage(),
        '/language-page': (context) => LanguagePage(),
      },
    );
  }
}
