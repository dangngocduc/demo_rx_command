import 'dart:developer' as developer;

import 'package:rx_command/rx_command.dart';
import 'package:tuple/tuple.dart';

class AuthBloc {
  static const TAG = 'AuthBloc';

  RxCommand<bool, bool> isAuthorized;

  AuthBloc() {
    developer.log('AuthBloc []', name: TAG);
    isAuthorized = RxCommand.createSync<bool, bool>((param) => param);
  }

  void fetchStateLogin() {
    Future.delayed(Duration(seconds: 2)).then((value){
      isAuthorized.call(false);
    });
  }

  Future signIn(String userName, String password) async {
    await Future.delayed(Duration(seconds: 2));
    isAuthorized.call(true);
    return true;
  }
}