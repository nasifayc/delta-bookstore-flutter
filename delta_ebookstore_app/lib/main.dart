import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/bottom_nav/bottom_nav_cubit.dart';
import 'package:delta_ebookstore_app/controllers/search/search_cubit.dart';
import 'package:delta_ebookstore_app/controllers/theme/theme_cubit.dart';
import 'package:delta_ebookstore_app/core/app_navigator.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/screens/layouts/login_page.dart';
import 'package:delta_ebookstore_app/screens/layouts/otp_screen.dart';
import 'package:delta_ebookstore_app/screens/layouts/search_page.dart';
import 'package:delta_ebookstore_app/screens/layouts/setting_page.dart';
import 'package:delta_ebookstore_app/screens/layouts/sign_up_page.dart';
import 'package:delta_ebookstore_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthCubit(authService: AuthService())),
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => SearchCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ebook store',
            theme: LightModeTheme().themeData,
            darkTheme: DarkModeTheme().themeData,
            themeMode: state,
            routes: {
              '/login': (context) => const LoginPage(),
              '/signup': (context) => const SignUpPage(),
              '/otp': (context) => const OtpScreen(),
              '/settings': (context) => const SettingPage(),
              '/search': (context) => const SearchPage(),
            },
            home: const AppNavigator(),
          );
        },
      ),
    );
  }
}
