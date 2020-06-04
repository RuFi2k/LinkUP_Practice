import 'package:FlutterApp/UI/components/header.dart';
import 'package:FlutterApp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  FirebaseUser _user;

  final AuthService _auth = AuthService();

  Account(FirebaseUser user) {
    _user = user;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Header('Account details'),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            width: 350,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                    child: Icon(
                  Icons.person,
                  size: 100,
                  color: Color(0xFF3D02A0).withOpacity(0.5),
                )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Email'),
                      Text(
                        //_user.email,
                        'filyk31@gmail.com',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Unique hash'),
                      Text(
                        //_user.email,
                        'RYJJ55ARY2M8AARY',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text(
                    'Log out',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xFFE13131),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
