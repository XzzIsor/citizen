import 'package:citizen/Widgets/widgets.dart';
import 'package:citizen/src/Controllers/controllers.dart';
import 'package:citizen/src/Models/models.dart';
import 'package:flutter/material.dart';

class InProgressCard extends StatelessWidget {
  InProgressCard(
      {Key? key,
      required this.height,
      required this.width,
      required this.problemModel})
      : super(key: key);

  final double height;
  final double width;
  final ProblemModel problemModel;
  final StorageController _storageController = StorageController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FutureBuilder(
        future: _storageController.getImageFromLink(problemModel.multimedia),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return snapshot.hasData
              ? ImageCard(
                  url: snapshot.data!.toString(),
                  height: height,
                  width: width,
                )
              : CircularProgressIndicator(color: Colors.deepPurple[900]);
        },
      ),
      onTap: () {
        Navigator.pushNamed(context, 'problem', arguments: problemModel);
      },
    );
  }
}
