import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/models/book/book_model.dart';
import 'package:flutter/material.dart';

class FeaturedBookCard extends StatelessWidget {
  final BookModel book;
  const FeaturedBookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            color: theme.primaryBackground,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: theme.tertiary.withOpacity(0.4),
                offset: const Offset(0, 2),
                spreadRadius: 2,
                blurRadius: 2,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(book.coverImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    book.title,
                    style: theme.typography.bodyMedium.copyWith(
                        color: theme.primary, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    book.author,
                    style: theme.typography.bodySmall
                        .copyWith(color: theme.tertiary),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.menu_book_rounded,
                        color: theme.primary,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      book.hasAudio
                          ? Icon(
                              Icons.headphones,
                              color: theme.primary,
                              size: 20,
                            )
                          : const SizedBox.shrink()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
