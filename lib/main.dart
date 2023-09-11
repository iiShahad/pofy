import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pofy/core/palette.dart';
import 'package:pofy/router.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final ColorScheme colorScheme =
      ColorScheme.fromSeed(seedColor: primaryColor, secondary: secondaryColor);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'Pofy',
      theme: Palette.theme,
      routerConfig: router,
    );
  }
}
