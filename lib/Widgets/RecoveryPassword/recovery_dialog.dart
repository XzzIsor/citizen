import 'package:citizen/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class RecoveryDialog {
  Future<void> showRecoveryDialog(BuildContext context) async {

    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: const RecoveryForm(),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 24,
          );
        });
  }
}