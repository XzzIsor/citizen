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
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: _borderRadius),
      child: Container(
        height: 20,
        width: width * progress + 30,
        decoration:
            BoxDecoration(color: Colors.green, borderRadius: _borderRadius),
      ),
    );
  }
}
