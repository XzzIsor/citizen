
import 'package:citizen/Widgets/log_header.dart';
import 'package:flutter/material.dart';

import 'package:citizen/Widgets/widgets.dart';

class LogMainPage extends StatelessWidget {
  const LogMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Stack(
        children: [
          const BackgroundMain(),
          Column(
            children: const [
              LogHeader(),
              SizedBox(height: 150),
              InProgressBlock(),
              SizedBox(
                height: 50,
              ),
              CategorySection()
            ],
          )
        ],
      )
    );
  }
}