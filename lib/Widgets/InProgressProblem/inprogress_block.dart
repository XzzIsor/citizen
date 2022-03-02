import 'package:citizen/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class InProgressBlock extends StatelessWidget {
  const InProgressBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    const TextStyle _textStyle = TextStyle(color: Colors.white, fontSize: 22);
    final double _height = _size.height * 0.3;

    return Container(
      height: _height,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ImageCard(height: _height, width: _size.width * 0.3),
          const SizedBox(width: 25),
          infoColumn(_textStyle, _height, _size.width * 0.3)
        ],
      ),
    );
  }

  Widget infoColumn(TextStyle textStyle, double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Titulo',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        SizedBox(height: height * 0.1),
        Text(
          'Descripción \n Descripción \n Descripción \n',
          style: textStyle,
        ),
        SizedBox(height: height * 0.1),
        ProgressBar(progress: 0.5, width: width),
        const SizedBox(height: 5),
        Text(
          'Progreso',
          style: textStyle,
        )
      ],
    );
  }
}
