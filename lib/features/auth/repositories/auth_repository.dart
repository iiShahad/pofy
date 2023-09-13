import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pofy/core/constants/supabase_constatnts.dart';
import 'package:pofy/core/types/failure.dart';
import 'package:pofy/core/types/type_defs.dart';
import 'package:pofy/features/auth/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final authRepositoryProvider = Provider<AuthRespository>((ref) {
  return AuthRespository();
});

class AuthRespository {
  final _client = supabase.Supabase.instance.client;

  Stream<supabase.AuthState> get authStateChange =>
      _client.auth.onAuthStateChange;

  FutureEither<UserModel> signup(
      String email, String password, String username) async {
    try {
      final supabase.AuthResponse res =
          await _client.auth.signUp(password: password, email: email, data: {
        'username': username,
      });
      final supabase.User? user = res.user;
      if (user != null) {
        final currentUser = await getUserData(res.user!.id).first;
        return right(currentUser);
      } else {
        throw Exception("user is null");
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<UserModel> signin(String email, String password) async {
    try {
      final supabase.AuthResponse res = await _client.auth
          .signInWithPassword(password: password, email: email);
      final supabase.User? user = res.user;
      if (user != null) {
        final currentUser = await getUserData(res.user!.id).first;
        return right(currentUser);
      } else {
        throw Exception("user is null");
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<void> logout() {
    return _client.auth.signOut();
  }

  Stream<UserModel> getUserData(String userId) {
    return _client
        .from(SupabaseConstants.users)
        .stream(primaryKey: [userId]).map((data) {
      return UserModel.fromMap(data[0]);
    });
  }
}
