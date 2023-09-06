import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pofy/features/auth/view/forget_password_screen.dart';
import 'package:pofy/screens/home_screen.dart';
import 'package:pofy/features/auth/view/signin_screen.dart';
import 'package:pofy/features/auth/view/signup_screen.dart';

final goRouterProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/forgot-password',
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
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) =>  ForgetPasswordScreen(),
      )
    ],
  );
});
