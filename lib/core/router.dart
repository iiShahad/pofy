import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pofy/features/auth/controllers/auth_controller.dart';
import 'package:pofy/features/auth/views/switcher.dart';
import '../features/layout/screens/layout_screen.dart';
import '../features/home/screens/home_page.dart';
import '../features/marketplace/screens/marketplace_page.dart';
import '../features/portfolio/screens/portfolio_page.dart';
import '../features/settings/screens/settings_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final _rootNavigatorKey = GlobalKey<NavigatorState>();
//---
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorMarketplaceKey =
    GlobalKey<NavigatorState>(debugLabel: 'marketplace');
final _shellNavigatorPortfolioKey =
    GlobalKey<NavigatorState>(debugLabel: 'portfolio');
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'settings');

final goRouterProvider = Provider((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) => const SwitcherScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return Layout(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: Home()),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMarketplaceKey,
            routes: [
              GoRoute(
                path: '/marketplace',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: Marketplace()),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorPortfolioKey,
            routes: [
              GoRoute(
                path: '/portfolio',
                builder: (context, state) {
                  return const Portfolio();
                },
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettingsKey,
            routes: [
              GoRoute(
                  path: '/settings',
                  builder: (context, state) {
                    return const Settings();
                  },
                  routes: []),
            ],
          )
        ],
      ),
    ],
    redirect: (context, state) {
      bool userIsAuthinticated = false;
      final userIsRegistring = state.uri.toString() == '/auth';
      ref.watch(authStateChangeProvider).whenData((value) {
        userIsAuthinticated = value.event == supabase.AuthChangeEvent.signedIn;
      });

      if (userIsRegistring && userIsAuthinticated) {
        return '/home';
      } else if ((!userIsRegistring && !userIsAuthinticated)) {
        return '/auth';
      } else {
        return null;
      }
    },
  );
});
