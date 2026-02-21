import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:book_tracking_app/screens/home_screen.dart';
import 'package:book_tracking_app/screens/search_screen.dart';
import 'package:book_tracking_app/screens/scan_screen.dart';
import 'package:book_tracking_app/screens/library_screen.dart';
import 'package:book_tracking_app/screens/book_detail_screen.dart';
import 'package:book_tracking_app/widgets/bottom_nav_shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomNavShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const SearchScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/scan',
              builder: (context, state) => const ScanScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/library',
              builder: (context, state) => const LibraryScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/book/:id',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final bookId = int.tryParse(state.pathParameters['id'] ?? '');
        return BookDetailScreen(bookId: bookId);
      },
    ),
    GoRoute(
      path: '/preview',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        return const BookDetailScreen();
      },
    ),
  ],
);

class BookTrackingApp extends StatelessWidget {
  const BookTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Book Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      routerConfig: router,
    );
  }
}
