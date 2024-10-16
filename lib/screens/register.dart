/*
 * This file contains the screens/register.dart file for project FAP-0002
 *
 * File Information:
 * Project Name: Phoenix Host Application
 * Project Registry: FAP-0002
 * Section Name: Screens
 * File Name: register.dart
 * File Author: Troy L. Marker
 * File Copyright: 10/06/2024
 * Language: Dart: 3.5.3
 *           Flutter: 3.24.3
 */

import 'package:fap_0002/core/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email = "";
  String password = "";
  String errorMessage = '';

  get newUser => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Image(
                image: AssetImage('images/logo.png'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Register a Section',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.redAccent,
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                ),
                onChanged: (value) {
                  email = '$value@domain.com';
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter the section name.'),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                ),
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter the section password.'),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {}

                    setState(() {
                      showSpinner = false;
                    });
                  } on FirebaseAuthException catch (e) {
                    switch (e.code) {
                      case 'email-already-in-use':
                        errorMessage = 'The section exists';
                        break;
                      case 'operation-not-allowed':
                        errorMessage = 'Operation not allowed.';
                        break;
                      case 'weak-password':
                        errorMessage = 'You entered a weak password.';
                        break;
                      default:
                        errorMessage = 'Section Created';
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }
                  print(errorMessage);
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
