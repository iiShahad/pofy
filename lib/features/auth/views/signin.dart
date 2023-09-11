import 'package:flutter/material.dart';
import 'package:pofy/core/common/gradient_button.dart';
import 'package:pofy/core/palette.dart';
import 'package:pofy/features/auth/views/state/auth_screen_state.dart';
import 'package:pofy/features/auth/views/widgets/switch_auth_screens.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/auth_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Palette.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Username"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                GradientButton(
                  onTap: () {},
                  text: "Sign In",
                ),
                const SwitchAuthScreens(
                  label: "You don’t have an account?",
                  buttonLabel: "Sign Up",
                  desiredScreen: AuthScreens.signup,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
