import 'package:flutter/material.dart';

enum BookStatus {
  reading,
  wantToRead,
  read;

  String get label {
    switch (this) {
      case BookStatus.reading:
        return 'Currently Reading';
      case BookStatus.wantToRead:
        return 'Want to Read';
      case BookStatus.read:
        return 'Read';
    }
  }

  Color get color {
    switch (this) {
      case BookStatus.reading:
        return Colors.blue;
      case BookStatus.wantToRead:
        return Colors.orange;
      case BookStatus.read:
        return Colors.green;
    }
  }

  IconData get icon {
    switch (this) {
      case BookStatus.reading:
        return Icons.auto_stories;
      case BookStatus.wantToRead:
        return Icons.bookmark_outline;
      case BookStatus.read:
        return Icons.check_circle_outline;
    }
  }
}
