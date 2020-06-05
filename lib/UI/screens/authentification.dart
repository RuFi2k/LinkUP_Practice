import 'package:FlutterApp/UI/components/header.dart';
import 'package:FlutterApp/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final AuthService _authService = AuthService();
  final VoidCallback toRegister;

  SignIn({this.toRegister});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: <Widget>[
          Header('Sign In'),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 350,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _mailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    controller: _passController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          color: Color(0xFF7227E5),
                          child: Text('Sign In',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () async {
                            await _authService.signIn(
                                _mailController.text, _passController.text);
                          },
                        ),
                        RaisedButton(
                          color: Color(0xFF7227E5),
                          child: Text('Create an account',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            toRegister();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
