// riverpod/lib/features/realtime_example/providers/realtime_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RealtimeNotifier extends StateNotifier<AsyncValue<void>> {
  RealtimeNotifier() : super(const AsyncData(null));
}
