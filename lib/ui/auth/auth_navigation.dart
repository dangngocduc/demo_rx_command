import 'dart:developer' as developer;
import 'package:demo_rx_command/ui/auth/sign_in_page.dart';
import 'package:flutter/material.dart';

class AuthNavigation extends StatefulWidget {
  static const ROUTE_NAME = 'AuthNavigation';
  @override
  _AuthNavigationState createState() => _AuthNavigationState();
}

class _AuthNavigationState extends State<AuthNavigation> {
  static const TAG = 'AuthNavigation';
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => SignInPage());
      },
    );
  }
}
