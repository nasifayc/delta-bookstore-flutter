// import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppStartedPage extends StatelessWidget {
  const AppStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // AppTheme theme = AppTheme.of(context);
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(
          'assets/animations/loading.json',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
