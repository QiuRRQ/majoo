import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image/network.dart';
import 'package:majoo_test/bloc/auth/auth_bloc.dart';
import 'package:majoo_test/bloc/bottomBar/botBarBloc.dart';
import 'package:majoo_test/model/user/user.dart';
import 'package:majoo_test/repositories/authRepo.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key key}) : super(key: key);

  @override
  _ProfileStateView createState() => _ProfileStateView();
}

class _ProfileStateView extends State<ProfileView> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Future.delayed(Duration.zero, () {
      this.getSHaredDare();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: 50.0),
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.all(16.0),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            //ToDO: change this to Network image when picturing is done in backend.
                            image: new NetworkImageWithRetry(USer.photoURL ==
                                    null
                                ? "https://ayaxx.id/wp-content/uploads/2019/05/33-338618_data-backup-amp-recovery-the-businessman-gambar-orang.png.jpg"
                                : USer.photoURL),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Email",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    maxLines: 5,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Colors.black,
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Text(
                    USer.email ?? "email kosong",
                    style: TextStyle(fontFamily: "Title", color: Colors.black),
                    maxLines: 5,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15.0)),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Name",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    maxLines: 5,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Colors.black,
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Text(
                    USer.displayName ?? "nama kosong",
                    style: TextStyle(fontFamily: "Title", color: Colors.black),
                    maxLines: 5,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  UserAuth USer = new UserAuth();
  getSHaredDare() async {
    var a = await getUserToken();
    setState(() {
      USer = a;
    });
  }
}
