import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? uid;
  String? firstName;
  String? lastName;
  String? phonenumber;

  Timestamp? createdAt;
  Timestamp? updatedAt;
  User({
   this.uid,
    this.firstName,
    this.lastName,
    this.phonenumber,
    this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    String? uid,
    String? firstName,
    String? lastName,
    String? phonenumber,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return User(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phonenumber: phonenumber ?? this.phonenumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'phonenumber': phonenumber,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      phonenumber: map['phonenumber'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uid: $uid, firstName: $firstName, lastName: $lastName, phonenumber: $phonenumber, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.uid == uid &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phonenumber == phonenumber &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phonenumber.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
