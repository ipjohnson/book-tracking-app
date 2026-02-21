import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_tracking_app/models/book.dart';
import 'package:book_tracking_app/providers/book_provider.dart';
import 'package:book_tracking_app/providers/search_provider.dart';
import 'package:book_tracking_app/widgets/empty_state.dart';
import 'package:book_tracking_app/utils/debouncer.dart';
import 'package:book_tracking_app/screens/book_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final _debouncer = Debouncer();

  @override
  void dispose() {
    _controller.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Books')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search by title, author, or ISBN...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          context.read<SearchProvider>().clear();
                          setState(() {});
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {});
                _debouncer.run(() {
                  context.read<SearchProvider>().search(value);
                });
              },
            ),
          ),
          Expanded(
            child: Consumer<SearchProvider>(
              builder: (context, search, _) {
                if (search.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (search.error != null) {
                  return EmptyState(
                    icon: Icons.error_outline,
                    message: search.error!,
                  );
                }

                if (search.query.isEmpty) {
                  return const EmptyState(
                    icon: Icons.search,
                    message: 'Search for books to add to your library.',
                  );
                }

                if (search.results.isEmpty) {
                  return const EmptyState(
                    icon: Icons.search_off,
                    message: 'No books found. Try a different search.',
                  );
                }

                return ListView.builder(
                  itemCount: search.results.length,
                  itemBuilder: (context, index) {
                    final book = search.results[index];
                    return _SearchResultTile(book: book);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchResultTile extends StatelessWidget {
  final Book book;

  const _SearchResultTile({required this.book});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Book?>(
      future: book.googleBooksId != null
          ? context.read<BookProvider>().findByGoogleBooksId(book.googleBooksId!)
          : Future.value(null),
      builder: (context, snapshot) {
        final savedBook = snapshot.data;
        final isSaved = savedBook != null;

        return ListTile(
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
          title: Text(book.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          subtitle: Text(book.authors, maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: isSaved
              ? const Icon(Icons.check_circle, color: Colors.green)
              : null,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BookDetailScreen(
                  previewBook: isSaved ? null : book,
                  bookId: savedBook?.id,
                ),
              ),
            );
          },
        );
      },
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
