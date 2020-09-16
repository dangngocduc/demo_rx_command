import 'dart:developer' as developer;
import 'package:demo_rx_command/blocs/auth_bloc.dart';
import 'package:demo_rx_command/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rx_command/rx_command.dart';

class SignInPage extends StatefulWidget {
  static const ROUTE_NAME = 'SignInPage';
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  static const TAG = 'SignInPage';
  String userName;
  String password;
  RxCommand<void, dynamic> signInCommand;

  @override
  void initState() {
    super.initState();
    signInCommand = RxCommand.createAsyncNoParam(() => locator.get<AuthBloc>().signIn(userName, password));
  }

  bool get isInvalidLogin => (userName?.isNotEmpty ?? false)
      && (password?.isNotEmpty ?? false);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person_outline),
                  filled: true
              ),
              autocorrect: false,
              enableSuggestions: false,
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
            ),
            SizedBox(height: 16,),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  filled: true
              ),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            SizedBox(height: 16,),
            StreamBuilder<bool>(
                builder: (context, snap) {
                  if (snap.data == false) {
                    return FlatButton(
                      onPressed: isInvalidLogin ? () {
                        signInCommand.call();
                      } : null,
                      child: Text('Sign In', style: Theme.of(context).textTheme.subtitle1,),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      color: Colors.blue[900],
                      disabledColor: Colors.blue[900].withOpacity(0.26),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))
                      ),
                    );
                  } else {
                    return FlatButton(
                      child: CupertinoActivityIndicator(),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      color: Colors.blue[900],
                      disabledColor: Colors.blue[900].withOpacity(0.26),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))
                      ),
                    );
                  }
                },
                stream: signInCommand.isExecuting,
            )
          ],
        ),
      ),
    );
  }
}


