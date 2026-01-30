import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/core/services/supabase_service.dart';

/// LOGIN NOTIFIER PROVIDER
final loginProvider = StateNotifierProvider<LoginNotifier, AsyncValue<void>>(
  (ref) => LoginNotifier(),
);

/// LOGIN NOTIFIER
class LoginNotifier extends StateNotifier<AsyncValue<void>> {
  LoginNotifier() : super(const AsyncData(null));

  /// 🔐 LOGIN
  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      await SupabaseService.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
