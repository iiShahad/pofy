import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pofy/router.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool isNext = false;

  void setIsNext(bool isNext) {
    setState(() {
      this.isNext = isNext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // logo
                Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                ),

                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Forgot ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Password',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                isNext
                    ? const ForgetPasswordContent2()
                    : ForgetPasswordContentPart1(
                        onTap: setIsNext,
                      ),

                // TextField
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordContentPart1 extends ConsumerWidget {
  ForgetPasswordContentPart1({super.key, this.onTap});
  void Function(bool)? onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            onTap!(true);
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ForgetPasswordContent2 extends ConsumerWidget {
  const ForgetPasswordContent2({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Center(
        child: Column(
          children: [
            Text(
              "An email has been sent to you containing a link to create a new password",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend email",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),
                  )),
            ),
            const SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: (){
                ref.read(goRouterProvider).go('/sign-in');
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
