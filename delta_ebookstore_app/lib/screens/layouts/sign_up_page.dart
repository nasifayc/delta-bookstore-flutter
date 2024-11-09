import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/widgets/signup/signup_from.dart';
import 'package:delta_ebookstore_app/widgets/welcome_card.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          SignupFrom()
        ],
      ),
    );
  }
}
