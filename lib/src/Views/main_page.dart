import 'package:citizen/Widgets/log_header.dart';
import 'package:citizen/src/Controllers/controllers.dart';
import 'package:flutter/material.dart';

import 'package:citizen/Widgets/widgets.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final UserController _userController = UserController();
  final ProblemController _problemController = ProblemController();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundMain(),
          Column(
            children: [
              _userController.authUser.id != 'invalid'
                  ? const LogHeader()
                  : const HeaderMain(),
              Row(
                children: [
                  Column(
                    children: const [
                      SizedBox(height: 150),
                      InProgressBlock(),
                      SizedBox(height: 50),
                      CategorySection()
                    ],
                  ),
                  MapBoxWeb(
                    problem: _problemController.fixedProblem, 
                    height: _size.height*0.75, 
                    width: _size.width*0.34,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
