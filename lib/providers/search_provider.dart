import 'package:flutter/foundation.dart';
import 'package:book_tracking_app/models/book.dart';
import 'package:book_tracking_app/services/google_books_service.dart';

class SearchProvider extends ChangeNotifier {
  final GoogleBooksService _service;

  List<Book> _results = [];
  List<Book> get results => _results;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _query = '';
  String get query => _query;

  String? _error;
  String? get error => _error;

  SearchProvider(this._service);

  Future<void> search(String query) async {
    _query = query;
    if (query.trim().isEmpty) {
      _results = [];
      _error = null;
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _results = await _service.searchBooks(query);
    } catch (e) {
      _error = e.toString();
      _results = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _query = '';
    _results = [];
    _error = null;
    notifyListeners();
  }
}
