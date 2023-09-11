import 'package:flutter/material.dart';
import 'package:pofy/core/palette.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Background ------------------------------------
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash_bg.png"),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                //Logo ------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      scale: 10,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "POFY",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //center labels ------------------------------------
                Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w100,
                        color: Palette.white,
                      ),
                ),
                const Spacer(),
                //next button ------------------------------------
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Palette.white),
                    ),
                    child: const Icon(
                      Icons.navigate_next_outlined,
                      color: Palette.white,
                      size: 50,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
