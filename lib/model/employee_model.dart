import 'dart:convert';

import 'package:equatable/equatable.dart';

class EmployeeModel extends Equatable {
  final String id;
  final String name;
  final String position;
  final String email;
  final String phone;
  const EmployeeModel({
    required this.id,
    required this.name,
    required this.position,
    required this.email,
    required this.phone,
  }) ;

  EmployeeModel copyWith({
    String? id,
    String? name,
    String? position,
    String? email,
    String? phone,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      position: position ?? this.position,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'position': position,
      'email': email,
      'phone': phone,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      position: map['position'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EmployeeModel(id: $id, name: $name, position: $position, email: $email, phone: $phone)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      position,
      email,
      phone,
    ];
  }
}
