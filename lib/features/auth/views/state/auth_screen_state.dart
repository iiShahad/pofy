import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthScreens {
  signin,
  signup,
}

final currentAuthScreenProvider = StateProvider<AuthScreens>((ref) {
  return AuthScreens.signup;
});
