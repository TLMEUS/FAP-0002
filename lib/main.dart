/*
 * This file contains the main.dart file for project FAP-0002
 *
 * File Information:
 * Project Name: Phoenix Register Application
 * Project Registry: FAP-0002
 * Section Name: Lib
 * Module Name: <ROOT>
 * File Name: main.dart
 * File Author: Troy L. Marker
 * File Copyright: 10/06/2024
 * Language: Dart: 3.5.3
 *           Flutter: 3.24.3
 */

import 'package:fap_0002/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyActTCbeUwRGdZO8D8jIDzGBbg6SVkcXd8',
      appId: '1:253030714529:android:fed5ba61170b4d33be74e0',
      messagingSenderId: 'sendid',
      projectId: 'phoenix-pos-e7671',
      storageBucket: 'phoenix-pos-e7671.appspot.com',
    ),
  );
  runApp(const Register());
}

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegistrationPage();
  }
}
