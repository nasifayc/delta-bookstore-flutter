import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String title;
  final String author;
  final bool hasAudio;
  final double rating;
  final int reviews;
  final String genre;
  final int year;
  final String language;
  final int totalPurchases;
  final String coverImage;

  const BookModel({
    required this.title,
    required this.author,
    required this.hasAudio,
    required this.rating,
    required this.reviews,
    required this.genre,
    required this.year,
    required this.language,
    required this.totalPurchases,
    this.coverImage = 'assets/images/nav_background.jpg',
  });

  // Factory constructor to create a Book from JSON
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] as String,
      author: json['author'] as String,
      hasAudio: json['hasAudio'] as bool,
      rating: (json['rating'] as num).toDouble(),
      reviews: json['reviews'] as int,
      genre: json['genre'] as String,
      year: json['year'] as int,
      language: json['language'] as String,
      totalPurchases: json['totalPurchases'] as int,
      coverImage: json['coverImage'] as String,
    );
  }

  // Method to convert a Book object to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'hasAudio': hasAudio,
      'rating': rating,
      'reviews': reviews,
      'genre': genre,
      'year': year,
      'language': language,
      'totalPurchases': totalPurchases,
      'coverImage': coverImage,
    };
  }

  @override
  List<Object?> get props => [
        title,
        author,
        hasAudio,
        rating,
        reviews,
        genre,
        year,
        language,
        totalPurchases,
        coverImage,
      ];

  // Static data
  static List<BookModel> get sampleBooks => const [
        BookModel(
          title: "The Silent Patient",
          author: "Alex Michaelides",
          hasAudio: false,
          rating: 4.3,
          reviews: 25000,
          genre: "Thriller",
          year: 2019,
          language: "English",
          totalPurchases: 500000,
        ),
        BookModel(
          title: "Atomic Habits",
          author: "James Clear",
          hasAudio: true,
          rating: 4.8,
          reviews: 35000,
          genre: "Self-Help",
          year: 2018,
          language: "English",
          totalPurchases: 1000000,
        ),
        BookModel(
          title: "Dune",
          author: "Frank Herbert",
          hasAudio: true,
          rating: 4.7,
          reviews: 40000,
          genre: "Science Fiction",
          year: 1965,
          language: "English",
          totalPurchases: 2000000,
        ),
        BookModel(
          title: "Becoming",
          author: "Michelle Obama",
          hasAudio: true,
          rating: 4.9,
          reviews: 50000,
          genre: "Biography",
          year: 2018,
          language: "English",
          totalPurchases: 1500000,
        ),
        BookModel(
          title: "The Alchemist",
          author: "Paulo Coelho",
          hasAudio: false,
          rating: 4.6,
          reviews: 45000,
          genre: "Fiction",
          year: 1988,
          language: "Portuguese",
          totalPurchases: 6500000,
        ),
      ];
}
