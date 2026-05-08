import 'package:flutter/material.dart';
import '../models/user_profile.dart';

/// [AuthProvider] manages the authentication state of the application.
/// It uses a temporary, local, in-memory state to simulate a backend.
class AuthProvider extends ChangeNotifier {
  /// The currently logged-in user. If null, no user is logged in.
  UserProfile? _currentUser;

  /// A mock database of registered users (email as key).
  /// Pre-populated with a dummy user for testing.
  final Map<String, UserProfile> _mockDatabase = {
    'test@example.com': UserProfile(
      id: '1',
      name: 'Test User',
      email: 'test@example.com',
      phoneNumber: '+1234567890',
    ),
  };

  /// The password corresponding to each email for mock validation.
  final Map<String, String> _mockPasswords = {
    'test@example.com': 'password123',
  };

  /// Exposes the current user. Returns null if not authenticated.
  UserProfile? get currentUser => _currentUser;

  /// Exposes whether a user is currently logged in.
  bool get isAuthenticated => _currentUser != null;

  /// Simulates a login request.
  /// Validates the [email] and [password] against the mock database.
  /// Throws an [Exception] if validation fails.
  Future<void> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    if (_mockDatabase.containsKey(email) && _mockPasswords[email] == password) {
      _currentUser = _mockDatabase[email];
      notifyListeners(); // Notify UI to rebuild
    } else {
      throw Exception('Invalid email or password.');
    }
  }

  /// Simulates a registration/signup request.
  /// Adds the new user to the mock database and logs them in.
  /// Throws an [Exception] if the email is already in use.
  Future<void> signup(String name, String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    if (_mockDatabase.containsKey(email)) {
      throw Exception('Email is already in use.');
    }

    final newUser = UserProfile(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // Generate a mock ID
      name: name,
      email: email,
      phoneNumber: '', // Default empty phone
    );

    _mockDatabase[email] = newUser;
    _mockPasswords[email] = password;
    
    // Automatically log the user in after signing up
    _currentUser = newUser;
    notifyListeners();
  }

  /// Updates the current user's profile information.
  /// Useful for Edit Profile screens.
  void updateProfile(UserProfile updatedProfile) {
    if (_currentUser != null) {
      // Update the current session user
      _currentUser = updatedProfile;
      // Also update the record in the mock database
      _mockDatabase[updatedProfile.email] = updatedProfile;
      notifyListeners();
    }
  }

  /// Logs out the current user by clearing the session state.
  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
