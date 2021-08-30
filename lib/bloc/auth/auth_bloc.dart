import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majoo_test/repositories/authRepo.dart';

class AuthBloc extends Bloc<bool, bool> {
  AuthBloc() : super(false);

  @override
  Stream<bool> mapEventToState(bool event) async* {
    if (event == true) {
      var result = await signInWithGoogle();
      if (result == true) {
        yield true;
      } else {
        yield false;
      }
    }
  }
}
