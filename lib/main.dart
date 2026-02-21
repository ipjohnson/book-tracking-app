import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_tracking_app/app.dart';
import 'package:book_tracking_app/database/connection.dart';
import 'package:book_tracking_app/services/book_repository.dart';
import 'package:book_tracking_app/services/settings_repository.dart';
import 'package:book_tracking_app/services/google_books_service.dart';
import 'package:book_tracking_app/providers/book_provider.dart';
import 'package:book_tracking_app/providers/search_provider.dart';
import 'package:book_tracking_app/providers/scan_provider.dart';
import 'package:book_tracking_app/providers/settings_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final db = constructDb();
  final bookRepository = BookRepository(db);
  final settingsRepository = SettingsRepository(db);
  final settingsProvider = SettingsProvider(settingsRepository);

  final googleBooksService = GoogleBooksService(
    apiKeyGetter: () => settingsProvider.apiKey,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: settingsProvider),
        ChangeNotifierProvider(create: (_) => BookProvider(bookRepository)),
        ChangeNotifierProvider(create: (_) => SearchProvider(googleBooksService)),
        ChangeNotifierProvider(create: (_) => ScanProvider(googleBooksService)),
      ],
      child: const BookTrackingApp(),
    ),
  );
}
