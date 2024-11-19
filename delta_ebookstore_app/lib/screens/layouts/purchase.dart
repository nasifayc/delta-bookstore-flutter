import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/models/book/book_model.dart';
import 'package:delta_ebookstore_app/widgets/book_detail/cover_image.dart';
import 'package:delta_ebookstore_app/widgets/book_detail/cover_image_center.dart';
import 'package:delta_ebookstore_app/widgets/common/primary_button.dart';
import 'package:delta_ebookstore_app/widgets/common/secondary_button.dart';
import 'package:flutter/material.dart';

class Purchase extends StatefulWidget {
  final BookModel book;
  const Purchase({super.key, required this.book});

  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Purchase',
          style: theme.typography.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CoverImage(book: widget.book),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.09,
                    left: MediaQuery.of(context).size.width * 0.32,
                    child: CoverImageCenter(book: widget.book),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'BookType',
                style: theme.typography.titleMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryButton(
                      width: MediaQuery.of(context).size.width * 0.3,
                      onPressed: () => setState(() {
                            index = 0;
                          }),
                      color: index == 0
                          ? theme.primary
                          : theme.primary.withOpacity(0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.book,
                                size: 15,
                                color: index == 0
                                    ? theme.secondary
                                    : theme.primary,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Ebook',
                                style: index == 0
                                    ? theme.typography.bodySmallWhite
                                    : theme.typography.titleMedium,
                              ),
                            ],
                          ),
                          Text(
                            '${widget.book.price} ETB',
                            style: index == 0
                                ? theme.typography.bodySmallWhite
                                : theme.typography.bodySmall,
                          )
                        ],
                      )),
                  PrimaryButton(
                      width: MediaQuery.of(context).size.width * 0.3,
                      onPressed: () => setState(() {
                            index = 1;
                          }),
                      color: index == 1
                          ? theme.primary
                          : theme.primary.withOpacity(0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.headphones,
                                size: 15,
                                color: index == 1
                                    ? theme.primaryBackground
                                    : theme.secondary,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Audio',
                                style: index == 1
                                    ? theme.typography.bodySmallWhite
                                    : theme.typography.titleMedium,
                              ),
                            ],
                          ),
                          Text(
                            '${widget.book.price + 45} ETB',
                            style: index == 1
                                ? theme.typography.bodySmallWhite
                                : theme.typography.bodySmall,
                          )
                        ],
                      )),
                  PrimaryButton(
                      width: MediaQuery.of(context).size.width * 0.3,
                      onPressed: () => setState(() {
                            index = 2;
                          }),
                      color: index == 2
                          ? theme.primary
                          : theme.primary.withOpacity(0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Combo',
                            style: index == 2
                                ? theme.typography.bodySmallWhite
                                : theme.typography.titleMedium,
                          ),
                          Text(
                            '${(widget.book.price + 45) + widget.book.price} ETB',
                            style: index == 2
                                ? theme.typography.bodySmallWhite
                                : theme.typography.bodySmall,
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              PrimaryButton(
                  onPressed: null,
                  color: theme.primary,
                  child: Text(
                    'Purchase',
                    style: theme.typography.labelMedium,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
