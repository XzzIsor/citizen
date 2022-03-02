import 'dart:math';

import 'package:flutter/material.dart';

class GoogleSingInButton extends StatelessWidget {
  const GoogleSingInButton(
      {Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black45,
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                  offset: Offset(2, 2))
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _ButtonContent(height: height, width: width),
            const SizedBox(
              width: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('Ingresar con Google'),
            )
          ],
        ),
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width * 0.20,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(96, 101, 211, 1),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topLeft: Radius.circular(10))),
      child: const ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: Image(
            image: AssetImage('assets/google.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
