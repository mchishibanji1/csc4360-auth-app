#CSC 4360 - Firebase Authentication Flutter App

An end-to-end Flutter application demonstrating Firebase Authentication. This app allows users to register, sign in, sign out, view their profile, and update their password securely. 

#Features
-Register: Create a new user with an email and password.
-Sign In: Authenticate an existing user against Firebase Auth.
-Auth-State Routing: Uses authStateChanges() to automatically route users to the Profile screen or Sign-In screen.
-Profile Screen: Displays the currently signed-in user's email (currentUser.email).
-Update Password: Allows the user to change their password (includes handling the requires-recent-login Firebase error by re-authenticating).
-Sign Out: Clears the session and routes the user back to the Sign-In screen.

#Required Firebase Configuration
To run this app, you must have a Firebase project set up:
1. Enable Email/Password sign-in in the Firebase Console under Authentication > Sign-in method.
2. The project must be configured using the FlutterFire CLI to generate lib/firebase_options.dart.

#Setup Steps
1. Clone this repository.
2. Run flutter pub get to install dependencies (firebase_core and firebase_auth).
3. Ensure your own Firebase project is connected (run flutterfire configure if needed).

#How to Run & Test
1. Connect an Android emulator or physical device.
2. Run flutter run.
3. To test:
   - Register a new account with a valid email and a password of at least 6 characters.
   - Verify you are routed to the Profile screen.
   - Sign out and try signing in with an incorrect password to see the error translation.
   - Sign back in and test the "Change Password" feature.

#Build APK
To generate a release APK for Android:
flutter build apk --release
The output will be located at build\app\outputs\flutter-apk\app-release.apk
