import 'dart:ui';

import 'package:delta_ebookstore_app/models/book/book_model.dart';
import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  final BookModel book;
  const CoverImage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            book.coverImage,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter:
                ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Adjust blur intensity
            child: Container(
              color: Colors.black.withOpacity(0.1), // Optional tint color
            ),
          ),
        ],
      ),
    );
  }
}
