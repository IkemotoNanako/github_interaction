import 'package:flutter/material.dart';
import 'package:github_interaction/ui/auth/auth_page.dart';
import 'package:github_interaction/ui/common/base_page.dart';
import 'package:github_interaction/ui/home/home_page.dart';
import 'package:github_interaction/ui/qr/qr_page.dart';
import 'package:github_interaction/ui/search/detaild_page.dart';
import 'package:github_interaction/ui/search/search_page.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'auth',
      path: '/',
      builder: (context, state) => const AuthPage(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => BasePage(
        child: child,
      ),
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/qr',
          builder: (context, state) => const QrPage(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchPage(),
          routes: <RouteBase>[
            GoRoute(
              path: 'details',
              builder: (context, state) => const DetailsPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
