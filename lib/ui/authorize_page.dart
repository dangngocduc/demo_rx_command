import 'dart:developer' as developer;
import 'package:demo_rx_command/blocs/auth_bloc.dart';
import 'package:demo_rx_command/locator.dart';
import 'package:demo_rx_command/ui/auth/auth_navigation.dart';
import 'package:demo_rx_command/ui/main/main_page.dart';
import 'package:flutter/material.dart';

import 'splash_page.dart';

class AuthorizePage extends StatelessWidget {
  static const TAG = 'AuthorizePage';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        builder: (context, snap) {
          if (snap.data == null) return SplashPage();
          if (snap.data) {
            return MainPage();
          } else {
            return  AuthNavigation();
          }
        },
      stream: locator.get<AuthBloc>().isAuthorized.asBroadcastStream(),
    );
  }
}
