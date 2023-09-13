import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pofy/core/common/gradient_button.dart';
import 'package:pofy/core/palette.dart';
import 'package:pofy/features/auth/controllers/auth_controller.dart';
import 'package:pofy/features/auth/views/state/auth_screen_state.dart';
import 'package:pofy/features/auth/views/widgets/switch_auth_screens.dart';

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});

  @override
  ConsumerState<SigninScreen> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SigninScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void _submit() {
    ref
        .read(authControllerProvider)
        .signIn(_emailController.text, _passwordController.text);
  }

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
            child: Form(
              key: _formKey,
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
                    controller: _emailController,
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GradientButton(
                    onTap: () => _submit(),
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
      ),
    );
  }
}
