class UserProfile {
  /// The unique identifier for the user
  final String id;
  
  /// The user's full name
  final String name;
  
  /// The user's email address used for login
  final String email;
  
  /// The user's phone number
  final String phoneNumber;
  
  /// An optional URL for the user's profile picture
  final String? profilePictureUrl;

  /// Constructor to initialize a [UserProfile] instance
  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.profilePictureUrl,
  });

  /// A utility method to create a copy of the current [UserProfile] 
  /// with updated values for the specified fields.
  /// This is useful for state immutability in Flutter.
  UserProfile copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? profilePictureUrl,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }
}
