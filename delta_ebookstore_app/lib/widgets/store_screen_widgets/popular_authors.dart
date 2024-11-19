import 'package:delta_ebookstore_app/widgets/store_screen_widgets/popular_authors_card.dart';
import 'package:flutter/material.dart';

class PopularAuthors extends StatelessWidget {
  const PopularAuthors({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: PopularAuthorsCard(),
          );
        },
      ),
    );
  }
}
