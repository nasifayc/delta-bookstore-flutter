import 'package:delta_ebookstore_app/screens/layouts/sign_up_page.dart';
import 'package:flutter/material.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  @override
  Widget build(BuildContext context) {
    return const SignUpPage();
  }
}
