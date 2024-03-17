
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ApiModel
{
  final String name;
  final int email;

//<editor-fold desc="Data Methods">

  const ApiModel({
    required this.name,
    required this.email,
  });

//<ed@override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ApiModel &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              email == other.email
          );


  @override
  int get hashCode =>
      name.hashCode ^
      email.hashCode;


  @override
  String toString() {
    return 'ApiModel{' +
        ' name: $name,' +
        ' email: $email,' +
        '}';
  }


  ApiModel copyWith({
    String? name,
    int? email,
  }) {
    return ApiModel(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
    };
  }

  factory ApiModel.fromMap(Map<String, dynamic> map) {
    return ApiModel(
      name: map['name'] as String,
      email: map['email'] as int,
    );
  }
}

final userRepositoryProvider=Provider((ref) => UserRepository());

class UserRepository
{
  Future<ApiModel> fetchUserData()
  {
    const url = "https://jsonplaceholder.typicode.com/users/1";
    return http.get(
      Uri.parse(url),
    ).then((value) => ApiModel.fromMap(value.body as Map<String, dynamic>));
  }
}