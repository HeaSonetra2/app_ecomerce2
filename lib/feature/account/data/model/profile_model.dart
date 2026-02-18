class ProfileModel {
  final int id;
  final String phoneNumber;
  final String name;
  final String gender;
  final String dob;
  final String email;
  final String address;

  ProfileModel({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this .gender,
    required this.dob,
    required this.email,
    required this.address,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as int,
      phoneNumber: json['phoneNumber'] ?? '',
      name: json['name'] ?? '',
      gender: json['gender'] ?? '',
      dob: json['dob'] ?? '',
      email: json['email'] ?? '',
      address: json['defaultAddress'] ?? '',
    );
  }
}
