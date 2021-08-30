import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majoo_test/model/DB/dbHelper.dart';
import 'package:majoo_test/model/initalData/people.dart';
import 'package:majoo_test/repositories/initDataRepo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BerandaBloc extends Bloc<int, List<Poeple>> {
  BerandaBloc() : super([]);

  List<Poeple> _myList = [];
  int _countData = 0;
  List<Poeple> get dataList => _myList;

  @override
  Stream<List<Poeple>> mapEventToState(int event) async* {
    if (event == 0) {
      var listData = this.select();
    }

    yield _myList;
  }

  fetchAllTodo() async* {
    _myList = await reqInitData();
    yield _myList;
  }

  Future<List<Map<String, dynamic>>> select() async {
    DbHelper dbHelper = DbHelper();
    Database db = await dbHelper.database;

    var mapList = await db.query('org', orderBy: 'name');
    return mapList;
  }
}
