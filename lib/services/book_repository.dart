import 'package:drift/drift.dart';
import 'package:book_tracking_app/database/database.dart';
import 'package:book_tracking_app/models/book.dart';
import 'package:book_tracking_app/utils/constants.dart';

class BookRepository {
  final AppDatabase _db;

  BookRepository(this._db);

  Stream<List<Book>> watchAllBooks() {
    return (_db.select(_db.books)
          ..orderBy([(t) => OrderingTerm.desc(t.dateAdded)]))
        .watch()
        .map((rows) => rows.map(_bookFromEntry).toList());
  }

  Stream<List<Book>> watchBooksByStatus(BookStatus status) {
    return (_db.select(_db.books)
          ..where((t) => t.status.equals(status.name))
          ..orderBy([(t) => OrderingTerm.desc(t.dateAdded)]))
        .watch()
        .map((rows) => rows.map(_bookFromEntry).toList());
  }

  Future<Book> insertBook(Book book) async {
    final id = await _db.into(_db.books).insert(BooksCompanion(
          title: Value(book.title),
          authors: Value(book.authors),
          isbn10: Value(book.isbn10),
          isbn13: Value(book.isbn13),
          thumbnailUrl: Value(book.thumbnailUrl),
          description: Value(book.description),
          publisher: Value(book.publisher),
          pageCount: Value(book.pageCount),
          publishedDate: Value(book.publishedDate),
          status: Value(book.status.name),
          dateAdded: Value(book.dateAdded),
          rating: Value(book.rating),
          googleBooksId: Value(book.googleBooksId),
        ));
    return book.copyWith(id: id);
  }

  Future<void> updateBook(Book book) async {
    await (_db.update(_db.books)..where((t) => t.id.equals(book.id!)))
        .write(BooksCompanion(
      title: Value(book.title),
      authors: Value(book.authors),
      isbn10: Value(book.isbn10),
      isbn13: Value(book.isbn13),
      thumbnailUrl: Value(book.thumbnailUrl),
      description: Value(book.description),
      publisher: Value(book.publisher),
      pageCount: Value(book.pageCount),
      publishedDate: Value(book.publishedDate),
      status: Value(book.status.name),
      dateAdded: Value(book.dateAdded),
      rating: Value(book.rating),
      googleBooksId: Value(book.googleBooksId),
    ));
  }

  Future<void> deleteBook(int id) async {
    await (_db.delete(_db.books)..where((t) => t.id.equals(id))).go();
  }

  Future<Book?> findByGoogleBooksId(String googleBooksId) async {
    final result = await (_db.select(_db.books)
          ..where((t) => t.googleBooksId.equals(googleBooksId)))
        .getSingleOrNull();
    if (result == null) return null;
    return _bookFromEntry(result);
  }

  Book _bookFromEntry(BookData row) {
    return Book(
      id: row.id,
      title: row.title,
      authors: row.authors,
      isbn10: row.isbn10,
      isbn13: row.isbn13,
      thumbnailUrl: row.thumbnailUrl,
      description: row.description,
      publisher: row.publisher,
      pageCount: row.pageCount,
      publishedDate: row.publishedDate,
      status: BookStatus.values.firstWhere(
        (s) => s.name == row.status,
        orElse: () => BookStatus.wantToRead,
      ),
      dateAdded: row.dateAdded,
      rating: row.rating,
      googleBooksId: row.googleBooksId,
    );
  }
}
