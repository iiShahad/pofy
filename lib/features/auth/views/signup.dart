import 'package:flutter/material.dart';
import 'package:pofy/core/common/gradient_button.dart';
import 'package:pofy/core/palette.dart';
import 'package:pofy/features/auth/views/state/auth_screen_state.dart';
import 'package:pofy/features/auth/views/widgets/switch_auth_screens.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                    "Sign Up",
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
                    decoration:
                        const InputDecoration(hintText: "Email Address"),
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
                    height: 20,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "Confirm Password"),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GradientButton(
                    onTap: () {},
                    text: "Register",
                  ),
                  const SwitchAuthScreens(
                    label: "Already have an account?",
                    buttonLabel: "Sign In",
                    desiredScreen: AuthScreens.signin,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
