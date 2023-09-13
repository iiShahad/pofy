import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pofy/core/palette.dart';
import 'package:pofy/core/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://orrzblorsgyzdrriwxgo.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9ycnpibG9yc2d5emRycml3eGdvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ1Mjk0MDcsImV4cCI6MjAxMDEwNTQwN30.a6nWEfr8oW1Vo3aU55ENBR4-k7k6D-Fvx-QcevPMz50',
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

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
