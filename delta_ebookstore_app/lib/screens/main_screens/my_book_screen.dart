import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyBookScreen extends StatelessWidget {
  const MyBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Center(
        child: Text(
      'MyBook page',
      style: theme.typography.bodyMedium,
    ));
  }
}
