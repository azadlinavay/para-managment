import 'dart:collection';
import 'dart:core';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:para/src/models/category_model.dart';
import 'package:para/src/models/para_model.dart';
import 'package:para/src/models/user_model.dart';
import 'package:para/src/models/wallet_model.dart';

User user = User(
    firstName: "Karwan",
    lastName: "Blind",
    phonenumber: "+9647501234567",
    uid: "00NOR6GbCCMdHHuCOmzR",
    createdAt: Timestamp.fromDate(DateTime(2022, 1, 26, 19)),
    updatedAt: Timestamp.fromDate(DateTime(2022, 1, 26, 19)));

List<Wallet> wallets = [
  Wallet(uid: "1", name: "Main wallet", description: ""),
];
List<ParaCategory> category = [];
List<Para> para = [];
/*
// 10 items
List<ParaCategory> category = [
  ParaCategory(uid: "1", emoji: "🚗", name: "Car", color: "#d6a622"),
  ParaCategory(uid: "2", emoji: "🛒", name: "Shoping", color: "##2596be"),
  ParaCategory(
      uid: "3", emoji: "👨", name: "Personal Spending", color: "##e07b39"),
  ParaCategory(uid: "4", emoji: "🖲️", name: "Gaming", color: "#02ff94"),
  ParaCategory(uid: "5", emoji: "🏠", name: "House Expenses", color: "#ff0221"),
  ParaCategory(
      uid: "6", emoji: "😋", name: "Food And Sweets", color: "#76448A"),
  ParaCategory(
      uid: "7", emoji: "🚇", name: "Transportation ", color: "#2ECC71"),
  ParaCategory(
      uid: "8", emoji: "🏥", name: "Medical & Healthcare", color: "#F4F6F7"),
  ParaCategory(uid: "9", emoji: "🥺", name: "Debt Payments", color: "#212F3C"),
  ParaCategory(
      uid: "10",
      emoji: "🌇",
      name: "Recreation & Entertainment",
      color: "#D35400"),
];

List<Para> para = [
  Para(
      uid: "1",
      createdAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 100000,
      amountOneUSDToIQD: 1480,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "1", //1 ... 10
      description: ""),
  Para(
      uid: "2",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 12, 6, 16)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 45000,
      amountOneUSDToIQD: 1480,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "2", //1 ... 10
      description: "ته‌ره‌كسوت و پێلاف"),
  Para(
      uid: "3",
      createdAt: Timestamp.fromDate(
          DateTime(2019, 2, 3, 18)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 150000,
      amountOneUSDToIQD: 1475,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "7", //1 ... 10
      description: ""),
  Para(
      uid: "3",
      createdAt: Timestamp.fromDate(
          DateTime(2019, 2, 3, 18)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 340000,
      amountOneUSDToIQD: 1475,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "7", //1 ... 10
      description: "ده‌ین ئازاد یێت سه‌یارێ"),
  Para(
      uid: "4",
      createdAt: Timestamp.fromDate(
          DateTime(2018, 1, 2, 16)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 30000,
      amountOneUSDToIQD: 1475,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "7", //1 ... 10
      description: ""),
  Para(
      uid: "5",
      createdAt: Timestamp.fromDate(
          DateTime(2022, 1, 4, 22)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 60000,
      amountOneUSDToIQD: 1475,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "7", //1 ... 10
      description: ""),
  Para(
      uid: "6",
      createdAt: Timestamp.fromDate(
          DateTime(2022, 1, 4, 22)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 70000,
      amountOneUSDToIQD: 1475,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "7", //1 ... 10
      description: ""),
  Para(
      uid: "7",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 1, 4, 22)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 80000,
      amountOneUSDToIQD: 1475,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "6", //1 ... 10
      description: ""),
  Para(
      uid: "8",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 2, 4, 22)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 230000,
      amountOneUSDToIQD: 1475,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "6", //1 ... 10
      description: ""),
  Para(
      uid: "6",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 3, 4, 22)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 00000,
      amountOneUSDToIQD: 1475,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "6", //1 ... 10
      description: ""),
  Para(
      uid: "10",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 5, 4, 22)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 80000,
      amountOneUSDToIQD: 1475,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "6", //1 ... 10
      description: ""),
  Para(
      uid: "11",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 5, 3, 16)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 10000,
      amountOneUSDToIQD: 1480,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "6", //1 ... 10
      description: ""),
  Para(
      uid: "12",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 5, 3, 16)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 20000,
      amountOneUSDToIQD: 1480,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "6", //1 ... 10
      description: ""),
  Para(
      uid: "13",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 5, 3, 16)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 30000,
      amountOneUSDToIQD: 1480,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "10", //1 ... 10
      description: ""),
  Para(
      uid: "14",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 1, 3, 12)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 40000,
      amountOneUSDToIQD: 1480,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "10", //1 ... 10
      description: ""),
  Para(
      uid: "98",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 1, 3, 12)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 120000,
      amountOneUSDToIQD: 1480,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "10", //1 ... 10
      description: ""),
  Para(
      uid: "16",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 1, 3, 12)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 12330000,
      amountOneUSDToIQD: 1480,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "10", //1 ... 10
      description: ""),
  Para(
      uid: "17",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 3, 3, 20)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 120000,
      amountOneUSDToIQD: 1480,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "10", //1 ... 10
      description: ""),
  Para(
      uid: "18",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 3, 3, 20)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 0000,
      amountOneUSDToIQD: 1480,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "10", //1 ... 10
      description: ""),
  Para(
      uid: "19",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 3, 3, 20)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 120000,
      amountOneUSDToIQD: 1480,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "10", //1 ... 10
      description: ""),
  Para(
      uid: "20",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 3, 3, 20)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 120000,
      amountOneUSDToIQD: 1450,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "1", //1 ... 10
      description: ""),
  Para(
      uid: "21",
      createdAt: Timestamp.fromDate(
          DateTime(2018, 3, 3, 20)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 130000,
      amountOneUSDToIQD: 1450,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "1", //1 ... 10
      description: ""),
  Para(
      uid: "22",
      createdAt: Timestamp.fromDate(
          DateTime(2018, 3, 3, 20)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 10000,
      amountOneUSDToIQD: 1450,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "1", //1 ... 10
      description: ""),
  Para(
      uid: "23",
      createdAt: Timestamp.fromDate(
          DateTime(2018, 3, 3, 20)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 40000,
      amountOneUSDToIQD: 1450,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "1", //1 ... 10
      description: ""),
  Para(
      uid: "24",
      createdAt: Timestamp.fromDate(
          DateTime(2018, 3, 3, 20)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 50000,
      amountOneUSDToIQD: 1450,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "2", //1 ... 10
      description: ""),
  Para(
      uid: "25",
      createdAt: Timestamp.fromDate(
          DateTime(2022, 3, 3, 20)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 60000,
      amountOneUSDToIQD: 1450,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "2", //1 ... 10
      description: ""),
  Para(
      uid: "26",
      createdAt: Timestamp.fromDate(
          DateTime(2022, 3, 3, 20)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 90000,
      amountOneUSDToIQD: 1450,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "2", //1 ... 10
      description: ""),
  Para(
      uid: "27",
      createdAt: Timestamp.fromDate(
          DateTime(2022, 4, 3, 20)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 780000,
      amountOneUSDToIQD: 1450,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "2", //1 ... 10
      description: ""),
  Para(
      uid: "28",
      createdAt: Timestamp.fromDate(
          DateTime(2022, 4, 4, 5)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 7)), //year, month, day, hour[24],
      amountIQD: 90000,
      amountOneUSDToIQD: 1450,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "2", //1 ... 10
      description: ""),
  Para(
      uid: "29",
      createdAt: Timestamp.fromDate(
          DateTime(2022, 4, 4, 23)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 40000,
      amountOneUSDToIQD: 1460,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "2", //1 ... 10
      description: ""),
  Para(
      uid: "30",
      createdAt: Timestamp.fromDate(
          DateTime(2016, 4, 4, 17)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 670000,
      amountOneUSDToIQD: 1460,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "3", //1 ... 10
      description: ""),
  Para(
      uid: "31",
      createdAt: Timestamp.fromDate(
          DateTime(2018, 1, 2, 16)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 340000,
      amountOneUSDToIQD: 1460,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "3", //1 ... 10
      description: ""),
  Para(
      uid: "32",
      createdAt: Timestamp.fromDate(
          DateTime(2016, 4, 4, 3)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 230000,
      amountOneUSDToIQD: 1460,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "3", //1 ... 10
      description: ""),
  Para(
      uid: "33",
      createdAt: Timestamp.fromDate(
          DateTime(2088, 7, 5, 5)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 120000,
      amountOneUSDToIQD: 1460,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "3", //1 ... 10
      description: ""),
  Para(
      uid: "34",
      createdAt: Timestamp.fromDate(
          DateTime(2022, 7, 5, 5)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 70000,
      amountOneUSDToIQD: 1460,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "3", //1 ... 10
      description: ""),
  Para(
      uid: "35",
      createdAt: Timestamp.fromDate(
          DateTime(2022, 7, 5, 5)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 80000,
      amountOneUSDToIQD: 1460,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "3", //1 ... 10
      description: ""),
  Para(
      uid: "36",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 8, 4, 4)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 30000,
      amountOneUSDToIQD: 1460,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "3", //1 ... 10
      description: ""),
  Para(
      uid: "37",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 8, 4, 4)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 40000,
      amountOneUSDToIQD: 1460,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "4", //1 ... 10
      description: ""),
  Para(
      uid: "38",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 8, 4, 4)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 50000,
      amountOneUSDToIQD: 1460,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "4", //1 ... 10
      description: ""),
  Para(
      uid: "39",
      createdAt: Timestamp.fromDate(
          DateTime(2021, 8, 4, 4)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 60000,
      amountOneUSDToIQD: 1440,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "4", //1 ... 10
      description: ""),
  Para(
      uid: "40",
      createdAt: Timestamp.fromDate(
          DateTime(2019, 1, 4, 6)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 80000,
      amountOneUSDToIQD: 1440,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "4", //1 ... 10
      description: ""),
  Para(
      uid: "41",
      createdAt: Timestamp.fromDate(
          DateTime(2019, 1, 4, 6)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 20000,
      amountOneUSDToIQD: 1440,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "4", //1 ... 10
      description: ""),
  Para(
      uid: "42",
      createdAt: Timestamp.fromDate(
          DateTime(2019, 1, 4, 6)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 30000,
      amountOneUSDToIQD: 1440,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "4", //1 ... 10
      description: ""),
  Para(
      uid: "43",
      createdAt: Timestamp.fromDate(
          DateTime(2019, 1, 4, 6)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 40000,
      amountOneUSDToIQD: 1440,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "4", //1 ... 10
      description: ""),
  Para(
      uid: "44",
      createdAt: Timestamp.fromDate(
          DateTime(2019, 1, 4, 6)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 20000,
      amountOneUSDToIQD: 1440,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "4", //1 ... 10
      description: ""),
  Para(
      uid: "49",
      createdAt: Timestamp.fromDate(
          DateTime(2019, 2, 3, 18)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 10000,
      amountOneUSDToIQD: 1440,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "4", //1 ... 10
      description: ""),
  Para(
      uid: "50",
      createdAt: Timestamp.fromDate(
          DateTime(2019, 2, 3, 18)), //year, month, day, hour[24]
      updatedAt: Timestamp.fromDate(
          DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
      amountIQD: 20000,
      amountOneUSDToIQD: 1440,
      amountType: "spend", // spend, income
      walletId: "1",
      categoryID: "1", //1 ... 10
      description: ""),
];
*/
saveDataToFierbase() async {
  var firebase = FirebaseFirestore.instance;

  firebase.collection("users").doc(user.uid!).set(user.toMap());

  category.forEach((element) {
    firebase
        .collection("users")
        .doc(user.uid!)
        .collection("category")
        .doc(element.uid)
        .set(element.toMap());
  });

  para.forEach((element) {
    firebase
        .collection("users")
        .doc(user.uid!)
        .collection("para")
        .doc(element.uid)
        .set(element.toMap());
  });

  wallets.forEach((element) {
    firebase
        .collection("users")
        .doc(user.uid!)
        .collection("wallets")
        .doc(element.uid)
        .set(element.toMap());
  });
}

Map<DateTime, List<Para>> createMap() {
  Map<DateTime, List<Para>> paraArr = new HashMap();

  paraArr[DateTime(2022, 1, 1)] = [
    Para(
        uid: "1",
        createdAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 100000,
        amountOneUSDToIQD: 1480,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "1", //1 ... 10
        description: ""),
    Para(
        uid: "2",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 12, 6, 16)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 45000,
        amountOneUSDToIQD: 1480,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "2", //1 ... 10
        description: "ته‌ره‌كسوت و پێلاف"),
    Para(
        uid: "3",
        createdAt: Timestamp.fromDate(
            DateTime(2019, 2, 3, 18)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 150000,
        amountOneUSDToIQD: 1475,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "7", //1 ... 10
        description: ""),
    Para(
        uid: "3",
        createdAt: Timestamp.fromDate(
            DateTime(2019, 2, 3, 18)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 340000,
        amountOneUSDToIQD: 1475,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "7", //1 ... 10
        description: "ده‌ین ئازاد یێت سه‌یارێ"),
    Para(
        uid: "4",
        createdAt: Timestamp.fromDate(
            DateTime(2018, 1, 2, 16)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 30000,
        amountOneUSDToIQD: 1475,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "7", //1 ... 10
        description: ""),
    Para(
        uid: "5",
        createdAt: Timestamp.fromDate(
            DateTime(2022, 1, 4, 22)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 60000,
        amountOneUSDToIQD: 1475,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "7", //1 ... 10
        description: ""),
    Para(
        uid: "6",
        createdAt: Timestamp.fromDate(
            DateTime(2022, 1, 4, 22)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 70000,
        amountOneUSDToIQD: 1475,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "7", //1 ... 10
        description: ""),
    Para(
        uid: "7",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 1, 4, 22)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 80000,
        amountOneUSDToIQD: 1475,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "6", //1 ... 10
        description: ""),
  ];
  paraArr[DateTime(2022, 1, 2)] = [
    Para(
        uid: "8",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 2, 4, 22)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 230000,
        amountOneUSDToIQD: 1475,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "6", //1 ... 10
        description: ""),
    Para(
        uid: "6",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 3, 4, 22)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 00000,
        amountOneUSDToIQD: 1475,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "6", //1 ... 10
        description: ""),
    Para(
        uid: "10",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 5, 4, 22)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 80000,
        amountOneUSDToIQD: 1475,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "6", //1 ... 10
        description: ""),
    Para(
        uid: "11",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 5, 3, 16)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 10000,
        amountOneUSDToIQD: 1480,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "6", //1 ... 10
        description: ""),
    Para(
        uid: "12",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 5, 3, 16)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 20000,
        amountOneUSDToIQD: 1480,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "6", //1 ... 10
        description: ""),
    Para(
        uid: "13",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 5, 3, 16)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 30000,
        amountOneUSDToIQD: 1480,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "10", //1 ... 10
        description: ""),
    Para(
        uid: "14",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 1, 3, 12)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 40000,
        amountOneUSDToIQD: 1480,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "10", //1 ... 10
        description: ""),
    Para(
        uid: "98",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 1, 3, 12)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 120000,
        amountOneUSDToIQD: 1480,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "10", //1 ... 10
        description: ""),
    Para(
        uid: "16",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 1, 3, 12)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 12330000,
        amountOneUSDToIQD: 1480,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "10", //1 ... 10
        description: ""),
    Para(
        uid: "17",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 3, 3, 20)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 120000,
        amountOneUSDToIQD: 1480,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "10", //1 ... 10
        description: ""),
    Para(
        uid: "18",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 3, 3, 20)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 0000,
        amountOneUSDToIQD: 1480,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "10", //1 ... 10
        description: ""),
    Para(
        uid: "19",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 3, 3, 20)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 120000,
        amountOneUSDToIQD: 1480,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "10", //1 ... 10
        description: ""),
    Para(
        uid: "20",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 3, 3, 20)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 120000,
        amountOneUSDToIQD: 1450,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "1", //1 ... 10
        description: ""),
    Para(
        uid: "21",
        createdAt: Timestamp.fromDate(
            DateTime(2018, 3, 3, 20)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 130000,
        amountOneUSDToIQD: 1450,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "1", //1 ... 10
        description: ""),
    Para(
        uid: "22",
        createdAt: Timestamp.fromDate(
            DateTime(2018, 3, 3, 20)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 10000,
        amountOneUSDToIQD: 1450,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "1", //1 ... 10
        description: ""),
    Para(
        uid: "23",
        createdAt: Timestamp.fromDate(
            DateTime(2018, 3, 3, 20)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 40000,
        amountOneUSDToIQD: 1450,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "1", //1 ... 10
        description: ""),
  ];
  paraArr[DateTime(2022, 1, 3)] = [
    Para(
        uid: "24",
        createdAt: Timestamp.fromDate(
            DateTime(2018, 3, 3, 20)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 50000,
        amountOneUSDToIQD: 1450,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "2", //1 ... 10
        description: ""),
    Para(
        uid: "25",
        createdAt: Timestamp.fromDate(
            DateTime(2022, 3, 3, 20)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 60000,
        amountOneUSDToIQD: 1450,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "2", //1 ... 10
        description: ""),
    Para(
        uid: "26",
        createdAt: Timestamp.fromDate(
            DateTime(2022, 3, 3, 20)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 90000,
        amountOneUSDToIQD: 1450,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "2", //1 ... 10
        description: ""),
    Para(
        uid: "27",
        createdAt: Timestamp.fromDate(
            DateTime(2022, 4, 3, 20)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 780000,
        amountOneUSDToIQD: 1450,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "2", //1 ... 10
        description: ""),
    Para(
        uid: "28",
        createdAt: Timestamp.fromDate(
            DateTime(2022, 4, 4, 5)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 7)), //year, month, day, hour[24],
        amountIQD: 90000,
        amountOneUSDToIQD: 1450,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "2", //1 ... 10
        description: ""),
    Para(
        uid: "29",
        createdAt: Timestamp.fromDate(
            DateTime(2022, 4, 4, 23)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 40000,
        amountOneUSDToIQD: 1460,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "2", //1 ... 10
        description: ""),
    Para(
        uid: "30",
        createdAt: Timestamp.fromDate(
            DateTime(2016, 4, 4, 17)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 670000,
        amountOneUSDToIQD: 1460,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "3", //1 ... 10
        description: ""),
    Para(
        uid: "31",
        createdAt: Timestamp.fromDate(
            DateTime(2018, 1, 2, 16)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 340000,
        amountOneUSDToIQD: 1460,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "3", //1 ... 10
        description: ""),
    Para(
        uid: "32",
        createdAt: Timestamp.fromDate(
            DateTime(2016, 4, 4, 3)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 230000,
        amountOneUSDToIQD: 1460,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "3", //1 ... 10
        description: ""),
    Para(
        uid: "33",
        createdAt: Timestamp.fromDate(
            DateTime(2088, 7, 5, 5)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 120000,
        amountOneUSDToIQD: 1460,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "3", //1 ... 10
        description: ""),
    Para(
        uid: "34",
        createdAt: Timestamp.fromDate(
            DateTime(2022, 7, 5, 5)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 70000,
        amountOneUSDToIQD: 1460,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "3", //1 ... 10
        description: ""),
    Para(
        uid: "35",
        createdAt: Timestamp.fromDate(
            DateTime(2022, 7, 5, 5)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 80000,
        amountOneUSDToIQD: 1460,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "3", //1 ... 10
        description: ""),
  ];
  paraArr[DateTime(2022, 1, 4)] = [
    Para(
        uid: "36",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 8, 4, 4)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 30000,
        amountOneUSDToIQD: 1460,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "3", //1 ... 10
        description: ""),
    Para(
        uid: "37",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 8, 4, 4)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 40000,
        amountOneUSDToIQD: 1460,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "4", //1 ... 10
        description: ""),
    Para(
        uid: "38",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 8, 4, 4)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 50000,
        amountOneUSDToIQD: 1460,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "4", //1 ... 10
        description: ""),
    Para(
        uid: "39",
        createdAt: Timestamp.fromDate(
            DateTime(2021, 8, 4, 4)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 60000,
        amountOneUSDToIQD: 1440,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "4", //1 ... 10
        description: ""),
    Para(
        uid: "40",
        createdAt: Timestamp.fromDate(
            DateTime(2019, 1, 4, 6)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 80000,
        amountOneUSDToIQD: 1440,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "4", //1 ... 10
        description: ""),
    Para(
        uid: "41",
        createdAt: Timestamp.fromDate(
            DateTime(2019, 1, 4, 6)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 20000,
        amountOneUSDToIQD: 1440,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "4", //1 ... 10
        description: ""),
    Para(
        uid: "42",
        createdAt: Timestamp.fromDate(
            DateTime(2019, 1, 4, 6)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 30000,
        amountOneUSDToIQD: 1440,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "4", //1 ... 10
        description: ""),
    Para(
        uid: "43",
        createdAt: Timestamp.fromDate(
            DateTime(2019, 1, 4, 6)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 40000,
        amountOneUSDToIQD: 1440,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "4", //1 ... 10
        description: ""),
    Para(
        uid: "44",
        createdAt: Timestamp.fromDate(
            DateTime(2019, 1, 4, 6)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 20000,
        amountOneUSDToIQD: 1440,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "4", //1 ... 10
        description: ""),
    Para(
        uid: "49",
        createdAt: Timestamp.fromDate(
            DateTime(2019, 2, 3, 18)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 10000,
        amountOneUSDToIQD: 1440,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "4", //1 ... 10
        description: ""),
    Para(
        uid: "50",
        createdAt: Timestamp.fromDate(
            DateTime(2019, 2, 3, 18)), //year, month, day, hour[24]
        updatedAt: Timestamp.fromDate(
            DateTime(2022, 1, 7, 13)), //year, month, day, hour[24],
        amountIQD: 20000,
        amountOneUSDToIQD: 1440,
        amountType: "spend", // spend, income
        walletId: "1",
        categoryID: "1", //1 ... 10
        description: ""),
  ];

  return paraArr;
}
