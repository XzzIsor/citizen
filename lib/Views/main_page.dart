import 'package:citizen/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BackgroundMain(),
        Column(
          children: const [
            HeaderMain(),
            SizedBox(height: 150),
            InProgressBlock(),
            SizedBox(
              height: 50,
            ),
            ScrollHorizontal()
          ],
        )
      ],
    ));
  }
}
