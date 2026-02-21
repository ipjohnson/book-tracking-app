import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:book_tracking_app/models/book.dart';
import 'package:book_tracking_app/providers/book_provider.dart';
import 'package:book_tracking_app/widgets/book_list_tile.dart';
import 'package:book_tracking_app/widgets/empty_state.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  String _filter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Library')),
      body: Consumer<BookProvider>(
        builder: (context, provider, _) {
          if (provider.allBooks.isEmpty) {
            return EmptyState(
              icon: Icons.library_books,
              message: 'Your library is empty.',
              actionLabel: 'Search Books',
              onAction: () => context.go('/search'),
            );
          }

          final filtered = _filter.isEmpty
              ? provider.allBooks
              : provider.allBooks.where((b) {
                  final q = _filter.toLowerCase();
                  return b.title.toLowerCase().contains(q) ||
                      b.authors.toLowerCase().contains(q);
                }).toList();

          // Group by author
          final grouped = <String, List<Book>>{};
          for (final book in filtered) {
            final author = book.authors;
            grouped.putIfAbsent(author, () => []).add(book);
          }
          final sortedAuthors = grouped.keys.toList()..sort();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Filter by title or author...',
                    prefixIcon: const Icon(Icons.filter_list),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    isDense: true,
                  ),
                  onChanged: (value) => setState(() => _filter = value),
                ),
              ),
              Expanded(
                child: filtered.isEmpty
                    ? const EmptyState(
                        icon: Icons.search_off,
                        message: 'No books match your filter.',
                      )
                    : ListView.builder(
                        itemCount: sortedAuthors.length,
                        itemBuilder: (context, index) {
                          final author = sortedAuthors[index];
                          final books = grouped[author]!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16, 16, 16, 4),
                                child: Text(
                                  author,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                              ),
                              ...books.map((book) => BookListTile(
                                    book: book,
                                    onTap: () =>
                                        context.push('/book/${book.id}'),
                                  )),
                            ],
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
