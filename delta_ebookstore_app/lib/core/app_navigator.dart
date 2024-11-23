import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/auth/auth_state.dart';
import 'package:delta_ebookstore_app/screens/layouts/sign_up_page.dart';
import 'package:delta_ebookstore_app/screens/main_screens/landing_page.dart';
import 'package:delta_ebookstore_app/screens/onboarding.dart';
import 'package:delta_ebookstore_app/widgets/common/app_started_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return const LandingPage();
        }
        if (state is AuthFailed) {
          return const SignUpPage();
        }
        if (state is AuthInitial) {
          return const Onboarding();
        }
        return const AppStartedPage();
      },
    );
  }
}
