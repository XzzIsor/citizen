import 'package:flutter/material.dart';

class BackgroundMain extends StatelessWidget {
  const BackgroundMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(5, 0, 255, 0.88),
            Color.fromRGBO(105, 139, 227, 0.93)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
      ),
    );
  }
}
