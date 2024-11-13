import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          Text(
            'DELTA EBOOKSTORE',
            style: theme.typography.bodyMediumWhite,
          ),
          const SizedBox(
            height: 5,
          ),
          Image.asset(
            'assets/images/open-book.png',
            color: theme.primaryBackground,
            height: 150,
            width: 150,
          ),
        ],
      ),
    );
  }
}
