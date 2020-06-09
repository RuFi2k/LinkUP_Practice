import 'package:flutter/material.dart';

class HaveAccountTitle extends StatelessWidget {
  final VoidCallback toLogin;

  HaveAccountTitle(this.toLogin);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text('Already have an account?'),
        ),
        FlatButton(
          onPressed: () {
            toLogin();
          },
          child: Text('Sign in', style: TextStyle(color: Color(0xFF7227E5))),
        )
      ],
    );
  }
}
