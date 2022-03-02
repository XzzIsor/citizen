import 'package:flutter/material.dart';

import 'package:citizen/Views/main_page.dart';

import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Database connection in Firebase

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'VollkornSC'),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: MainPage());
  }
}
