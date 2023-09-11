import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pofy/core/palette.dart';
import 'package:pofy/features/auth/views/state/auth_screen_state.dart';

class SwitchAuthScreens extends StatelessWidget {
  const SwitchAuthScreens({
    super.key,
    required this.buttonLabel,
    required this.label,
    required this.desiredScreen,
  });
  final String buttonLabel;
  final String label;
  final AuthScreens desiredScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style:
              const TextStyle(color: Palette.text, fontWeight: FontWeight.bold),
        ),
        Consumer(
          builder: (context, ref, child) => TextButton(
            onPressed: () {
              ref
                  .read(currentAuthScreenProvider.notifier)
                  .update((state) => desiredScreen);
            },
            child: Text(
              buttonLabel,
              style: const TextStyle(
                color: Palette.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
