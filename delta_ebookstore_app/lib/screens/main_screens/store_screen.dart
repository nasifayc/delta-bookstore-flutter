import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/widgets/store_screen_widgets/book_preference.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BookPreference(),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Featured',
              style: theme.typography.headlineSmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Trending',
              style: theme.typography.headlineSmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Popular Authors',
              style: theme.typography.headlineMedium,
            )
          ],
        ),
      ),
    );
  }
}
