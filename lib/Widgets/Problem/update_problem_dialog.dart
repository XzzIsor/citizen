import 'package:citizen/Widgets/widgets.dart';

import 'package:flutter/material.dart';
import '../../src/Models/models.dart';

class UpdateProblemDialog {
  Future<void> showProblemDialog(BuildContext context, ProblemModel problem) async {

    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: UpdateProblemForm(problem: problem),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 24,
          );
        });
  }
}