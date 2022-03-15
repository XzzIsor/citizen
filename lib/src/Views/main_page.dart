import 'package:citizen/Widgets/log_header.dart';
import 'package:citizen/src/Controllers/controllers.dart';
import 'package:flutter/material.dart';

import 'package:citizen/Widgets/widgets.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
            children: [
              const BackgroundMain(),
              Column(
                children: [
                  _userController.authUser.id != 'invalid'
                      ? const LogHeader()
                      : const HeaderMain(),
                  const SizedBox(height: 150),
                  const InProgressBlock(),
                  const SizedBox(height: 50),
                  const CategorySection()
                ],
              )
            ],
          ),
        );
  }
}
