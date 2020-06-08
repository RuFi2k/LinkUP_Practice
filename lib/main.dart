import 'package:FlutterApp/UI/components/menu.dart';
import 'package:FlutterApp/UI/screens/auth_wrapper.dart';
import 'package:FlutterApp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  _App createState() => _App();
}

class _App extends State<App> {
  int _currentMenuIndex = 0;
  bool keyboardOpen = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() => keyboardOpen = visible);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'App title',
        home: Scaffold(
          backgroundColor: Color(0xFFF4FAFF),
          body: AuthWrapper(
            _currentMenuIndex,
          ),
          bottomNavigationBar: MenuWidget(
            onSelect: (index) {
              setState(() {
                _currentMenuIndex = index;
              });
            },
          ),
          floatingActionButton: keyboardOpen
              ? SizedBox()
              : FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _currentMenuIndex = 2;
                    });
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                  backgroundColor: Color(0xFF7227E5),
                  elevation: 100,
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
