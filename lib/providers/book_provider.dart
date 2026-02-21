import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:book_tracking_app/models/book.dart';
import 'package:book_tracking_app/services/book_repository.dart';
import 'package:book_tracking_app/utils/constants.dart';

class BookProvider extends ChangeNotifier {
  final BookRepository _repository;

  List<Book> _allBooks = [];
  List<Book> get allBooks => _allBooks;

  List<Book> get readingBooks =>
      _allBooks.where((b) => b.status == BookStatus.reading).toList();

  List<Book> get wantToReadBooks =>
      _allBooks.where((b) => b.status == BookStatus.wantToRead).toList();

  List<Book> get readBooks =>
      _allBooks.where((b) => b.status == BookStatus.read).toList();

  StreamSubscription<List<Book>>? _subscription;

  BookProvider(this._repository) {
    _subscription = _repository.watchAllBooks().listen((books) {
      _allBooks = books;
      notifyListeners();
    });
  }

  Future<Book> addBook(Book book) async {
    return await _repository.insertBook(book);
  }

  Future<void> updateBook(Book book) async {
    await _repository.updateBook(book);
  }

  Future<void> deleteBook(int id) async {
    await _repository.deleteBook(id);
  }

  Future<bool> isBookSaved(String? googleBooksId) async {
    if (googleBooksId == null) return false;
    final existing = await _repository.findByGoogleBooksId(googleBooksId);
    return existing != null;
  }

  Future<Book?> findByGoogleBooksId(String googleBooksId) async {
    return await _repository.findByGoogleBooksId(googleBooksId);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
