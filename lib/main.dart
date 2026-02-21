import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_tracking_app/app.dart';
import 'package:book_tracking_app/database/connection.dart';
import 'package:book_tracking_app/services/book_repository.dart';
import 'package:book_tracking_app/services/google_books_service.dart';
import 'package:book_tracking_app/providers/book_provider.dart';
import 'package:book_tracking_app/providers/search_provider.dart';
import 'package:book_tracking_app/providers/scan_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final db = constructDb();
  final repository = BookRepository(db);
  final googleBooksService = GoogleBooksService();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookProvider(repository)),
        ChangeNotifierProvider(create: (_) => SearchProvider(googleBooksService)),
        ChangeNotifierProvider(create: (_) => ScanProvider(googleBooksService)),
      ],
      child: const BookTrackingApp(),
    ),
  );
}
