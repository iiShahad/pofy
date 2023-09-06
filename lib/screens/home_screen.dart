import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pofy/router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: Column(
        children: [
          const Text('Home'),
          ElevatedButton(
            onPressed: () {
              ref.read(goRouterProvider).go('/sign-in');
            },
            child: const Text('Sign In'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(goRouterProvider).go('/sign-up');
            },
            child: const Text('Sign Up'),
          ),
        ],
      )),
    );
  }
}
