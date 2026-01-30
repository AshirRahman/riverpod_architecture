import 'package:flutter_riverpod/flutter_riverpod.dart';

/// SPLASH NOTIFIER PROVIDER
final splashProvider = StateNotifierProvider<SplashNotifier, AsyncValue<bool>>(
  (ref) => SplashNotifier(),
);

/// SPLASH NOTIFIER
class SplashNotifier extends StateNotifier<AsyncValue<bool>> {
  SplashNotifier() : super(const AsyncData(false));

  /// 🚀 Initialize App
  Future<void> initialize() async {
    state = const AsyncLoading();
    try {
      // Add initialization logic here
      // Check authentication status, load config, etc.
      await Future.delayed(const Duration(seconds: 2));
      state = const AsyncData(true);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
