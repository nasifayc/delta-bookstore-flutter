import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/auth/auth_state.dart';
import 'package:delta_ebookstore_app/screens/main_screens/landing_page.dart';
import 'package:delta_ebookstore_app/widgets/otp/pin_form.dart';
import 'package:delta_ebookstore_app/widgets/welcome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreen extends StatelessWidget {
  final bool signedUpWithPhone;
  const OtpScreen({super.key, required this.signedUpWithPhone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }

            if (state is Authenticated) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) =>
                        const LandingPage()), // Your main screen widget
                (route) => false,
              );
            }
          },
          child: Column(
            children: [
              const WelcomeCard(),
              const SizedBox(
                height: 10,
              ),
              PinForm(
                signedUpwithPhone: signedUpWithPhone,
              )
            ],
          ),
        ));
  }
}
