import 'package:delta_ebookstore_app/widgets/store_screen_widgets/book_preference.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Column(
          children: [BookPreference()],
        ),
      ),
    );
  }
}
