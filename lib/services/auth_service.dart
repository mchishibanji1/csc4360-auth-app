import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 1. A stream that tells the UI whenever a user signs in or out
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // 2. A getter to access the current user (used for displaying the email)
  User? get currentUser => _auth.currentUser;

  // 3. Register a new user
  Future<UserCredential> register(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // 4. Sign in an existing user
  Future<UserCredential> signIn(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // 5. Sign out
  Future<void> signOut() {
    return _auth.signOut();
  }

  // 6. Change Password (Handles the "requires-recent-login" gotcha)
  Future<void> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    final user = _auth.currentUser;

    if (user == null || user.email == null) {
      throw Exception("No user is currently signed in.");
    }

    // Re-authenticate first to prevent the "requires-recent-login" error
    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );

    await user.reauthenticateWithCredential(credential);

    // Now update the password
    await user.updatePassword(newPassword);
  }
}
