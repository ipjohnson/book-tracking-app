import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:book_tracking_app/models/book.dart';
import 'package:book_tracking_app/providers/book_provider.dart';
import 'package:book_tracking_app/widgets/book_card.dart';
import 'package:book_tracking_app/widgets/book_list_tile.dart';
import 'package:book_tracking_app/widgets/empty_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Tracker')),
      body: Consumer<BookProvider>(
        builder: (context, provider, _) {
          final reading = provider.readingBooks;
          final wantToRead = provider.wantToReadBooks;

          if (reading.isEmpty && wantToRead.isEmpty) {
            return EmptyState(
              icon: Icons.menu_book,
              message: 'No books yet! Start by searching for books to add.',
              actionLabel: 'Search Books',
              onAction: () => context.go('/search'),
            );
          }

          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            children: [
              if (reading.isNotEmpty) ...[
                _sectionHeader(context, 'Currently Reading'),
                SizedBox(
                  height: 230,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: reading.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return BookCard(
                        book: reading[index],
                        onTap: () => _goToDetail(context, reading[index]),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
              if (wantToRead.isNotEmpty) ...[
                _sectionHeader(context, 'Want to Read'),
                ...wantToRead.map((book) => BookListTile(
                      book: book,
                      showStatus: false,
                      onTap: () => _goToDetail(context, book),
                    )),
              ],
            ],
          );
        },
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  void _goToDetail(BuildContext context, Book book) {
    context.push('/book/${book.id}');
  }
}
