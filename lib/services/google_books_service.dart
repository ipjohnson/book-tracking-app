import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:book_tracking_app/models/book.dart';

class GoogleBooksService {
  static const _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  final String? apiKey;

  GoogleBooksService({this.apiKey});

  String _buildUrl(String params) {
    final key = apiKey != null ? '&key=$apiKey' : '';
    return '$_baseUrl?$params$key';
  }

  Future<List<Book>> searchBooks(String query) async {
    if (query.trim().isEmpty) return [];

    final uri = Uri.parse(
        _buildUrl('q=${Uri.encodeComponent(query)}&maxResults=20'));
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw HttpException(response.statusCode, response.body);
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    final items = data['items'] as List<dynamic>?;
    if (items == null) return [];

    return items
        .map((item) => Book.fromGoogleBooksJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<Book?> lookupByIsbn(String isbn) async {
    final uri = Uri.parse(_buildUrl('q=isbn:$isbn&maxResults=1'));
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw HttpException(response.statusCode, response.body);
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    final items = data['items'] as List<dynamic>?;
    if (items == null || items.isEmpty) return null;

    return Book.fromGoogleBooksJson(items.first as Map<String, dynamic>);
  }
}

class HttpException implements Exception {
  final int statusCode;
  final String body;

  HttpException(this.statusCode, this.body);

  @override
  String toString() {
    if (statusCode == 429) {
      return 'API rate limit exceeded. Try again later.';
    }
    return 'API error ($statusCode)';
  }
}
