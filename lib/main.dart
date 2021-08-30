import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majoo_test/bloc/auth/auth_bloc.dart';
import 'package:majoo_test/bloc/bottomBar/botBarBloc.dart';
import 'package:majoo_test/views/BottomBarView.dart';
import 'package:majoo_test/views/mainView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
          // BlocProvider<BotBarBloc>(create: (context) => BotBarBloc())
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, bool>(listener: (context, state) {
              if (state == true) {
                print("berhasil login");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomBarView()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("login gagal"),
                  duration: Duration(milliseconds: 500),
                ));
              }
            })
          ],
          child: MainView(),
        ),
      ),
    );
  }
}
