import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.height, required this.width, required this.url})
      : super(key: key);

  final double height;
  final double width;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  spreadRadius: 5.0,
                  offset: Offset(4, 7))
            ]),
        height: height,
        width: width,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              url,
              fit: BoxFit.cover,
            )));
  }
}
