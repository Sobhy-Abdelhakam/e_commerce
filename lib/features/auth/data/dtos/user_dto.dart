class UserDto {
  final String id;
  final String email;
  final String name;
  final String phone;

  UserDto({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
    };
  }
}