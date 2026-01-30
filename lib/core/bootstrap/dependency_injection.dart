// riverpod/lib/core/bootstrap/dependency_injection.dart
import 'package:riverpod/core/services/supabase_service.dart';
import 'package:riverpod/core/services/firebase_service.dart';
import 'package:riverpod/core/services/branch_service.dart';
import 'package:riverpod/core/services/local_auth_service.dart';
import 'package:riverpod/core/services/storage_service.dart';
import 'package:riverpod/core/session/session_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final supabaseServiceProvider =
    Provider<SupabaseService>((ref) => SupabaseService.instance);
final firebaseServiceProvider =
    Provider<FirebaseService>((ref) => FirebaseService.instance);
final branchServiceProvider =
    Provider<BranchService>((ref) => BranchService.instance);
final localAuthServiceProvider =
    Provider<LocalAuthService>((ref) => LocalAuthService());
final storageServiceProvider =
    Provider<StorageService>((ref) => StorageService());
final sessionManagerProvider =
    Provider<SessionManager>((ref) => SessionManager(ref));
