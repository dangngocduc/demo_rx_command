import 'package:demo_rx_command/ui/authorize_page.dart';
import 'package:flutter/material.dart';

import 'locator.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: AuthorizePage(),
    );
  }
}
