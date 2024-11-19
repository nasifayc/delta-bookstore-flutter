import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/models/book/book_model.dart';
import 'package:flutter/material.dart';

class CoverImageCenter extends StatelessWidget {
  final BookModel book;
  const CoverImageCenter({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.38,
      height: MediaQuery.of(context).size.height * 0.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: theme.tertiary),
        image: DecorationImage(
          image: AssetImage(book.coverImage),
          fit: BoxFit.cover, // Ensure the image covers the container
        ),
      ),
    );
  }
}
