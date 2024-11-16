import 'package:delta_ebookstore_app/models/book/book_model.dart';
import 'package:delta_ebookstore_app/widgets/store_screen_widgets/featured_book_card.dart';
import 'package:flutter/material.dart';

class FeaturedBooks extends StatelessWidget {
  const FeaturedBooks({super.key});

  @override
  Widget build(BuildContext context) {
    List<BookModel> sampleBooks = BookModel.sampleBooks;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sampleBooks.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: FeaturedBookCard(
              book: sampleBooks[index],
            ),
          ),
        ),
      ),
    );
  }
}
