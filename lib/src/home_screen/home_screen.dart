import 'dart:ffi';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:para/src/add_screen/add_screen.dart';
import 'package:para/src/models/category_model.dart';
import 'package:para/src/models/para_model.dart';
import 'package:para/src/temp/damy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ffr_hex_color/ffr_hex_color.dart';

class HomeScreenView extends StatefulWidget {
  HomeScreenView({Key? key}) : super(key: key);

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  void initState() {
    super.initState();
    //save that the aplash is viewd, to not shoed again.
    SharedPreferences.getInstance()
        .then((value) => value.setBool("slpash_", true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Addscreen()),
              )),
      // appBar: AppBar(
      //   title: const Text("Para Managment"),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => setState(() {}), child: Text("refresh")),
            topBarBalance(),
            Expanded(
              child: ListView.builder(
                itemCount: para.length,
                itemBuilder: (context, index) {
                  Para cPara = para[index];
                  return mainTableCell(para[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Container mainTableCell(Para pare) {
    return Container(
      child: Row(
        children: [
          Container(
              padding:
                  EdgeInsets.only(top: 10, left: 20, right: 10, bottom: 10),
              child: categoryIcon(pare.categpry)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pare.categpry.name ?? "",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(
                height: 6,
              ),
              Text(pare.description ?? ""),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${pare.amountType == "income" ? "+" : "-"} \$${NumberFormat("###.0#", "en_US").format(pare.usd)}",
                  style: TextStyle(
                      color: pare.amountType == "income"
                          ? Colors.greenAccent
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  DateFormat('yy-MM-dd').format(pare.createdAt!.toDate()),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
                Text(
                  DateFormat('hh:kk').format(pare.createdAt!.toDate()),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container topBarBalance() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, top: 8, bottom: 4, right: 20),
        decoration: BoxDecoration(
          color: Color(0xff042682),
          borderRadius: BorderRadius.all(Radius.circular(23)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "500.97\$",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "Available Balance",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Container categoryIcon(ParaCategory category) {
    return Container(
      decoration: BoxDecoration(
        color: FFRHexColor(category.color ?? "#eb34db"),
        // color: Colors.blue[900],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          IconData(int.parse(category.emoji.toString()),
              fontFamily: 'MaterialIcons'),
          color: Colors.white,size: 40,
        ),
      ),
    );
  }
}
