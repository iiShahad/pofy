import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pofy/features/auth/models/user.dart';
import 'package:pofy/features/auth/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(
      authRespository: ref.watch(authRepositoryProvider), ref: ref);
});

final authStateChangeProvider = StreamProvider<supabase.AuthState>((ref) {
  final authRespository = ref.watch(authRepositoryProvider);
  return authRespository.authStateChange;
});

final userProvider = StateProvider<UserModel?>((ref) => null);

class AuthController {
  final AuthRespository _authRespository;
  final Ref _ref;
  AuthController({required AuthRespository authRespository, required Ref ref})
      : _authRespository = authRespository,
        _ref = ref;

  Stream<supabase.AuthState> get authStateChange =>
      _authRespository.authStateChange;

  void signUp(String email, String password, String username) async {
    final authData = await _authRespository.signup(email, password, username);
    authData.fold(
      (l) => null,
      (r) => _ref.read(userProvider.notifier).update((state) => r),
    );
  }

  void signIn(String email, String password) async {
    final authData = await _authRespository.signin(email, password);
    authData.fold(
      (l) => null,
      (r) => _ref.read(userProvider.notifier).update((state) => r),
    );
  }

  void logout() {
    _authRespository.logout();
  }
}
