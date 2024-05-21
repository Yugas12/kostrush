class ProfileModel {
  final int id;
  final String? name;
  final String? email;
  final String? address;
  final DateTime? dateBirth;
  final String? phoneNumber;
  final String? gender;
  final String? occupation;

  ProfileModel({
    required this.id,
    this.name,
    this.email,
    this.address,
    this.dateBirth,
    this.phoneNumber,
    this.gender,
    this.occupation,
  });

  Map<String, Object?> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'address': address,
        'dateBirth': dateBirth?.toIso8601String(),
        'phoneNumber': phoneNumber,
        'gender': gender,
        'occupation': occupation,
      };

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      email: map['email'] as String?,
      address: map['address'] as String?,
      dateBirth: map['dateBirth'] != null
          ? DateTime.parse(map['dateBirth'] as String)
          : null,
      phoneNumber: map['phoneNumber'] as String?,
      gender: map['gender'] as String?,
      occupation: map['occupation'] as String?,
    );
  }

  @override
  String toString() {
    return 'ProfileModel{id: $id, name: $name, email: $email, address: $address, dateBirth: $dateBirth, phoneNumber: $phoneNumber, gender: $gender, occupation: $occupation}';
  }
}
