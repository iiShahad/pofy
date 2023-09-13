import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pofy/core/common/gradient_button.dart';
import 'package:pofy/core/palette.dart';
import 'package:pofy/features/auth/controllers/auth_controller.dart';
import 'package:pofy/features/auth/views/state/auth_screen_state.dart';
import 'package:pofy/features/auth/views/widgets/switch_auth_screens.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  void _submit() {
    ref.read(authControllerProvider).signUp(
          _emailController.text,
          _passwordController.text,
          _usernameController.text,
        );
  }

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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: Palette.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(hintText: "Username"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration:
                          const InputDecoration(hintText: "Email Address"),
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
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordConfirmationController,
                      decoration:
                          const InputDecoration(hintText: "Confirm Password"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GradientButton(
                      onTap: () => _submit(),
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
      ),
    );
  }
}
