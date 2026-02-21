import 'package:flutter/foundation.dart';
import 'package:book_tracking_app/services/settings_repository.dart';

class SettingsProvider extends ChangeNotifier {
  final SettingsRepository _repository;

  static const _apiKeyKey = 'google_books_api_key';

  String? _apiKey;
  String? get apiKey => _apiKey;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  SettingsProvider(this._repository) {
    _load();
  }

  Future<void> _load() async {
    _apiKey = await _repository.get(_apiKeyKey);
    _isLoaded = true;
    notifyListeners();
  }

  Future<void> setApiKey(String key) async {
    final trimmed = key.trim();
    if (trimmed.isEmpty) {
      await _repository.delete(_apiKeyKey);
      _apiKey = null;
    } else {
      await _repository.set(_apiKeyKey, trimmed);
      _apiKey = trimmed;
    }
    notifyListeners();
  }
}
