import 'dart:ui';

import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/models/book/book_model.dart';
import 'package:delta_ebookstore_app/widgets/book_detail/book_info.dart';
import 'package:delta_ebookstore_app/widgets/book_detail/cover_image.dart';
import 'package:delta_ebookstore_app/widgets/book_detail/cover_image_center.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  final BookModel book;
  const BookDetail({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back, color: theme.tertiary),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.favorite_border_rounded, color: theme.tertiary),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          CoverImage(book: book),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.09,
            left: MediaQuery.of(context).size.width * 0.32,
            child: CoverImageCenter(book: book),
          ),
          // Scrollable content
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                BookInfo(book: book)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
