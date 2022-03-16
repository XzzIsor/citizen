import 'package:citizen/Widgets/widgets.dart';
import 'package:citizen/src/Controllers/controllers.dart';
import 'package:citizen/src/Models/models.dart';


import 'package:flutter/material.dart';

class ProblemView extends StatelessWidget {
  const ProblemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final ProblemModel _problem =
        ModalRoute.of(context)!.settings.arguments as ProblemModel;
    final StorageController _storageController = StorageController();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          SizedBox(
            width: _size.width * 0.35,
            height: _size.height * 0.65,
            child: SingleChildScrollView(
                child: FutureBuilder(
              future: _storageController.getImageFromLink(_problem.multimedia[0]),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return snapshot.hasData
                    ? Column(
                        children: [
                          ImageCard(
                              height: _size.height * 0.3,
                              width: _size.width * 0.3,
                              url: snapshot.data!.toString()),
                          ImageCard(
                              height: _size.height * 0.3,
                              width: _size.width * 0.3,
                              url: snapshot.data!.toString()),
                          ImageCard(
                              height: _size.height * 0.3,
                              width: _size.width * 0.3,
                              url: snapshot.data!.toString()),
                          ImageCard(
                              height: _size.height * 0.3,
                              width: _size.width * 0.3,
                              url: snapshot.data!.toString()),
                          ImageCard(
                              height: _size.height * 0.3,
                              width: _size.width * 0.3,
                              url: snapshot.data!.toString()),
                        ],
                      )
                    : CircularProgressIndicator(
                        color: Colors.deepPurple[900],
                      );
              },
            )),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: _size.height * 0.65,
              width: _size.width * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _problem.titulo,
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Text(
                    _problem.descripcion,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: _size.height * 0.02,),
                  Text(
                    'Dirección: ' + _problem.direccion,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    maxLines: 20,
                  ),
                  SizedBox(height: _size.height * 0.02,),
                  Text(
                    'Autor: ' + _problem.escritor,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    maxLines: 20,
                  ),
                  SizedBox(height: _size.height * 0.02,),
                  Text(
                    'Trazo: ' + _problem.progreso,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    maxLines: 20,
                  ),
                  SizedBox(height: _size.height * 0.02,),
                  Text(
                    'Progreso: ' + _problem.estado + "%",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    maxLines: 20,
                  ),
                  SizedBox(height: _size.height * 0.01),
                  ProgressBar(progress: double.parse(_problem.estado)*0.01, width: _size.width * 0.25),
                ],
              ),
            ),
          ),
          SizedBox(width: _size.width*0.03,),
          MapBoxWeb(problem: _problem, height: _size.height*0.5, width: _size.width*0.25)
        ],
      ),
    );
  }
}
