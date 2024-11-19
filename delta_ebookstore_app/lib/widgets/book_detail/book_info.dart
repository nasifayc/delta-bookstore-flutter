import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/models/book/book_model.dart';
import 'package:delta_ebookstore_app/screens/layouts/purchase.dart';
import 'package:delta_ebookstore_app/widgets/common/primary_button.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  final BookModel book;
  const BookInfo({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: theme.typography.headlineMedium,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'By ${book.author}',
                      style: theme.typography.titleSmall
                          .copyWith(color: theme.secondary),
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Purchase(
                      book: book,
                    ),
                  ));
                },
                color: theme.primary,
                width: MediaQuery.of(context).size.width * 0.4,
                child: const Text('Get Book'),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                color: theme.primary.withOpacity(0.5),
                border: Border.all(color: theme.primary, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.movie_creation_outlined,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Genre',
                          style: theme.typography.bodySmall
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      book.genre,
                      style: theme.typography.bodySmall,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.language,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Language',
                          style: theme.typography.bodySmall
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      book.language,
                      style: theme.typography.bodySmall,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Year',
                          style: theme.typography.bodySmall
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      book.year.toString(),
                      style: theme.typography.bodySmall,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.people,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Purchases',
                          style: theme.typography.bodySmall
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      book.totalPurchases.toString(),
                      style: theme.typography.bodySmall,
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Description",
            style: theme.typography.bodyMedium
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "In a dystopian future ruled by technology, a young rebel discovers a hidden truth that could change humanity forever. As she journeys across the digital divide, she must outwit the system's enforcers to unveil the past. Will her courage be enough to rewrite their future?",
            style: theme.typography.bodySmall,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Rating and Reviews",
            style: theme.typography.bodyMedium
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                color: theme.primary.withOpacity(0.5),
                border: Border.all(color: theme.primary, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.orange,
                      ),
                      Text(
                        '4.8/5',
                        style: theme.typography.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Text(
                  '11 Votes',
                  style: theme.typography.bodySmall,
                ),
                Icon(
                  Icons.chevron_right_sharp,
                  color: theme.secondary,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
