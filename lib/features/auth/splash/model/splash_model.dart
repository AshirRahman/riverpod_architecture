class SplashModel {
  final bool isInitialized;
  final String? error;

  const SplashModel({
    this.isInitialized = false,
    this.error,
  });

  SplashModel copyWith({
    bool? isInitialized,
    String? error,
  }) {
    return SplashModel(
      isInitialized: isInitialized ?? this.isInitialized,
      error: error ?? this.error,
    );
  }
}
