import 'package:flutter/material.dart';

class StateRecoveryDialog {
  Future<void> showStateRecoveryDialog(BuildContext context, String message) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(241, 142, 172, 1),
                      Color.fromRGBO(236, 98, 188, 1),
                    ],
                  )),
              child: Text(message, style: const TextStyle(color: Colors.white)),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 24,
          );
        });
  }
}
