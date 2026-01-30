// // riverpod/lib/features/auth/screens/login_screen.dart
// import 'package:flutter/material.dart';
// import 'package:riverpod/features/auth/widgets/auth_text_field.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod/features/auth/providers/auth_notifier.dart';

// class LoginScreen extends ConsumerWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const AuthTextField(hint: 'Email'),
//           const AuthTextField(hint: 'Password'),
//           ElevatedButton(
//             onPressed: () => ref.read(authNotifierProvider.notifier).login('test@test.com', 'password'),
//             child: const Text('Login'),
//           ),
//         ],
//       ),
//     );
//   }
// }
