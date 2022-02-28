import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.height, required this.width}) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        height: height,
        width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network('https://static.elcomercio.es/www/multimedia/202001/04/media/cortadas/mapache-kOCE-U901125707129BHC-624x385@El%20Comercio.jpg', 
            fit: BoxFit.cover,
          )
        ));
  }
}
