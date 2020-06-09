import 'package:FlutterApp/UI/components/header.dart';
import 'package:FlutterApp/UI/components/sign_in_body.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final VoidCallback toRegister;

  SignIn({this.toRegister});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Header('Sign In'),
            SignInBody(toRegister: toRegister),
          ],
        ),
      ],
    );
  }
}
