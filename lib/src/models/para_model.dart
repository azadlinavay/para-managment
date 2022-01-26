import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:para/src/models/category_model.dart';
import 'package:para/src/temp/damy_data.dart';

class Para {
  ParaCategory get categpry {
    debugPrint(this.uid);

    return category.firstWhere((element) => element.uid == this.categoryID);
  }

  double get usd {
    return (amountIQD ?? 1) / (amountOneUSDToIQD ?? 1);
  }

  String? uid;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  //para
  double? amountIQD; // 10,000
  double? amountUSD; //6.75675
  double? amountOneUSDToIQD; //1480
  String? amountType; // spend || income

  //category
  String? walletId;
  String? categoryID;
  String? description;
  Para({
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.amountIQD,
    this.amountUSD,
    this.amountOneUSDToIQD,
    this.amountType,
    this.walletId,
    this.categoryID,
    this.description,
  });

  Para copyWith({
    String? uid,
    Timestamp? createdAt,
    Timestamp? updatedAt,
    double? amountIQD,
    double? amountUSD,
    double? amountOneUSDToIQD,
    String? amountType,
    String? walletId,
    String? categoryID,
    String? description,
  }) {
    return Para(
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      amountIQD: amountIQD ?? this.amountIQD,
      amountUSD: amountUSD ?? this.amountUSD,
      amountOneUSDToIQD: amountOneUSDToIQD ?? this.amountOneUSDToIQD,
      amountType: amountType ?? this.amountType,
      walletId: walletId ?? this.walletId,
      categoryID: categoryID ?? this.categoryID,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'amountIQD': amountIQD,
      'amountUSD': amountUSD,
      'amountOneUSDToIQD': amountOneUSDToIQD,
      'amountType': amountType,
      'walletId': walletId,
      'categoryID': categoryID,
      'description': description,
    };
  }

  factory Para.fromMap(Map<String, dynamic> map) {
    return Para(
      uid: map['uid'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      amountIQD: map['amountIQD'],
      amountUSD: map['amountUSD'],
      amountOneUSDToIQD: map['amountOneUSDToIQD'],
      amountType: map['amountType'],
      walletId: map['walletId'],
      categoryID: map['categoryID'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Para.fromJson(String source) => Para.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Para(uid: $uid, createdAt: $createdAt, updatedAt: $updatedAt, amountIQD: $amountIQD, amountUSD: $amountUSD, amountOneUSDToIQD: $amountOneUSDToIQD, amountType: $amountType, walletId: $walletId, categoryID: $categoryID, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Para &&
        other.uid == uid &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.amountIQD == amountIQD &&
        other.amountUSD == amountUSD &&
        other.amountOneUSDToIQD == amountOneUSDToIQD &&
        other.amountType == amountType &&
        other.walletId == walletId &&
        other.categoryID == categoryID &&
        other.description == description;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        amountIQD.hashCode ^
        amountUSD.hashCode ^
        amountOneUSDToIQD.hashCode ^
        amountType.hashCode ^
        walletId.hashCode ^
        categoryID.hashCode ^
        description.hashCode;
  }
}
