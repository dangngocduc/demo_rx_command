import 'dart:developer' as developer;
import 'package:demo_rx_command/blocs/auth_bloc.dart';
import 'package:demo_rx_command/locator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const ROUTE_NAME = 'SplashPage';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const TAG = 'SplashPage';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locator.get<AuthBloc>().fetchStateLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 56,),
      ),
    );
  }
}
