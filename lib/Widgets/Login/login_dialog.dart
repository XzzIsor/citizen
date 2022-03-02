import 'package:citizen/Widgets/Login/login_form.dart';
import 'package:flutter/material.dart';

class LoginDialog {
  Future<void> showLoginDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue[800],
            content: const LoginForm(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            elevation: 24,
          );
        });
  }
}
