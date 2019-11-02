class User {
  int id = 1;
  String name;
  String username;
  String email;
  String phone;
  String website;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.website});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      phone: json['phone'] as String,
      website: json['website'] as String,
    );
  }
}
