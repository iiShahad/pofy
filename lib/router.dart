import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pofy/features/auth/views/switcher.dart';

final goRouterProvider = Provider((ref) {
  return GoRouter(initialLocation: '/auth', routes: [
    GoRoute(
      path: '/auth',
      builder: (context, state) => const SwitcherScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const SizedBox(),
    )
  ]);
});
