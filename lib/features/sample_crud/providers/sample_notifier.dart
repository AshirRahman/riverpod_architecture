// riverpod/lib/features/sample_crud/providers/sample_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SampleNotifier extends StateNotifier<AsyncValue<void>> {
  SampleNotifier() : super(const AsyncData(null));
}
