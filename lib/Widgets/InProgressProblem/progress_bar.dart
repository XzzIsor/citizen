import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key, required this.progress, required this.width})
      : super(key: key);
  final double progress;
  final double width;
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry _borderRadius = BorderRadius.circular(50);
    return Container(
      height: 20,
      width: width,
      alignment: Alignment.centerLeft,
      decoration:BoxDecoration(
        color: Colors.white, 
        borderRadius: _borderRadius,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2.0,
            spreadRadius: 5.0,
            offset: Offset(4, 5)
          )
        ]
      ),
      child: Container(
        height: 20,
        width: width * progress,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 69, 24, 175),
                Color.fromARGB(255, 128, 29, 209)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
          borderRadius: _borderRadius),
      ),
    );
  }
}
