import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pofy/features/auth/views/signup.dart';
import 'package:pofy/features/auth/views/switcher.dart';

final goRouterProvider = Provider((ref) {
  return GoRouter(initialLocation: '/forgot-password', routes: [
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SwitcherScreen(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SizedBox(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const SizedBox(),
    )
  ]);
});
