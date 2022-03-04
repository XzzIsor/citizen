import 'package:flutter/material.dart';
import 'dart:math';

class BackgroundMain extends StatelessWidget {
  const BackgroundMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        boxWithGrandient(), 
        smallBoxWithGrandient()
      ],

    );
  }

  Widget boxWithGrandient() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(52, 54, 101, 1),
            Color.fromRGBO(35, 37, 57, 1),
          ],
          begin: FractionalOffset(0, 0.6),
          end: FractionalOffset(0, 1),
        ),
      ),
    );
  }

  Widget smallBoxWithGrandient() {
    Widget smallBox = Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1),
            ],
            begin: FractionalOffset(0, 0.6),
            end: FractionalOffset(0, 1),
          ),
        ));

    return  Positioned(
          top: -100,
          child:Transform.rotate(
            angle: -pi / 4.0,
            child: smallBox,
          )
    );
  }
}
