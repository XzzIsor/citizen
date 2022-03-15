import 'package:citizen/Widgets/RegisterProblem/inital_data_problem_form.dart';
import 'package:citizen/Widgets/log_header.dart';
import 'package:citizen/Widgets/widgets.dart';

import 'package:flutter/material.dart';

class RegisterProblemPage extends StatelessWidget {
  const RegisterProblemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundMain(),
          Column(
            children: [
              const LogHeader(),
              const SizedBox(height: 50),
              InitialProblemDataForm()
            ],
          ),
        ],

      ),
    );
  }
}