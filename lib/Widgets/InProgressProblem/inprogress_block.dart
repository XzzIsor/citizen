import 'package:citizen/Widgets/widgets.dart';
import 'package:citizen/src/Controllers/controllers.dart';
import 'package:citizen/src/Models/models.dart';
import 'package:flutter/material.dart';

class InProgressBlock extends StatelessWidget {
  const InProgressBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size _size = MediaQuery.of(context).size;
    const TextStyle _textStyle = TextStyle(color: Colors.white, fontSize: 22);
    final double _height = _size.height * 0.3;
    ProblemController _problemController = ProblemController();

    return Container(
      height: _height,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          InProgressCard(height: _height, width: _size.width * 0.3, problemModel: _problemController.fixedProblem),
          const SizedBox(width: 25),
          infoColumn(_textStyle, _height, _size.width * 0.3, _problemController.fixedProblem)
        ],
      ),
    );
  }

  Widget infoColumn(TextStyle textStyle, double height, double width, ProblemModel problem) {
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            problem.titulo,
            style: const TextStyle(color: Colors.white, fontSize: 35),
          ),
          SizedBox(height: height * 0.1),
          SizedBox(
            width: width,
            child: Text(
              problem.descripcion,
              style: textStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: height * 0.1),
          ProgressBar(progress: double.parse(problem.estado)*0.01, width: width),
          const SizedBox(height: 5),
          Text(
            'Progreso',
            style: textStyle,
          )
        ],
      ),
    );
  }
}
