import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majoo_test/model/DB/dbHelper.dart';
import 'package:majoo_test/model/initalData/people.dart';
import 'package:sqflite/sqflite.dart';

class OrgBloc extends Bloc<Poeple, Poeple> {
  OrgBloc(Poeple initialState) : super(initialState);

  void addPeople(Poeple object) async {
    DbHelper dbHelper = DbHelper();
    int result = await dbHelper.insert(
      object: object,
    );
    if (result > 0) {
      print("insert sukses");
    }
  }

//edit contact
  void editPeople(Poeple object) async {
    DbHelper dbHelper = DbHelper();
    int result = await dbHelper.update(object: object);
    if (result > 0) {
      print("edit sukses");
    }
  }

//delete contact
  void deletePeople(Poeple object) async {
    DbHelper dbHelper = DbHelper();
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      print("delete sukses");
    }
  }

  @override
  Stream<Poeple> mapEventToState(Poeple event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
