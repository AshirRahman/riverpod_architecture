import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/core/services/supabase_service.dart';

/// FORGOT PASSWORD NOTIFIER PROVIDER
final forgotPasswordProvider =
    StateNotifierProvider<ForgotPasswordNotifier, AsyncValue<void>>(
  (ref) => ForgotPasswordNotifier(),
);

/// FORGOT PASSWORD NOTIFIER
class ForgotPasswordNotifier extends StateNotifier<AsyncValue<void>> {
  ForgotPasswordNotifier() : super(const AsyncData(null));

  /// 🔑 RESET PASSWORD
  Future<void> resetPassword(String email) async {
    state = const AsyncLoading();
    try {
      await SupabaseService.instance.client.auth.resetPasswordForEmail(email);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
