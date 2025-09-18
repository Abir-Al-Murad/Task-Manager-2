class UserProfile {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String image;
  final bool isVerified;

  UserProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.image,
    required this.isVerified,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      image: json['image'] ?? '',
      isVerified: json['isVerified'] ?? false,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'address': address,
      'image': image,
      'isVerified': isVerified,
    };
  }
}
