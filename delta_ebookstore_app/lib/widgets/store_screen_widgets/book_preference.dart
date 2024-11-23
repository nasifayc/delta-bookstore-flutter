import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/widgets/common/secondary_button.dart';
import 'package:flutter/material.dart';

class BookPreference extends StatelessWidget {
  const BookPreference({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);

    // List of book categories
    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.book, 'label': 'Ebooks'},
      {'icon': Icons.headphones, 'label': 'Audio Books'},
      {'icon': Icons.menu_book, 'label': 'Comics'},
      {'icon': Icons.school, 'label': 'Educational'},
      {'icon': Icons.science, 'label': 'Science Fiction'},
    ];

    return SizedBox(
      height: 35, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 10,
            ),
            child: SecondaryButton(
              onPressed: () {
                debugPrint('${category['label']} pressed');
              },
              color: theme.primary.withOpacity(1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      category['icon'],
                      size: 15,
                      color: theme.primaryBackground,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      category['label'],
                      style: theme.typography.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
