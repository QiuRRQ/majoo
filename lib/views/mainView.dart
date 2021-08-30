import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majoo_test/bloc/auth/auth_bloc.dart';
import 'package:majoo_test/model/DB/dbHelper.dart';
import 'package:majoo_test/repositories/authRepo.dart';
import 'package:majoo_test/repositories/initDataRepo.dart';

class MainView extends StatefulWidget {
  MainView({Key key}) : super(key: key);

  @override
  _MainStateView createState() => _MainStateView();
}

class _MainStateView extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: 150,
          height: 25,
          color: Colors.blue,
          child: InkWell(
            onTap: () async {
              authBloc.add(true);
            },
            child: Text("Sign In With Google"),
          ),
        ),
      ),
    );
  }
}
