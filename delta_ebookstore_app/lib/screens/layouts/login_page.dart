import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/screens/widgets/login/login_form.dart';
import 'package:delta_ebookstore_app/screens/widgets/signup/signup_from.dart';
import 'package:delta_ebookstore_app/screens/widgets/welcome_card.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.primary,
      body: const Column(
        children: [
          WelcomeCard(),
          SizedBox(
            height: 10,
          ),
          LoginForm()
        ],
      ),
    );
  }
}
