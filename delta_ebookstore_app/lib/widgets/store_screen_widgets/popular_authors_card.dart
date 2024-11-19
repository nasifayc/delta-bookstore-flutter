import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PopularAuthorsCard extends StatelessWidget {
  const PopularAuthorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: theme.primary),
            borderRadius: BorderRadius.circular(50),
            image: const DecorationImage(
              image: AssetImage('assets/images/boy.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Dr. Alemayehu',
          style: theme.typography.bodySmall,
        ),
      ],
    );
  }
}
