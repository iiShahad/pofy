import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pofy/screens/home_screen.dart';
import 'package:pofy/screens/signin_screen.dart';
import 'package:pofy/screens/signup_screen.dart';

final goRouterProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/sign-in',
    routes: [
      GoRoute(
        path: '/sign-in',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      )
    ],
  );
});
