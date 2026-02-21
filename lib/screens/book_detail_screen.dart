import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_tracking_app/models/book.dart';
import 'package:book_tracking_app/providers/book_provider.dart';
import 'package:book_tracking_app/utils/constants.dart';
import 'package:book_tracking_app/widgets/rating_stars.dart';
import 'package:book_tracking_app/widgets/status_badge.dart';

class BookDetailScreen extends StatefulWidget {
  final int? bookId;
  final Book? previewBook;

  const BookDetailScreen({super.key, this.bookId, this.previewBook});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  Book? _book;
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
    if (widget.previewBook != null) {
      _book = widget.previewBook;
      _isSaved = false;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.bookId != null) {
      final provider = context.read<BookProvider>();
      final found = provider.allBooks.where((b) => b.id == widget.bookId);
      if (found.isNotEmpty) {
        _book = found.first;
        _isSaved = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Re-read from provider to get live updates
    if (widget.bookId != null) {
      final provider = context.watch<BookProvider>();
      final found = provider.allBooks.where((b) => b.id == widget.bookId);
      if (found.isNotEmpty) {
        _book = found.first;
        _isSaved = true;
      }
    }

    if (_book == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Book not found.')),
      );
    }

    final book = _book!;

    return Scaffold(
      appBar: AppBar(
        actions: [
          if (_isSaved)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _confirmDelete(context, book),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover + basic info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: book.thumbnailUrl != null
                      ? Image.network(
                          book.thumbnailUrl!,
                          width: 120,
                          height: 180,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _placeholder(),
                        )
                      : _placeholder(),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        book.authors,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                      if (book.publisher != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          book.publisher!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                      if (book.publishedDate != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          book.publishedDate!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                      if (book.pageCount != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          '${book.pageCount} pages',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                      if (_isSaved) ...[
                        const SizedBox(height: 8),
                        StatusBadge(status: book.status),
                      ],
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Actions
            if (_isSaved) ...[
              // Status picker
              Text('Status',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              SegmentedButton<BookStatus>(
                segments: BookStatus.values
                    .map((s) => ButtonSegment(
                          value: s,
                          label: Text(s.label),
                          icon: Icon(s.icon),
                        ))
                    .toList(),
                selected: {book.status},
                onSelectionChanged: (statuses) {
                  _updateBook(book.copyWith(status: statuses.first));
                },
              ),
              const SizedBox(height: 20),
              // Rating
              Text('Rating',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              RatingStars(
                rating: book.rating,
                onChanged: (rating) {
                  _updateBook(book.copyWith(rating: rating));
                },
              ),
            ] else ...[
              // Preview mode — save button
              SizedBox(
                width: double.infinity,
                child: _SaveButton(book: book, onSaved: (saved) {
                  setState(() {
                    _book = saved;
                    _isSaved = true;
                  });
                }),
              ),
            ],

            // Description
            if (book.description != null) ...[
              const SizedBox(height: 24),
              Text('Description',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              Text(book.description!),
            ],

            // ISBN info
            if (book.isbn13 != null || book.isbn10 != null) ...[
              const SizedBox(height: 24),
              Text('ISBN',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 4),
              if (book.isbn13 != null) Text('ISBN-13: ${book.isbn13}'),
              if (book.isbn10 != null) Text('ISBN-10: ${book.isbn10}'),
            ],
          ],
        ),
      ),
    );
  }

  void _updateBook(Book updated) {
    context.read<BookProvider>().updateBook(updated);
  }

  void _confirmDelete(BuildContext context, Book book) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Book'),
        content: Text('Remove "${book.title}" from your library?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              context.read<BookProvider>().deleteBook(book.id!);
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      width: 120,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.book, size: 40, color: Colors.grey),
    );
  }
}

class _SaveButton extends StatefulWidget {
  final Book book;
  final ValueChanged<Book> onSaved;

  const _SaveButton({required this.book, required this.onSaved});

  @override
  State<_SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<_SaveButton> {
  BookStatus _selectedStatus = BookStatus.wantToRead;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SegmentedButton<BookStatus>(
          segments: BookStatus.values
              .map((s) => ButtonSegment(
                    value: s,
                    label: Text(s.label),
                    icon: Icon(s.icon),
                  ))
              .toList(),
          selected: {_selectedStatus},
          onSelectionChanged: (statuses) {
            setState(() => _selectedStatus = statuses.first);
          },
        ),
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: () async {
            final saved = await context.read<BookProvider>().addBook(
                  widget.book.copyWith(status: _selectedStatus),
                );
            widget.onSaved(saved);
          },
          icon: const Icon(Icons.add),
          label: const Text('Save to Library'),
        ),
      ],
    );
  }
}
