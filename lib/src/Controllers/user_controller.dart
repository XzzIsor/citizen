// ignore_for_file: unnecessary_getters_setters, avoid_function_literals_in_foreach_calls

import 'package:citizen/src/Controllers/controllers.dart';
import 'package:citizen/src/Models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserController {
  final firestore = FirebaseFirestore.instance;
  static final List<UserModel> _users = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static UserModel _authUser = UserModel(
      id: 'invalid',
      nombres: 'invalid',
      apellidos: 'invalid',
      direccion: 'invalid',
      email: 'invalid',
      telefono: 'invalid',
      password: 'invalid',
      uid: 'invalid',
      admin: false);

  Future<List<UserModel>> getUsers() async {
    await firestore.collection("user").get().then((snapshot) => {
          snapshot.docs.forEach((element) {
            UserModel user = UserModel.fromMap(element.data());
            _users.add(user);
          })
        });

    return _users;
  }

  Future<void> registerUser({required UserModel user}) async {
    firestore.collection("user").add({
      "apellidos": user.apellidos,
      "direccion": user.direccion,
      "email": user.email,
      "id": user.id,
      "nombres": user.nombres,
      "password": user.password,
      "telefono": user.telefono,
      "uid": user.uid
    });
  }

  UserModel get authUser => _authUser;

  set authUser(UserModel user) {
    _authUser = user;
  }

  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    User? user;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      _setAuthUser(user!.uid);
    } on FirebaseException catch (e) {
      if (e.code == 'invalid-email') {
        ErrorProvider.error = 'El correo no es válido';
      }
      if (e.code == 'user-not-found') {
        ErrorProvider.error = 'El correo no existe';
      }
      if (e.code == 'wrong-password') {
        ErrorProvider.error = 'La contraseña no existe';
      }
    }

    return user;
  }

  void _setAuthUser(String uid) {
    for (UserModel user in _users) {
      if (user.uid == uid) {
        _authUser = user;
      }
    }
  }

  Future<String> registerUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      user!.sendEmailVerification();
      user.reload();
      user = _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ErrorProvider.error = 'La contraseña es muy débil';
      } else if (e.code == 'email-already-in-use') {
        ErrorProvider.error = 'el correo ya está en uso';
      }
    } 
    return user!.uid;
  }

  Future<void> logoutFromFirebase() async {
    _auth.signOut();
  }

  Future<void> sendRecoveryPassword(String email) async {
    try {
      _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/invalid-email') {
        ErrorProvider.error = 'Correo no válido';
      }
      if (e.code == 'auth/user-not-found') {
        ErrorProvider.error = 'El usuario no está registrado';
      }
    }
  }
}
