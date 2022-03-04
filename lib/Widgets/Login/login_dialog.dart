import 'package:citizen/Widgets/Login/login_form.dart';
import 'package:flutter/material.dart';

class LoginDialog {
  Future<void> showLoginDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            backgroundColor: Colors.transparent,
            content: LoginForm(), 
            
            elevation: 24,
          );
        });
  }
}
