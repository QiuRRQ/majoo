import 'package:flutter/material.dart';
import 'package:majoo_test/views/BottomBarView.dart';

authListener(BuildContext context, var state) {
  if (state == true) {
    print("berhasil login");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BottomBarView()));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("login gagal"),
      duration: Duration(milliseconds: 500),
    ));
  }
}
