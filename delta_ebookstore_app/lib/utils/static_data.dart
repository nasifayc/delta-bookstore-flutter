import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StaticData {
  static Future<dynamic> showDialogBox(
    BuildContext context,
    Text title,
    Text content,
  ) {
    AppTheme theme = AppTheme.of(context);
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: theme.primaryBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              15.0), // Set border radius for rounded corners
        ),
        title: title,
        content: content,
        actions: [
          Center(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Text(
                'Ok',
                style: theme.typography.headlineSmall,
              ),
            ),
          )
        ],
      ),
    );
  }

  static Shimmer getShimmerEffect(AppTheme theme, {double height = 100}) {
    return Shimmer.fromColors(
      baseColor: theme.primary,
      highlightColor: Colors.white,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            color: theme.tertiary, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  static List<Map<String, dynamic>> getbook() {
    return [
      {
        "title": "Res Yelewim",
        "author": "Elias Shitahun",
        "year": 2000,
        "coverImage": "assests/images/",
        "hasAudio": true,
        "rating": 4.5,
        "genre": "Poetry",
        "Purchases": 1000,
        "language": "Amharic",
        "reviews": [
          {"username": "User 1", "rating": 5, "comment": "Great book!"},
          {"username": "User 2", "rating": 4, "comment": "Average."},
          {"username": "User 3", "rating": 3, "comment": "Needs improvement."}
        ]
      },
      {
        "title": "Yemisam Terara",
        "author": "Fikremarkos Debebe",
        "year": 1990,
        "coverImage": "assests/images/",
        "hasAudio": false,
        "rating": 3.5,
        "genre": "Poetry",
        "Purchases": 1000,
        "language": "Amharic",
        "reviews": [
          {"username": "User 1", "rating": 5, "comment": "Great book!"},
          {"username": "User 2", "rating": 4, "comment": "Average."},
          {"username": "User 3", "rating": 3, "comment": "Needs improvement."}
        ]
      },
      {
        "title": "Zubeyda",
        "author": "Alex Abreham",
        "year": 2006,
        "coverImage": "assests/images/",
        "hasAudio": true,
        "rating": 4.8,
        "genre": "Poetry",
        "Purchases": 5456,
        "language": "Amharic",
        "reviews": [
          {"username": "User 1", "rating": 5, "comment": "Great book!"},
          {"username": "User 2", "rating": 4, "comment": "Average."},
          {"username": "User 3", "rating": 3, "comment": "Needs improvement."}
        ]
      },
      {
        "title": "Book 1",
        "author": "Author 1",
        "year": 2000,
        "coverImage": "assests/images/",
        "hasAudio": true,
        "rating": 4.5,
        "genre": "Poetry",
        "Purchases": 1000,
        "language": "Amharic",
        "reviews": [
          {"username": "User 1", "rating": 5, "comment": "Great book!"},
          {"username": "User 2", "rating": 4, "comment": "Average."},
          {"username": "User 3", "rating": 3, "comment": "Needs improvement."}
        ]
      }
    ];
  }
}
