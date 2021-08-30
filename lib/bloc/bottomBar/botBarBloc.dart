import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majoo_test/model/DB/dbHelper.dart';
import 'package:majoo_test/repositories/initDataRepo.dart';

class BotBarBloc extends Bloc<int, int> {
  BotBarBloc() : super(0);

  int _indexElement = 0;

  int get CurrentIndex => _indexElement;

  @override
  Stream<int> mapEventToState(int event) async* {
    if (event == 0) {
      _indexElement = 0;
    } else if (event == 1) {
      _indexElement = 1;
    } else if (event == 2) {
      _indexElement = 2;
    }

    yield _indexElement;
  }
}
