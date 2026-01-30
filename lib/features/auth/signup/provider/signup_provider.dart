import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/core/services/supabase_service.dart';

/// SIGNUP NOTIFIER PROVIDER
final signupProvider = StateNotifierProvider<SignupNotifier, AsyncValue<void>>(
  (ref) => SignupNotifier(),
);

/// SIGNUP NOTIFIER
class SignupNotifier extends StateNotifier<AsyncValue<void>> {
  SignupNotifier() : super(const AsyncData(null));

  /// 📝 SIGNUP
  Future<void> signup(String email, String password) async {
    state = const AsyncLoading();
    try {
      await SupabaseService.instance.client.auth.signUp(
        email: email,
        password: password,
      );
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
