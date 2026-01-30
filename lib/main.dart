// riverpod/lib/main.dart
import 'package:riverpod/app.dart';
import 'package:riverpod/core/bootstrap/app_bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/core/config/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavorString = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  final flavor = AppFlavor.values.firstWhere((e) => e.name == flavorString);
  await Env.load(flavor);
  // await AppBootstrap.initialize();

  runApp(const ProviderScope(child: App()));
}
