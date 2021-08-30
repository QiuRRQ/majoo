import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:majoo_test/model/user/user.dart';
import 'package:majoo_test/utils/contsVariables.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> signInWithGoogle() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      UserAuth user = new UserAuth();
      user.id = userCredential.user.uid;
      user.photoURL = userCredential.user.photoURL;
      user.email = userCredential.user.email;
      user.displayName = userCredential.user.displayName;
      var ref = await SharedPreferences.getInstance();
      ref.setString(USER, jsonEncode(user));
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        print('The account already exists with a different credential.');
        return false;
      } else if (e.code == 'invalid-credential') {
        print('Error occurred while accessing credentials. Try again.');
        return false;
      }
    } catch (e) {
      print(e);
      print('Error occurred using Google Sign-In. Try again.');
      return false;
    }
  }
}

Future<void> signOut({BuildContext context}) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  try {
    if (!kIsWeb) {
      await googleSignIn.signOut();
    }
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print("Error signing out. Try again.");
  }
}

Future<UserAuth> getUserToken() async {
  var ref = await SharedPreferences.getInstance();
  //this will save member data as USER data to access on koperasi list
  //this will get rewritten when chose koperasi from koperasi list
  print(jsonDecode(ref.get(USER).toString()));
  return UserAuth.fromJsonMap(jsonDecode(ref.get(USER).toString()));
}
