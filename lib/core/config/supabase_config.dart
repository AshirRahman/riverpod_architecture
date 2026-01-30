// riverpod/lib/core/config/supabase_config.dart
import 'package:riverpod/core/config/env.dart';

class SupabaseConfig {
  static String url = Env.supabaseUrl;
  static String anonKey = Env.supabaseAnonKey;
}
