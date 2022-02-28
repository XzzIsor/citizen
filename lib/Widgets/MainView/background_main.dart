import 'package:flutter/material.dart';

class BackgroundMain extends StatelessWidget {
  const BackgroundMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.78),
      ),
    );
  }
}
