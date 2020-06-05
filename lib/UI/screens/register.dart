import 'package:FlutterApp/UI/components/header.dart';
import 'package:FlutterApp/UI/screens/auth_wrapper.dart';
import 'package:FlutterApp/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final AuthService _auth = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();
  final VoidCallback toLogin;

  Register({this.toLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _registerFormKey,
        child: Column(
          children: <Widget>[
            Header('Create an account'),
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
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      controller: _passwordController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Repeat password'),
                      controller: _repeatPasswordController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RaisedButton(
                            color: Color(0xFF7227E5),
                            child: Text('Create an account',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () async {
                              print('register started');
                              if (_passwordController.text ==
                                  _repeatPasswordController.text) {
                                print('passwords same');
                                await _auth.register(_emailController.text,
                                    _passwordController.text);
                                print('account registered');
                                await _auth.signIn(_emailController.text,
                                    _passwordController.text);
                                print('logged in');
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AuthWrapper(0)));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Already have an account?'),
                    ),
                    FlatButton(
                      onPressed: () {
                        toLogin();
                      },
                      child: Text('Sign in',
                          style: TextStyle(color: Color(0xFF7227E5))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
