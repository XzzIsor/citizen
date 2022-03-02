import 'package:citizen/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class SingInDialog {
  Future<void> showSingInDialog(BuildContext context) async {
    final Size _size = MediaQuery.of(context).size;

    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromRGBO(96, 101, 211, 1),
            content: Container(
              width: _size.width * 0.16,
              height: _size.height * 0.1,
              child: Column(
                children: [
                  const Text('Registrarse Con Google', style: TextStyle(fontSize: 15),),
                  const SizedBox(height: 15),
                  GoogleSingInButton(height: _size.height * 0.06, width: _size.width * 0.15),
                ],
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 24,
          );
        });
  }
}
