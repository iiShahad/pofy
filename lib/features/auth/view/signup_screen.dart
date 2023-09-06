import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pofy/router.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
          child: Column(
        children: [
          const Text('Sign Up'),
          ElevatedButton(
            onPressed: () {
              ref.read(goRouterProvider).go('/sign-in');
            },
            child: const Text('Sign In'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(goRouterProvider).go('/');
            },
            child: const Text('Home'),
          ),
        ],
      )),
    );
  }
}