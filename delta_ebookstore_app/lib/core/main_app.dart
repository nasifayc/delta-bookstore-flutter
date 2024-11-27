import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/theme/theme_cubit.dart';
import 'package:delta_ebookstore_app/core/app_navigator.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/screens/layouts/setting/account_page.dart';
import 'package:delta_ebookstore_app/screens/layouts/login_page.dart';
import 'package:delta_ebookstore_app/screens/layouts/otp_screen.dart';
import 'package:delta_ebookstore_app/screens/layouts/search_page.dart';
import 'package:delta_ebookstore_app/screens/layouts/setting/change_password.dart';
import 'package:delta_ebookstore_app/screens/layouts/setting/edit_account.dart';
import 'package:delta_ebookstore_app/screens/layouts/setting/setting_page.dart';
import 'package:delta_ebookstore_app/screens/layouts/sign_up_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    context.read<AuthCubit>().verifyToken();
    context.read<ThemeCubit>().loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
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
            // '/otp': (context) => const OtpScreen(),
            '/settings': (context) => const SettingPage(),
            '/search': (context) => const SearchPage(),
            '/account': (context) => const AccountPage(),
            '/edit-account': (context) => const EditAccount(),
            '/change-password': (context) => const ChangePassword()
          },
          home: const AppNavigator(),
        );
      },
    );
  }
}
