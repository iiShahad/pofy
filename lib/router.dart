import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pofy/features/auth/views/switcher.dart';

import 'features/layout/screens/layout_screen.dart';
import 'features/home/screens/home_page.dart';
import 'features/marketplace/screens/marketplace_page.dart';
import 'features/portfolio/screens/portfolio_page.dart';
import 'features/settings/screens/settings_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey =
GlobalKey<NavigatorState>(debugLabel: 'layout');
final _shellNavigatorMarketplaceKey =
GlobalKey<NavigatorState>(debugLabel: 'marketplace');
final _shellNavigatorPortfolioKey =
GlobalKey<NavigatorState>(debugLabel: 'portfolio');
final _shellNavigatorSettingsKey =
GlobalKey<NavigatorState>(debugLabel: 'settings');

final goRouterProvider = Provider((ref) {
  return GoRouter(
      initialLocation: '/auth',
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          path: '/auth',
          builder: (context, state) => const SwitcherScreen(),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => const SizedBox(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            // the UI shell
            return Layout(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorHomeKey,
              routes: [
                GoRoute(
                  path: '/home',
                  pageBuilder: (context, state) => const NoTransitionPage(child: Home()),
                  routes: [
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorMarketplaceKey,
              routes: [
                GoRoute(
                  path: '/leaderboard',
                  pageBuilder: (context, state) => NoTransitionPage(child: Marketplace()),
                  routes: [
                  ],
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
                  routes: [
                  ],
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
                    routes: [
                    ]),
              ],
            )
          ],
        ),
      ]);
});
