import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majoo_test/bloc/auth/auth_bloc.dart';
import 'package:majoo_test/bloc/berandaBloc/berandaBloc.dart';
import 'package:majoo_test/bloc/bottomBar/botBarBloc.dart';
import 'package:majoo_test/model/initalData/people.dart';
import 'package:majoo_test/repositories/authRepo.dart';
import 'package:majoo_test/repositories/initDataRepo.dart';

class BerandaView extends StatefulWidget {
  @override
  _BerandaStateView createState() => _BerandaStateView();
}

class _BerandaStateView extends State<BerandaView> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BerandaBloc(),
      child: BlocListener<BerandaBloc, List<Poeple>>(
        listener: (context, state) {
          if (state.length == 0) {
            //init data here
            print("masuk sini");
            context.read<BerandaBloc>().add(0);
          } else {}
        },
        child: BlocBuilder<BerandaBloc, List<Poeple>>(
          builder: (context, state) {
            return Scaffold(
              body: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (c, i) {
                  return Text("data");
                },
                itemCount: state.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
