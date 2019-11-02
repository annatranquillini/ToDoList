import 'Address.dart';
import 'Company.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  int id = 1;
  String name;
  String username;
  String email;
  String phone;
  String website;
  Address address;
  Company company;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.website,
      this.address,
      this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      website: json['website'] as String,
      company: Company.fromJson(json['company']),
      address: Address.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id.toString(),
      'name': name ?? '',
      'username': username,
      'email': email,
      'phone': phone,
      'website': website,
      'company': company.toJson(),
      'address': address.toJson()
    };
  }

  patch() async {
    String URL = 'https://jsonplaceholder.typicode.com/users/1';
    print(this.toJson());
    final response = await http.patch(URL, body: this.toJson());
    print(response.statusCode);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      this.id = parsed['id'] as int;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to patch user');
    }

    return;
  }
}
