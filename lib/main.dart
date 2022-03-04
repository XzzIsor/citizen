
import 'package:citizen/src/Controllers/UserController.dart';
import 'package:citizen/src/Models/models.dart';
import 'package:flutter/material.dart';

import 'package:citizen/src/Views/main_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Database connection in Firebase

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB_8IwlGph0JJQWtt_7hkx4DXnXqAC-dUM",
          appId: "1:769398598023:web:8d3da48abaa36a74b50b22",
          messagingSenderId: "769398598023",
          projectId: "citizendb20"));

  UserController _userController = UserController();
  List<UserModel> users = await _userController.getUsers();;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'VollkornSC'),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const MainPage());
  }
}
