import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/auth_service.dart';
import 'authentication_screen.dart';
import 'profile_screen.dart';

class AuthGate extends StatelessWidget {
  AuthGate({super.key});

  // Instantiate the service here so it's passed down
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authService.authStateChanges,
      builder: (context, snapshot) {
        // 1. Waiting state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 2. Error state
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Unable to check sign-in status. Try again.'),
            ),
          );
        }

        // 3. User is signed IN
        if (snapshot.hasData) {
          return ProfileScreen(authService: _authService);
        }

        // 4. User is signed OUT
        return AuthenticationScreen(authService: _authService);
      },
    );
  }
}
