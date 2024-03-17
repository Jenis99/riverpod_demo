import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final int age;

//<editor-fold desc="Data Methods">

  const User({
    required this.name,
    required this.age,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is User && runtimeType == other.runtimeType && name == other.name && age == other.age);

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() {
    return 'User{' + ' name: $name,' + ' age: $age,' + '}';
  }

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'age': this.age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

//</editor-fold>
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void updateName(String n) {
    state = state.copyWith(name: n);
  }
  void updateAge(int a) {
    state = state.copyWith(age: a);
  }
}


class UserNotifierChange extends ChangeNotifier {
 User user=const User(name: "", age: 0);

  void updateName(String n) {
    user = user.copyWith(name: n);
    notifyListeners();
  }
  void updateAge(int a) {
    user = user.copyWith(age: a);
    notifyListeners();

  }
}