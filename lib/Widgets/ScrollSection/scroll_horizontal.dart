import 'package:citizen/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class ScrollHorizontal extends StatelessWidget {
  const ScrollHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width * 0.6,
      height: _size.height * 0.4,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ScrollCard(title: 'Titulo'),
          ScrollCard(title: 'Titulo'),
          ScrollCard(title: 'Titulo'),
          ScrollCard(title: 'Titulo'),
          ScrollCard(title: 'Titulo'),
          ScrollCard(title: 'Titulo'),
        ],
      ),
    );
  }
}
