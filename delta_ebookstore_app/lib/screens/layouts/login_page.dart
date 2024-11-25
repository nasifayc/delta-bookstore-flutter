import 'dart:developer';

import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/auth/auth_state.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/screens/main_screens/landing_page.dart';
import 'package:delta_ebookstore_app/widgets/login/login_form.dart';
import 'package:delta_ebookstore_app/widgets/welcome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              log(state.errorMessage);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
            if (state is Authenticated) {
              // log('----------------------- ${state.user.profilePicture!} --------------------------');
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) =>
                        const LandingPage()), // Your main screen widget
                (route) => false,
              );
            }
          },
          child: const Column(
            children: [
              WelcomeCard(),
              SizedBox(
                height: 10,
              ),
              LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}
