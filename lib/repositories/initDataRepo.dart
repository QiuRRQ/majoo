import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:majoo_test/model/DB/dbHelper.dart';
import 'package:majoo_test/model/initalData/init_data.dart';
import 'package:majoo_test/model/initalData/people.dart';
import 'package:majoo_test/utils/contsVariables.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

Future<List<Poeple>> reqInitData() async {
  List<Poeple> Poeples = [];

  String url = BASE_URL + INITPOEPPLE;

  print(url);
  var response = await http
      .get(Uri.parse(url))
      .catchError((err) => print("error ${err.toString()}"));
  if (response.statusCode == 200) {
    try {
      Map<String, dynamic> map = jsonDecode(response.body);
      print("data ${InitData.fromJson(map).results}");
      return InitData.fromJson(map).results;
    } on TypeError {
      Iterable res = jsonDecode(response.body);
      print("data ${InitData.fromJson(res).results}");
      return InitData.fromJson(res).results;
    }
  }
  return Poeples;
}

Future<List<Poeple>> InitDataDB() async {
  var data = await reqInitData();
  DbHelper dbHelper = DbHelper();
  // Database db = await dbHelper.database;

  data.forEach((element) async {
    print(element);
    int result = await dbHelper.insert(
      object: element,
    );

    print(element);
    if (result > 0) {
      print("insert sukses");
    } else {
      print("gagal insert ke DB untuk awal data");
    }
  });

  return data;
}
