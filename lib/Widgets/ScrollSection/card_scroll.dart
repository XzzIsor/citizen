import 'package:citizen/Widgets/image_card.dart';
import 'package:citizen/src/Controllers/controllers.dart';
import 'package:citizen/src/Models/models.dart';

import 'package:flutter/material.dart';

class ScrollCard extends StatelessWidget {
  ScrollCard({Key? key, required this.problem}) : super(key: key);

  final ProblemModel problem;

  final StorageController _storageController = StorageController();
  final ProblemProvider _problemProvider = ProblemProvider();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        _problemProvider.selectedProblem = problem;
        Navigator.pushReplacementNamed(context, 'problem', arguments: problem);
      },
      child: FutureBuilder(
          future: _storageController.getImageFromLink(problem.multimedia[0]),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: snapshot.hasData
                    ? Column(
                        children: [
                          ImageCard(
                            url: snapshot.data!.toString(),
                            height: size.height * 0.15,
                            width: size.width * 0.15,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            problem.titulo,
                            style: const TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(
                            color: Colors.deepPurple[900])));
          }),
    );
  }
}
