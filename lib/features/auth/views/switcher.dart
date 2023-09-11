import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pofy/features/auth/views/signin.dart';
import 'package:pofy/features/auth/views/signup.dart';
import 'package:pofy/features/auth/views/state/auth_screen_state.dart';

class SwitcherScreen extends ConsumerWidget {
  const SwitcherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(ref.watch(currentAuthScreenProvider));
    return Scaffold(
      body: ref.watch(currentAuthScreenProvider) == AuthScreens.signup
          ? const SignUpScreen()
          : const SigninScreen(),
    );
  }
}
