import 'package:flutter/foundation.dart';
import 'package:book_tracking_app/models/book.dart';
import 'package:book_tracking_app/services/google_books_service.dart';

enum ScanMode { camera, manual }

enum ScanState { idle, scanning, loading, found, notFound, error }

class ScanProvider extends ChangeNotifier {
  final GoogleBooksService _service;

  ScanMode _mode = ScanMode.manual;
  ScanMode get mode => _mode;

  ScanState _state = ScanState.idle;
  ScanState get state => _state;

  Book? _scannedBook;
  Book? get scannedBook => _scannedBook;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ScanProvider(this._service);

  void setMode(ScanMode mode) {
    _mode = mode;
    notifyListeners();
  }

  Future<void> lookupIsbn(String isbn) async {
    if (isbn.trim().isEmpty) return;

    _state = ScanState.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final book = await _service.lookupByIsbn(isbn.trim());
      if (book != null) {
        _scannedBook = book;
        _state = ScanState.found;
      } else {
        _state = ScanState.notFound;
      }
    } catch (e) {
      _state = ScanState.error;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  void reset() {
    _state = ScanState.idle;
    _scannedBook = null;
    _errorMessage = null;
    notifyListeners();
  }
}
