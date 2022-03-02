import 'package:citizen/Widgets/image_card.dart';
import 'package:flutter/material.dart';

class ScrollCard extends StatelessWidget {
  const ScrollCard({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ImageCard(height: size.height * 0.15, width: size.width * 0.15),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
