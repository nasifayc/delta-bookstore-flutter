import 'package:delta_ebookstore_app/widgets/otp/pin_form.dart';
import 'package:delta_ebookstore_app/widgets/welcome_card.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            const WelcomeCard(),
            const SizedBox(
              height: 10,
            ),
            PinForm()
          ],
        ));
  }
}
