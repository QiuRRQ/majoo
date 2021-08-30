import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majoo_test/bloc/bottomBar/botBarBloc.dart';
import 'package:majoo_test/model/initalData/init_data.dart';
import 'package:majoo_test/model/initalData/people.dart';
import 'package:majoo_test/repositories/initDataRepo.dart';
import 'package:majoo_test/views/Beranda/berandaView.dart';
import 'package:majoo_test/views/Favorite/favoriteView.dart';
import 'package:majoo_test/views/Profile/profileView.dart';
import 'package:majoo_test/views/berandatemp2/beranda.dart';

class BottomBarView extends StatefulWidget {
  BottomBarView({Key key}) : super(key: key);

  @override
  _BottomBarStateView createState() => _BottomBarStateView();
}

class _BottomBarStateView extends State<BottomBarView> {
  var data;

  @override
  void initState() {
    // TODO: implement initState

    data = InitDataDB();
    super.initState();
  }

  final List<Widget> widgetOptions = <Widget>[
    // BerandaView(),
    Home(),
    FavView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BotBarBloc(),
      child: BlocBuilder<BotBarBloc, int>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: widgetOptions.elementAt(state),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_sharp),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Profile',
                ),
              ],
              currentIndex: state,
              selectedItemColor: Colors.amber[800],
              onTap: (int index) {
                context.read<BotBarBloc>().add(index);
              },
            ),
          );
        },
      ),
    );
  }
}
