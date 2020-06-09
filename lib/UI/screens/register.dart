import 'package:FlutterApp/UI/components/header.dart';
import 'package:FlutterApp/UI/components/register_body.dart';
import 'package:FlutterApp/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final AuthService _auth = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final VoidCallback toLogin;

  Register({this.toLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Header('Create an account'),
          RegisterBody(toLogin),
        ],
      ),
    );
  }
}
