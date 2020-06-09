import 'package:FlutterApp/UI/components/have_account_title.dart';
import 'package:FlutterApp/UI/screens/auth_wrapper.dart';
import 'package:FlutterApp/services/auth.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatefulWidget {
  final VoidCallback toLogin;
  RegisterBody(this.toLogin, {Key key}) : super(key: key);

  _RegisterBody createState() => _RegisterBody();
}

class _RegisterBody extends State<RegisterBody> {
  final AuthService _auth = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              controller: _passwordController,
              obscureText: true,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Repeat password'),
              controller: _repeatPasswordController,
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
                        await _auth.register(
                            _emailController.text, _passwordController.text);
                        print('account registered');
                        await _auth.signIn(
                            _emailController.text, _passwordController.text);
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
            HaveAccountTitle(widget.toLogin),
          ],
        ),
      ),
    );
  }
}
