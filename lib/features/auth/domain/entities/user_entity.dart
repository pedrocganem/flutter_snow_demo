class UserEntity {
  String? email;
  String? name;

  UserEntity({
    this.email,
    this.name,
  });

  factory UserEntity.fromMap(Map<String, dynamic> map) => UserEntity(
        email: map["email"],
        name: map["name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
      };
}
