import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 80,
            child: Image.asset("assets/images/boy.png"),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Nasifay',
          style: theme.typography.headlineMedium,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'nasifayc11@gmail.com',
          style: theme.typography.titleSmall,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
