import 'package:citizen/Widgets/Problem/problem_view.dart';
import 'package:citizen/Widgets/log_header.dart';
import 'package:citizen/Widgets/widgets.dart';
import 'package:citizen/src/Controllers/controllers.dart';

import 'package:flutter/material.dart';

class ProblemPage extends StatelessWidget {
  const ProblemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController _userController = UserController();

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundMain(),
          Column(
            children: [
              _userController.authUser.id != 'invalid' ? const LogHeader() : const HeaderMain(),
              const SizedBox(height: 150),
              ProblemView()
            ],

          ),
        ]
      )
    );
  }
}