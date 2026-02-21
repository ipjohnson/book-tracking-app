import 'package:flutter/material.dart';
import 'package:book_tracking_app/models/book.dart';
import 'package:book_tracking_app/widgets/status_badge.dart';

class BookListTile extends StatelessWidget {
  final Book book;
  final VoidCallback? onTap;
  final bool showStatus;

  const BookListTile({
    super.key,
    required this.book,
    this.onTap,
    this.showStatus = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: book.thumbnailUrl != null
            ? Image.network(
                book.thumbnailUrl!,
                width: 40,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _placeholder(),
              )
            : _placeholder(),
      ),
      title: Text(
        book.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        book.authors,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: showStatus ? StatusBadge(status: book.status) : null,
    );
  }

  Widget _placeholder() {
    return Container(
      width: 40,
      height: 60,
      color: Colors.grey[200],
      child: const Icon(Icons.book, size: 20, color: Colors.grey),
    );
  }
}
