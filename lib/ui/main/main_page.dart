import 'dart:developer' as developer;
import 'package:demo_rx_command/blocs/auth_bloc.dart';
import 'package:demo_rx_command/locator.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static const ROUTE_NAME = 'MainPage';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const TAG = 'MainPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: OutlineButton(
          onPressed: (){
            locator.get<AuthBloc>().isAuthorized.call(false);
          },
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}
