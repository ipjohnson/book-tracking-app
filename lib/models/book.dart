import 'package:book_tracking_app/utils/constants.dart';

class Book {
  final int? id;
  final String title;
  final String authors;
  final String? isbn10;
  final String? isbn13;
  final String? thumbnailUrl;
  final String? description;
  final String? publisher;
  final int? pageCount;
  final String? publishedDate;
  final BookStatus status;
  final DateTime dateAdded;
  final int rating;
  final String? googleBooksId;

  const Book({
    this.id,
    required this.title,
    required this.authors,
    this.isbn10,
    this.isbn13,
    this.thumbnailUrl,
    this.description,
    this.publisher,
    this.pageCount,
    this.publishedDate,
    this.status = BookStatus.wantToRead,
    required this.dateAdded,
    this.rating = 0,
    this.googleBooksId,
  });

  factory Book.fromGoogleBooksJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] as Map<String, dynamic>? ?? {};
    final identifiers =
        volumeInfo['industryIdentifiers'] as List<dynamic>? ?? [];

    String? isbn10;
    String? isbn13;
    for (final id in identifiers) {
      final map = id as Map<String, dynamic>;
      if (map['type'] == 'ISBN_10') isbn10 = map['identifier'] as String?;
      if (map['type'] == 'ISBN_13') isbn13 = map['identifier'] as String?;
    }

    String? thumbnail =
        (volumeInfo['imageLinks'] as Map<String, dynamic>?)?['thumbnail']
            as String?;
    if (thumbnail != null) {
      thumbnail = thumbnail.replaceFirst('http://', 'https://');
    }

    final authorsList = volumeInfo['authors'] as List<dynamic>?;

    return Book(
      title: volumeInfo['title'] as String? ?? 'Unknown Title',
      authors: authorsList?.join(', ') ?? 'Unknown Author',
      isbn10: isbn10,
      isbn13: isbn13,
      thumbnailUrl: thumbnail,
      description: volumeInfo['description'] as String?,
      publisher: volumeInfo['publisher'] as String?,
      pageCount: volumeInfo['pageCount'] as int?,
      publishedDate: volumeInfo['publishedDate'] as String?,
      dateAdded: DateTime.now(),
      googleBooksId: json['id'] as String?,
    );
  }

  Book copyWith({
    int? id,
    String? title,
    String? authors,
    String? isbn10,
    String? isbn13,
    String? thumbnailUrl,
    String? description,
    String? publisher,
    int? pageCount,
    String? publishedDate,
    BookStatus? status,
    DateTime? dateAdded,
    int? rating,
    String? googleBooksId,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      isbn10: isbn10 ?? this.isbn10,
      isbn13: isbn13 ?? this.isbn13,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      description: description ?? this.description,
      publisher: publisher ?? this.publisher,
      pageCount: pageCount ?? this.pageCount,
      publishedDate: publishedDate ?? this.publishedDate,
      status: status ?? this.status,
      dateAdded: dateAdded ?? this.dateAdded,
      rating: rating ?? this.rating,
      googleBooksId: googleBooksId ?? this.googleBooksId,
    );
  }
}
