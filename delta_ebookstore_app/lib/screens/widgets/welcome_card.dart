import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  final Widget child;
  const WelcomeCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    // Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              'assets/images/open-book.png',
              color: theme.primaryBackground,
              height: 150,
              width: 150,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
