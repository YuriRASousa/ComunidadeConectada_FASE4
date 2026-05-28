class User {
  final String id;
  final String name;
  final String email;
  final String address;
  final String? profileImageUrl;
  final double reputation;
  final int totalTransactions;
  final bool isVerified;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    this.profileImageUrl,
    this.reputation = 0.0,
    this.totalTransactions = 0,
    this.isVerified = false,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      address: map['address'],
      profileImageUrl: map['profileImageUrl'],
      reputation: (map['reputation'] ?? 0.0).toDouble(),
      totalTransactions: map['totalTransactions'] ?? 0,
      isVerified: map['isVerified'] ?? false,
    );
  }
}
