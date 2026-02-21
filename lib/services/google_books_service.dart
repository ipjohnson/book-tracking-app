import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:book_tracking_app/models/book.dart';

class GoogleBooksService {
  static const _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<Book>> searchBooks(String query) async {
    if (query.trim().isEmpty) return [];

    final uri = Uri.parse('$_baseUrl?q=${Uri.encodeComponent(query)}&maxResults=20');
    final response = await http.get(uri);

    if (response.statusCode != 200) return [];

    final data = json.decode(response.body) as Map<String, dynamic>;
    final items = data['items'] as List<dynamic>?;
    if (items == null) return [];

    return items
        .map((item) => Book.fromGoogleBooksJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<Book?> lookupByIsbn(String isbn) async {
    final uri = Uri.parse('$_baseUrl?q=isbn:$isbn&maxResults=1');
    final response = await http.get(uri);

    if (response.statusCode != 200) return null;

    final data = json.decode(response.body) as Map<String, dynamic>;
    final items = data['items'] as List<dynamic>?;
    if (items == null || items.isEmpty) return null;

    return Book.fromGoogleBooksJson(items.first as Map<String, dynamic>);
  }
}
