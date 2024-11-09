import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/widgets/common/secondary_button.dart';
import 'package:flutter/material.dart';

class BookPreference extends StatelessWidget {
  const BookPreference({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Row(
      children: [
        Expanded(
            child: SecondaryButton(
                onPressed: null,
                color: theme.primary.withOpacity(0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.book,
                      size: 15,
                      color: theme.primaryBackground,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Ebooks',
                      style: theme.typography.labelSmall,
                    )
                  ],
                ))),
        const SizedBox(width: 10),
        Expanded(
            child: SecondaryButton(
                onPressed: null,
                color: theme.primary.withOpacity(0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.headphones,
                      size: 15,
                      color: theme.primaryBackground,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Audio Books',
                      style: theme.typography.labelSmall,
                    )
                  ],
                )))
      ],
    );
  }
}
