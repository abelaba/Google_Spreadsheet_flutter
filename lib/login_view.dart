import 'package:flutter/material.dart';

import './HomeScreen.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:email_validator/email_validator.dart';

class LoginView extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  _login() async {
    try {
      // await _googleSignIn.signIn();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', "_googleSignIn.currentUser!.email");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _loginForm(),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              _loginButton()
            ],
          ),
        ));
  }

  Widget _loginButton() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: ElevatedButton(
        key: const ValueKey("loginbutton"),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.greenAccent),
            minimumSize: MaterialStateProperty.all<Size>(Size(250, 50))),
        onPressed: () async {
          _login();
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
        },
        child: Text('Login'),
      ),
    );
  }
}
