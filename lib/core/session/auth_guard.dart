// riverpod/lib/core/session/auth_guard.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/core/bootstrap/dependency_injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String? authGuard(BuildContext context, GoRouterState state, WidgetRef ref) {
  final session = ref.read(sessionManagerProvider);
  if (!session.isLoggedIn) {
    return '/login';
  }
  return null;
}
