// riverpod/lib/core/routes/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod/core/bootstrap/dependency_injection.dart'; // Import for sessionManagerProvider

// Import your actual screens
// import 'package:riverpod/features/auth/screens/login_screen.dart';
// import 'package:riverpod/features/auth/screens/signup_screen.dart';
import 'package:riverpod_app/core/routes/app_routes.dart';
import 'package:riverpod_app/features/auth/splash/screen/splash_screen.dart';
// // Note: You may need to create a dummy HomeScreen if you haven't yet, or use SampleListScreen
// import 'package:riverpod/features/sample_crud/screens/sample_list_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  // 1. Watch the SessionManager so we can react to changes
  // final session = ref.watch(sessionManagerProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    // 2. IMPORTANT: This makes the router "listen" to auth changes
    // refreshListenable: session,

    // 3. Redirect Logic (Guard)
    // redirect: (context, state) {
    //   final isLoggedIn = session.isLoggedIn;
    //   final isLoggingIn = state.matchedLocation == AppRoutes.login ||
    //       state.matchedLocation == AppRoutes.signup;
    //   final isSplash = state.matchedLocation == AppRoutes.splash;

    //   // Allow splash to finish its job (Splash screen usually handles its own navigation,
    //   // but strictly speaking, if we are on splash, we might want to wait.
    //   // For this logic, we rely on the Splash screen to push to /login or /home,
    //   // OR we can let this redirect handler do it immediately.)

    //   // Strict Guard:
    //   if (!isLoggedIn && !isLoggingIn && !isSplash) {
    //     return AppRoutes.login;
    //   }

    //   if (isLoggedIn && isLoggingIn) {
    //     return AppRoutes.home;
    //   }

    //   return null;
    // },

    routes: [
      // Splash Route
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // // Login Route
      // GoRoute(
      //   path: AppRoutes.login,
      //   builder: (context, state) => const LoginScreen(),
      // ),

      // // Signup Route
      // GoRoute(
      //   path: AppRoutes.signup,
      //   builder: (context, state) => const SignupScreen(),
      // ),

      // // Home Route (Protected)
      // GoRoute(
      //   path: AppRoutes.home,
      //   builder: (context, state) => const SampleListScreen(), // Pointing to SampleList for now
      // ),
    ],
  );
});
